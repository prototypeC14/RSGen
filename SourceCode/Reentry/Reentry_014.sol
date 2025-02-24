//https://github.com/seresistvanandras/EthBench/blob/master/Benchmark/Simple/reentrant.sol
pragma solidity ^0.8.0;
contract EtherBank{
    mapping (address => uint) userBalances;
	function getBalance(address user) public view returns(uint) {  
		return userBalances[user];
	}

	function addToBalance() public payable {  
		userBalances[msg.sender] += msg.value;
	}

	function withdrawBalance() public {  
		uint amountToWithdraw = userBalances[msg.sender];
        // <yes> <report> REENTRANCY
		(bool success, ) = msg.sender.call{value: amountToWithdraw}("");
		if (!success) { revert(); }
		userBalances[msg.sender] = 0;
	}    
}