 //https://github.com/trailofbits/not-so-smart-contracts/blob/master/integer_overflow/integer_overflow_1.sol
 pragma solidity ^0.4.15;

 contract Overflow {
     uint private sellerBalance=0;

     function add(uint value) returns (bool){
         // <yes> <report> ARITHMETIC
         sellerBalance += value; // possible overflow

         // possible auditor assert
         // assert(sellerBalance >= value);
     }
 }