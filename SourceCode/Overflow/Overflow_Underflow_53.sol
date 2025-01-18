//B. Dia, N. Ivaki and N. Laranjeiro, "An Empirical Evaluation of the Effectiveness of Smart Contract Verification Tools," 2021 IEEE 26th Pacific Rim International Symposium on Dependable Computing (PRDC), Perth, Australia, 2021, pp. 17-26, doi: 10.1109/PRDC53464.2021.00013.、
pragma solidity ^0.8.0;


contract CostlyLoop{
    uint256[] public element;   //a dynamic array
    uint256 public constant addNum = 1;
    address public owner;
    
    constructor() public{
        owner = msg.sender;
    }
    
    function appendDate(uint256 _ele) public {
        require(msg.sender == owner);
        element.push(_ele);
    }
    
    function addOne() public {
        require(msg.sender == owner);
        uint256 _length = element.length;

        for(uint8 i = 0; i < _length; i++)
            element[i] += 1;
    }
}