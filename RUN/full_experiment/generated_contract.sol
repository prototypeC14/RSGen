//SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2;

contract Ext {
    uint public x;
    function setX(uint _x) public { x = _x; }
}
contract MyContract {
    function callExt(Ext _e) public {
        _e.setX(42);
        assert(_e.x() == 42);
    }
}

contract VulnerabilityReproducer {
    function setX(uint _x) public {
        // Do nothing, leaving the behavior non-compliant with expectations
    }

    function x() public pure returns (uint) {
        return 0; // Always return 0 to cause the assertion failure
    }

    function triggerAssertionFailure(address target) public {
        // Call the vulnerable function in the original contract
        (bool success, ) = target.call(
            abi.encodeWithSignature("callExt(address)", address(this))
        );
        require(success, "Call to target failed");
    }
}




