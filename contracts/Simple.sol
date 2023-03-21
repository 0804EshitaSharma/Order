// SPDX-License-Identifier: MIT
// The line above is recommended and let you define the license of your contract
// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
import "hardhat/console.sol";
pragma solidity ^0.8.17;


// This is the main building block for smart contracts.
contract Simple {
    // Some string type variables to identify the token.
    // The `public` modifier makes a variable readable from outside the contract.

    uint256 public value=10000;

    constructor() {}

    function setValue(uint256 x) public {
        value = x;
    }

    function getValue() public view returns (uint256) {
        return value;
    }
}
