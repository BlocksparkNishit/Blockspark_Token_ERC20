// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract BlockSparkToken is ERC20, ERC20Burnable {
    address payable public owner;

    constructor(uint256 cap) ERC20("BlockSparkToken", "BST") {
        owner = payable(msg.sender);
        _mint(owner, cap * (10 ** 6));
        
    }

    function decimals() public view virtual override returns (uint8) {
        return 6;  // Setting the decimals to 6
    }

    function _mint(address account, uint256 amount) internal virtual override(ERC20) {
        // require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        super._mint(account, amount);
    }

    function destroy() public onlyOwner {
    payable(owner).transfer(address(this).balance);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Override _update from ERC20Capped to resolve conflict
    function _update(address from, address to, uint256 value) internal virtual override(ERC20) {
        super._update(from, to, value);
    }
}
