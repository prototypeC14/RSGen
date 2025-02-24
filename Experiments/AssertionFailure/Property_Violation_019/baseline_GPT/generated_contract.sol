//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract ReproductionContract {
    _MAIN_ public mainContract;

    constructor(address _mainContractAddress) {
        mainContract = _MAIN_(_mainContractAddress);
    }

    function triggerVulnerability() public {
        mainContract.check();
    }
}

contract ReproductionContract {
    _MAIN_ public mainContract;

    constructor(address _mainContractAddress) {
        mainContract = _MAIN_(_mainContractAddress);
    }

    function triggerVulnerability() public {
        mainContract.check();
    }
}