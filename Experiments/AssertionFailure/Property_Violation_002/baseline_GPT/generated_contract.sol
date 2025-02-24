//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract Reproduction {
    Bank public bank;

    constructor() {
        bank = new Bank();
    }

    function trigger() public {
        uint a = bank.a();
        require(a == 3, "Initial state check failed");
        require(a == 4, "Re-triggering the vulnerability");
    }
}

contract Bank {
    uint public a;
    uint public b;

    constructor() {
        a = 3;
        b = 0;
    }
}