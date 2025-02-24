
contract ReproductionContract {
    Counter public counterInstance;

    constructor() {
        counterInstance = new Counter();
    }

    function triggerVulnerability() public {
        uint256 result = counterInstance.increment();
        require(result == 1, "Increment failed");
        require(result == 0, "Triggered the failing assertion");
        counterInstance.decrement();
    }
}