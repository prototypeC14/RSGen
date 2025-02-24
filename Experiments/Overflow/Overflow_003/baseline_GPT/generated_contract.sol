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
    fallback () external {
        a = a + 1;
    }
}


contract ReproduceVulnerability {
    Bank public target;

    constructor(address targetAddress) {
        target = Bank(targetAddress);
    }

    function exploit() public {
        uint valueA = target.a();
        uint valueB = target.b();
        target.transfer(valueA, valueB);
    }
}

interface Bank {
    function a() external view returns (uint);
    function b() external view returns (uint);
    function transfer(uint _a, uint _b) external returns (uint);
}