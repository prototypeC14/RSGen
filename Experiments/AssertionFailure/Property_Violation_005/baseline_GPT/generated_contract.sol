interface IMain {
    function test(uint x, uint y) external returns (bool);
    function getTotalSupply() external returns (uint);
}

contract ReproductionContract {
    IMain target;

    constructor(address _target) {
        target = IMain(_target);
    }

    function triggerVulnerability() public {
        target.test(20, 24);
        target.getTotalSupply();
    }
}