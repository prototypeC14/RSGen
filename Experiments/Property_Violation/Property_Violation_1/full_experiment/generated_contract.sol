//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract _MAIN_ {
    uint public a;
    uint public b;

    function set() public {
        a = 3;
        b = 0;
    }

    function check() public {
        uint _a = 0;
        set();
        _a = this.a();
        assert(_a == 3);

        assert(_a == 4);
    }
}

interface MainContract {
    function set() external;
    function check() external;
}

contract Reproduction {
    MainContract public main;

    constructor(address mainAddress) {
        main = MainContract(mainAddress);
    }

    function trigger() public {
        main.set();
        main.check();
    }
}