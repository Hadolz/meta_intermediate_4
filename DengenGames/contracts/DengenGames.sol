// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGames is ERC20, Ownable {
    error INSUFFICIENT_TOKEN_BALANCE(string, uint);

    enum ItemsToRedeem {
        Toolbox,
        Nitro,
        Suspensions,
        Hydraulics
    }

    mapping(ItemsToRedeem => uint256) public itemPrices;
    mapping(address => Item[]) public itemsOwned; // Mapping to store items owned by each address

    struct Item {
        ItemsToRedeem itemType; // Type of the item
        bool claimed; // Whether the item has been claimed
    }

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        itemPrices[ItemsToRedeem.Toolbox] = 10 * 1e18;
        itemPrices[ItemsToRedeem.Nitro] = 8 * 1e18;
        itemPrices[ItemsToRedeem.Suspensions] = 6 * 1e18;
        itemPrices[ItemsToRedeem.Hydraulics] = 4 * 1e18;
    }

    function mint(address _receiver, uint256 _amount) external onlyOwner {
        _mint(_receiver, _amount);
    }

    function transferDGNToken(
        address _receiver,
        uint256 _amount
    ) external returns (bool success) {
        require(_amount <= balanceOf(msg.sender), "Insufficient DGN Token");
        return transfer(_receiver, _amount);
    }

    function burn(uint256 _amount) external {
        require(_amount <= balanceOf(msg.sender), "Insufficient DGN Token");
        _burn(msg.sender, _amount);
    }

    function redeemItems(ItemsToRedeem _item) external {
        require(itemPrices[_item] > 0, "Invalid item");
        require(
            itemPrices[_item] <= balanceOf(msg.sender),
            "Insufficient DGN  Token"
        );

        _transfer(msg.sender, address(this), itemPrices[_item]);

        // Transfer the item to the player
        itemsOwned[msg.sender].push(Item(_item, false));
    }

    function claimItem(uint256 itemId) external {
        require(itemId < itemsOwned[msg.sender].length, "Invalid item ID");
        require(!itemsOwned[msg.sender][itemId].claimed, "Item already claimed");

        // Here you would typically emit an event or perform other actions upon claiming the item
        itemsOwned[msg.sender][itemId].claimed = true;
    }

    function withdrawFunds() external onlyOwner {
        _transfer(address(this), msg.sender, balanceOf(address(this)));
    }

    function getBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }

}
