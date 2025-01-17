//https://github.com/ntu-SRSLab/SolSEE/blob/main/dataset/SMTChecker
//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract _MAIN_ {
    constructor () public {
        uint8 a = 255;
        uint8 b = 255;

        uint8 c = a + b;

        // The following two assertions always holds
        assert(c == 254);
        assert(c == a + b);
        // The following assertion doesn't hold,
        // (c <= 255) is true
        assert(c > 255);

    }
}