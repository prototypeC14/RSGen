interface IAC_BA {
    function go() external pure returns (uint);
}

contract Reproduction {
    IAC_BA target;
    uint public result;

    constructor(address _target) {
        target = IAC_BA(_target);
    }

    function triggerVulnerability() public {
        result = target.go();
    }
}