//B. Dia, N. Ivaki and N. Laranjeiro, "An Empirical Evaluation of the Effectiveness of Smart Contract Verification Tools," 2021 IEEE 26th Pacific Rim International Symposium on Dependable Computing (PRDC), Perth, Australia, 2021, pp. 17-26, doi: 10.1109/PRDC53464.2021.00013.、
pragma solidity ^0.8.0;

contract waste4{
    uint256 public ticket = 1 ether;   
    uint256 public earnings = 0.1 ether;   
    uint256 public number = 0;
    address[] public participants;
    
    constructor() public payable{
        require(msg.value == ticket);
        participants.push(msg.sender);
    }
    
    
    function join() external payable{
        require(msg.value == ticket);
        uint256 money = participants.length * earnings;
        payable(msg.sender).transfer(money);
        number += 1;
    }

    function getNumber() view external returns(uint256){
        return number;
    }
}