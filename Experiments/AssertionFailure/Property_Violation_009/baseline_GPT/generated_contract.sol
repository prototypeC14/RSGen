contract Reproduction {
    Bank bank;

    constructor(address bankAddress) {
        bank = Bank(bankAddress);
    }

    function triggerVulnerability() public {
        bank.test();
    }
}