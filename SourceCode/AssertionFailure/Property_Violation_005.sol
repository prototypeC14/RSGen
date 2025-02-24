//https://github.com/ntu-SRSLab/SolSEE/blob/main/dataset/SMTChecker
//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract _MAIN_ {
    uint $a = 20;
    uint $b = 24;
    bool res;

    uint t = 0;

    uint public totalSupply;

    constructor () public {
        totalSupply = 100;

        res = test($a, $b);
        t = getTotalSupply();

        assert($a > $b || t == 100);   
        assert($a <= $b || t == 90);    

        assert($a > $b || t != 100);
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