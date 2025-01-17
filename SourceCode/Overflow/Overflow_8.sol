//https://github.com/ConsenSys/evm-analyzer-benchmark-suite
pragma solidity ^0.4.23;

contract IntegerOverflowMultiTxOneFuncFeasible {
    uint256 private initialized = 0;
    uint256 public count = 1;

    function run(uint256 input) public {
        if (initialized == 0) {
            initialized = 1;
            return;
        }
        // <yes> <report> ARITHMETIC
        count -= input;
    }
}