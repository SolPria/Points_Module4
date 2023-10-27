// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Points is ERC20, Ownable {
    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    mapping(address => bool) public specialCharacter;

    function getSC(address _user) external onlyOwner{
        specialCharacter[_user] = true;
    }
    
    function removeSC(address _user) external onlyOwner{
        specialCharacter[_user] = false;
    }

    function redeemTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Insufficient Balance");
        require(_value > 20, "Value should be greater than 20");
        require(!specialCharacter[msg.sender], "You already have special character");
        specialCharacter[msg.sender] = true;
        _burn(msg.sender, _value);
    }

    function checkSC() external view returns(bool) {
        return specialCharacter[msg.sender];
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender); 
    }
    
    function transferTokens(address _rec, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You dont have enough tokens");
        _transfer(msg.sender, _rec, _value);
    }

    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value,"You dont have enough tokens to burn");
        _burn(msg.sender, _value);
    }
}