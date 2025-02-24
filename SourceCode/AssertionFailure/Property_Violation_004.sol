//https://github.com/ntu-SRSLab/SolSEE/blob/main/dataset/SMTChecker
//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract object {
    uint num = 0;
    uint cons_step_object;

    constructor() public {
        num++;
        cons_step_object = num;
    }
    
    function go() public pure virtual returns (uint out) {
        out = 1;
    }
}

contract A is object {
    uint cons_step_A;

    constructor() public {
        num++;
        cons_step_A = num;
    }
    
    function go() public pure override virtual returns (uint out) {
        out = 1;
    }
}
contract B is object {
    uint cons_step_B;

    constructor() public {
        num++;
        cons_step_B = num;
    }

    function go() public pure virtual override returns (uint out) {
        out = 2;
    }
}

contract C is object {
    uint cons_step_C;

    constructor() public {
        num++;
        cons_step_C = num;
    }

    function go() public pure override virtual returns (uint out) {
        out = 3;
    }
}

// returns 2 as expected
contract AB is A, B {
    uint cons_step_AB;

    constructor() public {
        num++;
        cons_step_AB = num;
    }

    function go() public pure override(A, B) virtual returns (uint out) {
       out = super.go();
    }
}

// returns 1 as expected
contract BA is B, A {
    uint cons_step_BA;

    constructor() public {
        num++;
        cons_step_BA = num;
    }

    function go() public pure override(A, B) virtual returns (uint out) {
       out = super.go();
    }
}

// returns 3 as expected
contract AC is A, C {
    uint cons_step_AC;

    constructor() public {
        num++;
        cons_step_AC = num;
    }

    function go() public pure override(A, C) virtual returns (uint out) {
       out = super.go();
    }
}


contract AC_AB is AC, AB {
    uint cons_step_AC_AB;

    constructor() public {
        num++;
        cons_step_AC_AB = num;
    }

    function go() public pure override(AB, AC) returns (uint out) {
       out = super.go();
    }
}

contract AC_BA is AC, BA {
    uint cons_step_AC_BA;

    constructor() public {
        num++;
        cons_step_AC_BA = num;
    }

    function go() public pure override(AC, BA) returns (uint out) {
       out = super.go();
    }
}

contract _MAIN_ {
    AC_BA test;
    uint result;

    constructor () public {

        test = new AC_BA();

        result = test.go();

        // The following assertion always holds
        assert(result == 3);

        // The following assertion doesn't hold,
        // (result == 3) is true
        assert(result == 2);
    }
}