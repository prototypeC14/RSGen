//B. Dia, N. Ivaki and N. Laranjeiro, "An Empirical Evaluation of the Effectiveness of Smart Contract Verification Tools," 2021 IEEE 26th Pacific Rim International Symposium on Dependable Computing (PRDC), Perth, Australia, 2021, pp. 17-26, doi: 10.1109/PRDC53464.2021.00013.、
pragma solidity ^0.8.0;

contract GasModel{
    uint x = 100;
    function check() external{
        uint a = gasleft();
        x = x + 1;
        uint b = gasleft();
        // Solidity  language provides several statements ( require ,  assert , and  revert ) to handle errors. These statements are slightly different when used, so they need to be used correctly. For example,  require  should be used for input validation,  assert  should be used to validate invariants, and  revert  is used for termination and rollback transactions. In addition, the  require  does not consume any  gas , but  assert  consumes all available  gas .
        //always false
        assert(b > a);
    }
}