//https://github.com/ntu-SRSLab/SolSEE/blob/main/dataset/SMTChecker
//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Bank {
    uint public a;
    uint public b;

    constructor () public {
        a = 3;
        b = 0;
    }
}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        uint a = 0;
        a = bank.a();
        assert(a == 3);

        assert(a == 4);
    }
}



