# Points Token Smart Contract

This is the readme for the Points Token smart contract. The Points Token is an Ethereum-based ERC-20 token that provides a simple token system with special features.

## Overview

The Points Token is an ERC-20 compliant token with added functionality. It allows users to redeem tokens for special privileges, and it can be minted and transferred according to the ownership permissions. The smart contract is implemented in Solidity and utilizes the OpenZeppelin library for ERC-20 token standard compliance and access control through the Ownable contract.

## Contract Details

### Token Information

- **Name:** Degen
- **Symbol:** DGN

### Inheritance

- `ERC20`: This contract inherits from OpenZeppelin's ERC20, which is a widely-used implementation of the ERC-20 token standard.
- `Ownable`: The contract also inherits from OpenZeppelin's Ownable, which provides basic access control functionality.

### Functions

1. `constructor()`: The contract constructor sets the token name and symbol while making the contract owner (deployer) the initial owner.

2. `getSC(address _user) external onlyOwner`: This function is used by the owner to mark a user as a special character.

3. `removeSC(address _user) external onlyOwner`: This function is used by the owner to remove the special character status from a user.

4. `redeemTokens(uint256 _value) external`: Users can call this function to redeem a specified amount of tokens for special character status. Certain conditions must be met: the user should have a sufficient balance, the requested value should be greater than 20, and the user should not already have special character status.

5. `checkSC() external view returns(bool)`: This function allows users to check if they have special character status.

6. `mint(address to, uint256 amount) public onlyOwner`: The owner can mint new tokens and send them to a specified address.

7. `decimals() public pure override returns (uint8)`: Overrides the decimals function to return 0.

8. `getBalance() external view returns (uint256)`: Users can check their token balance.

9. `transferTokens(address _rec, uint256 _value) external`: Users can transfer tokens to another address, provided they have a sufficient balance.

10. `burnTokens(uint256 _value) external`: Users can burn (destroy) a specified amount of their tokens, given that they have enough tokens to burn.

### Special Character Status

The concept of "special character" status is introduced in this token. It is used as a simple example of a unique feature that can be redeemed using the token. Users can redeem this status using the `redeemTokens` function, and it is controlled by the owner using the `getSC` and `removeSC` functions.

## License

This smart contract is released under the MIT License.

### SPDX-License-Identifier: MIT

## Solidity Version

This contract is written in Solidity and is designed to be used with Solidity version 0.8.9.

## Dependencies

This smart contract uses the OpenZeppelin library for ERC-20 token functionality and access control. Make sure to include the necessary dependencies to compile and deploy the contract successfully.
