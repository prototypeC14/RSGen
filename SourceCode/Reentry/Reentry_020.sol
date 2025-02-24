//http://blockchain.unica.it/projects/ethereum-survey/attacks.html#simpledao
pragma solidity ^0.8.2;

contract SimpleDAO {
  mapping (address => uint) public credit;

  function donate(address to) public payable {
    credit[to] += msg.value;
  }

  function withdraw(uint amount) public {
    if (credit[msg.sender]>= amount) {
      // <yes> <report> REENTRANCY
      (bool success, ) = msg.sender.call{value: amount}("");
      credit[msg.sender]-=amount;
    }
  }

  function queryCredit(address to) public view returns (uint){
    return credit[to];
  }
}