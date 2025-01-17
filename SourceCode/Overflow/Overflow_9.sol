//https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-101#overflow-simple-addsol
pragma solidity 0.4.25;

contract Overflow_Add {
    uint public balance = 1;

    function add(uint256 deposit) public {
        // <yes> <report> ARITHMETIC
        balance += deposit;
    }
}
