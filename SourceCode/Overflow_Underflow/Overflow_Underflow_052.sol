//B. Dia, N. Ivaki and N. Laranjeiro, "An Empirical Evaluation of the Effectiveness of Smart Contract Verification Tools," 2021 IEEE 26th Pacific Rim International Symposium on Dependable Computing (PRDC), Perth, Australia, 2021, pp. 17-26, doi: 10.1109/PRDC53464.2021.00013.、
pragma solidity ^0.8.0;

contract A{
    uint256 public num;
    function getNum() view public virtual  returns(uint256){
        return num;
    }
}

contract B is A{
    constructor(uint256 _num) public{
        num = _num;
    }
}

contract C is A{
    function setNum() public{
        num += 10;
    }
}

contract D is C{
    function getNum() view public virtual override returns(uint256){
        return num + 10;
    }
}

contract E is D, B{
    address public owner;
    constructor(uint256 _num) B(_num) public{
        owner = msg.sender;
    }

    function getNum() view public override(D, A) returns(uint256){
        return super.getNum();
    }
}