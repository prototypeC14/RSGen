//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Bank {
    uint public a;
    uint public b;

    constructor () public {
        a = 3;
        b = 0;
    }
    function transfer(uint _a, uint _b) public returns(uint) {
        return _a + _b;
    }
}

contract Exploit {
    Bank public target;

    constructor(address _target) {
        target = Bank(_target);
    }

    function triggerOverflow() public {
        uint _a = 1;
        uint _b = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
        target.transfer(_a, _b);
    }
}