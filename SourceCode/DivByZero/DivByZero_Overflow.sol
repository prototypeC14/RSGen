//B. Dia, N. Ivaki and N. Laranjeiro, "An Empirical Evaluation of the Effectiveness of Smart Contract Verification Tools," 2021 IEEE 26th Pacific Rim International Symposium on Dependable Computing (PRDC), Perth, Australia, 2021, pp. 17-26, doi: 10.1109/PRDC53464.2021.00013.、
pragma solidity ^0.8.0;


contract getWageNumber {
    uint256 public coefficient;
    uint256 public DailyWage;
    address public boss;
    
    constructor() public{
        DailyWage = 100;
        coefficient = 3;
        boss = msg.sender;
    }
    
    function setDailyWage(uint256 _wage) external {
        require(msg.sender == boss);
        DailyWage = _wage;
    }
    
    function setCoefficient(uint256 _co) external {
        coefficient = _co;
    }
    
    function calculateWage(uint256 dayNumber) external view  returns (uint256) {
        require(msg.sender == boss);
        uint256 baseWage = DailyWage / coefficient;
        return baseWage * dayNumber;
    }
}