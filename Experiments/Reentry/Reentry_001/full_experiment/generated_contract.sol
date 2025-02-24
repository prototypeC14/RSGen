//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Bank {
    mapping (address => uint) balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        require(amount > 0);
        require(amount <= balances[msg.sender]);

        balances[msg.sender] -= amount;

        (bool success,) = msg.sender.call{value: amount}("");
        require(success);
    }
    function invariant(uint choice, uint u1, address a) public payable {
        uint currb = balances[a];
        if (choice == 0) {
            deposit();
        } else if (choice == 1) {
            withdraw(u1);
        } else {
            require(false);
        }
        uint newb = balances[a];

        require(newb < currb);
        assert(choice == 1);
        assert(msg.sender == a);
}
}

contract Exploit {
    Bank public target;

    constructor(address _target) {
        target = Bank(_target);
    }

    function exploit(uint depositAmount, uint withdrawAmount, uint choice) public payable {
        require(choice == 0 || choice == 1, "Invalid choice");
        require(msg.value == depositAmount, "Incorrect deposit value");

        // Step 1: Deposit funds into the target contract
        target.deposit{value: msg.value}();

        // Step 2: Withdraw funds or perform another operation based on choice
        if (choice == 1) {
            target.withdraw(withdrawAmount);
        }

        // Step 3: Invoke the invariant to trigger the assertion violation
        target.invariant(choice, withdrawAmount, address(this));
    }

    // Allow contract to receive Ether
    receive() external payable {}
}