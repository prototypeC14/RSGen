interface I_MAIN_ {
    function go() external pure returns (uint);
}

contract ReproductionContract {
    I_MAIN_ target;

    constructor(address _target) {
        target = I_MAIN_(_target);
    }

    function trigger() public view returns (uint) {
        return target.go();
    }
}