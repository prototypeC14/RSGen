//B. Dia, N. Ivaki and N. Laranjeiro, "An Empirical Evaluation of the Effectiveness of Smart Contract Verification Tools," 2021 IEEE 26th Pacific Rim International Symposium on Dependable Computing (PRDC), Perth, Australia, 2021, pp. 17-26, doi: 10.1109/PRDC53464.2021.00013.、
pragma solidity ^0.8.0;

contract doWhileContinue{
    address[] public owners;
    address public owner;
    
    constructor() public{
        owner = msg.sender;
    }
    
    function addOwner(address _owner) external {
        require(msg.sender == owner);
        owners.push(_owner);
    }
    
    function deleteOwner(address _own) external {
        require(msg.sender == owner);
        uint256 i = 0;
        uint256 _length = owners.length;
        do{
           if(owners[i] != _own || owners[i] == address(0x0)){
               i++;
               //Prior to version 0.5.0 of solidity, there was a bug with using the do-while-statement. Using the continue-statement in the do-while-statement causes the bug to skip the conditional judgment and go directly to the loop body for execution again.
               continue;
           }
           else{
               delete owners[i];
               i++;
           }
        }while( i < _length);
    }
    
}