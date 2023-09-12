// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract MultiToken is ERC1155, Ownable {
    
    // Mapping from token ID to its supply
    mapping(uint256 => uint256) private tokenSupply;

    constructor(string memory uri) ERC1155(uri) {}
a
    function mint(address account, uint256 id, uint256 amount, bytes memory data) external onlyOwner {
        _mint(account, id, amount, data);
        tokenSupply[id] += amount;
    }

    function burn(address account, uint256 id, uint256 amount) external onlyOwner {
        _burn(account, id, amount);
        tokenSupply[id] -= amount;
    }

    function totalSupply(uint256 id) external view returns (uint256) {
        return tokenSupply[id];
    }
}
