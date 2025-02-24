//https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/integer_overflow_and_underflow/integer_overflow_minimal.sol
pragma solidity ^0.8.19;

contract IntegerOverflowMinimal {
    uint public count = 1;

    function run(uint256 input) public {
        // <yes> <report> ARITHMETIC
        count -= input;
    }
}
