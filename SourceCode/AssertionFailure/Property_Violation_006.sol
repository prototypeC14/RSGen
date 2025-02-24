//https://github.com/ntu-SRSLab/SolSEE/blob/main/dataset/SMTChecker
//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract Bank {

    uint public totalSupply;

    constructor() public {
        totalSupply = 100;
    }

    function test(uint x, uint y) public returns (bool r) {
        totalSupply  = 90;

        if(x <= y) {
            revert("x is not greater than y!!");
        }

        r = true;
    }

    function getTotalSupply() public returns (uint) {
        return totalSupply;
    }
}

contract _MAIN_ {
    Bank bank;

    uint $a = 20;
    uint $b = 24;
    bool res;

    uint t = 0;

    constructor () public {
        bank = new Bank();

        res = bank.test($a, $b);
        t = bank.getTotalSupply();

        // The following two assertions always hold
        assert($a > $b || t == 100);    // check if $a <= $b, then t == 100
        assert($a <= $b || t == 90);    // check if $a > $b, then t == 90

        // The following assertion doesn't hold,
        // (t == 100 || t == 90) is true
        assert(t > 100);
    }
}