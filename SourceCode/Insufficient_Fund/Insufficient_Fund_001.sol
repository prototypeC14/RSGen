//B. Dia, N. Ivaki and N. Laranjeiro, "An Empirical Evaluation of the Effectiveness of Smart Contract Verification Tools," 2021 IEEE 26th Pacific Rim International Symposium on Dependable Computing (PRDC), Perth, Australia, 2021, pp. 17-26, doi: 10.1109/PRDC53464.2021.00013.、
pragma solidity ^0.8.0;

contract signednessError{
    mapping(address => bool) public transferred;
    address public owner;
    
    constructor() public payable{
        owner = msg.sender;
        require(msg.value > 0 && msg.value % 1 ether == 0);
    }
    
    function withdrawOnce (int amount) public {
        if ( amount > 1 ether || transferred [msg.sender]) {
            revert() ;
        }
        //In Solidity, casting a negative integer to an unsigned integer results in an error and does not throw an exception. Avoid such conversions.
        payable(msg.sender).transfer(uint(amount));
        transferred [msg.sender] = true ;
    }
}