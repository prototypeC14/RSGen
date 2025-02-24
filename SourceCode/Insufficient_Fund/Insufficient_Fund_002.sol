//B. Dia, N. Ivaki and N. Laranjeiro, "An Empirical Evaluation of the Effectiveness of Smart Contract Verification Tools," 2021 IEEE 26th Pacific Rim International Symposium on Dependable Computing (PRDC), Perth, Australia, 2021, pp. 17-26, doi: 10.1109/PRDC53464.2021.00013.、
pragma solidity ^0.8.0;

contract myBonus{
    address public owner;
    address payable[] public myPartners;
    
    constructor() public{
        owner = msg.sender;
    }
    
    function depositOnce() external payable {
      require(msg.sender == owner);
      require(msg.value == 1 ether);
    }
    
    function addNewPartner(address payable _friend) external {
      require(msg.sender == owner);
      myPartners.push(_friend);
    }
    
    function sendEther() external {
      require(msg.sender == owner);
      uint256 _length = myPartners.length;
      for(uint256 i = 0; i < _length; i++){
          myPartners[i].transfer(1 ether);
        } 
    }
}