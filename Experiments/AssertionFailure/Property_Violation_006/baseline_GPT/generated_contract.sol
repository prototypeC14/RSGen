contract ReproductionContract {
    Bank bank;
    uint public t;
    bool public res;

    constructor() {
        bank = new Bank();
        res = bank.test(20, 24);
        t = bank.getTotalSupply();
    }

    function triggerVulnerability(uint x, uint y) public {
        res = bank.test(x, y);
        t = bank.getTotalSupply();
    }

    function getTotalSupply() public view returns (uint) {
        return t;
    }
}