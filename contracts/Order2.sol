// // SPDX-License-Identifier: MIT
// // The line above is recommended and let you define the license of your contract
// // Solidity files have to start with this pragma.
// // It will be used by the Solidity compiler to validate its version.
// pragma solidity ^0.8.17;

// import "hardhat/console.sol";

// // This is the main building block for smart contracts.
// contract Order2 {
//     struct EthazonOrder {
//         bool isValidEthazonOrder;
//         string customerName;
//         string shippingAddress;
//         bool hasConfirmed;
//     }
//     mapping(address => EthazonOrder)private orders;
//     uint private constant orderPrice = 0.1 ether;
//     uint private balance;


//     function makeOrder(string customerName,  string shippingAddress) external {
      
//         require(orders[msg.sender].isValidEthazonOrder ==true, "Not enough tokens");

//         // Transfer the amount.
//         balances[msg.sender] -= amount;
//         balances[to] += amount;
//     }

//     /**
//      * Read only function to retrieve the token balance of a given account.
//      *
//      * The `view` modifier indicates that it doesn't modify the contract's
//      * state, which allows us to call it without executing a transaction.
//      */
//     function balanceOf(address account) external view returns (uint256) {
//         console.log("******** Balance*********", balances[account]);
//         return balances[account];
//     }
// }
