//https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/integer_overflow_and_underflow/integer_overflow_benign_1.sol
pragma solidity ^0.8.19;

contract IntegerOverflowBenign1 {
    uint public count = 1;

    function run(uint256 input) public {
        // <yes> <report> ARITHMETIC
        uint res = count - input;
    }
}