//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract simplified_exp {
function foo (uint8 val) public returns (bool) {
if ((val + 12) == 32) return false;
return true;
}

function inv_false (uint8 val) public {
	require (val > 0, "val should be greater than 0");
	assert (foo(val) == true);
}

}