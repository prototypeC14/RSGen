 //https://github.com/sigp/solidity-security-blog
 pragma solidity ^0.8.10;
 
 contract TimeLock {

     mapping(address => uint) public balances;
     mapping(address => uint) public lockTime;

     function deposit() public payable {
         balances[msg.sender] += msg.value;
         lockTime[msg.sender] = block.timestamp + 1 weeks;
     }

     function increaseLockTime(uint _secondsToIncrease) public {

         lockTime[msg.sender] += _secondsToIncrease;
     }

     function withdraw() public {
         require(balances[msg.sender] > 0);
         require(block.timestamp > lockTime[msg.sender]);
         uint transferValue = balances[msg.sender];
         balances[msg.sender] = 0;
         payable(msg.sender).transfer(transferValue);
     }
 }