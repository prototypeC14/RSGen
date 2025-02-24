//https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-101#overflow-simple-addsol
pragma solidity ^0.8.23;

contract Overflow_Add {
    uint public balance = 1;

    function add(uint256 deposit) public {

        balance += deposit;
    }
}
