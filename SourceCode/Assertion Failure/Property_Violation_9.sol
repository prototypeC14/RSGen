//https://github.com/ntu-SRSLab/SolSEE/blob/main/dataset/SMTChecker
//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Bank {
    uint[5] a;
    uint b;

    struct Happy {
        uint cc;
        uint dd;
    }

    Happy gg;

    function test() public {
        Happy memory happy;
        happy.cc = 1;
        happy.dd = 2;

        // The following assertion always holds
        assert(happy.cc + happy.dd == 3);
        // The following assertion doesn't hold,
        // (happy.cc + happy.dd == 3) is true
        assert(happy.cc + happy.dd == 4);

        gg.cc = happy.cc;
        gg.dd = 4;
    }

}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}