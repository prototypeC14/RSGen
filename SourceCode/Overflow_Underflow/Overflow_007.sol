//https://github.com/ConsenSys/evm-analyzer-benchmark-suite
pragma solidity ^0.8.23;

contract IntegerOverflowMultiTxMultiFuncFeasible {
    uint256 private initialized = 0;
    uint256 public count = 1;

    function init() public {
        initialized = 1;
    }

    function run(uint256 input) public {
        if (initialized == 0) {
            return;
        }
        // <yes> <report> ARITHMETIC
        count -= input;
    }
}



