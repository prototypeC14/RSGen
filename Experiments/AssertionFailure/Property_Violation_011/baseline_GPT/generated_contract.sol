interface IGasModel {
    function check() external;
}

contract ReproductionContract {
    IGasModel public gasModel;

    constructor(address _gasModelAddress) {
        gasModel = IGasModel(_gasModelAddress);
    }

    function triggerVulnerability() external {
        gasModel.check();
    }
}