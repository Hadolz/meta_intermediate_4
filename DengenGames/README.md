DegenGames Contract
This contract, named DegenGames, is an Avalanche smart contract developed using Solidity. It utilizes the ERC20 token standard and is deployed on the Avalanche blockchain. The contract facilitates the management of a token called Degen (DGN) and provides functionality for minting, transferring, burning tokens, redeeming items, withdrawing funds, and checking balances.

Contract Overview
ERC20 Token
DegenGames is an ERC20 token, implementing standard functions and events defined by the ERC20 interface. This allows users to interact with the token using common interfaces and tools compatible with the Avalanche blockchain.

Ownership
The contract utilizes the Ownable contract from the OpenZeppelin library, enabling ownership management. The owner has special privileges, such as minting tokens and withdrawing funds.

Error Handling
The contract defines a custom error, INSUFFICIENT_TOKEN_BALANCE, which is used to revert transactions when a user's token balance is insufficient for a particular operation.

Redeemable Items
The contract includes an enum, ItemsToRedeem, listing items users can redeem using their DGN tokens. These items include Toolbox, Nitro, Suspensions, and Hydraulics.

Item Prices
Each redeemable item is associated with a price denominated in DGN tokens. These prices are stored in a mapping called itemPrices.

Contract Functions
Mint
The mint function allows the contract owner to create new DGN tokens and assign them to a specified address.

Transfer DGN Tokens
The transferDGNToken function enables users to transfer DGN tokens to another address.

Burn
The burn function allows users to permanently remove DGN tokens from circulation by burning them.

Redeem Items
The redeemItems function enables users to redeem items using their DGN tokens. Users specify the item they want to redeem, and if they have enough tokens, the corresponding amount is transferred to the contract.

Withdraw Funds
The withdrawFunds function allows the contract owner to withdraw any DGN tokens held by the contract.

Get Balance
The getBalance function allows users to check their DGN token balance.

Usage
To interact with this contract, users can send transactions using Avalanche wallets or interact with it programmatically using Avalanche smart contract interfaces.

Please note that deploying or interacting with smart contracts on Avalanche involves AVAX gas fees. Users should exercise caution when performing transactions.

contract address :0x4119165a784F0B19CCd4b5DeEbe219DF1b428153
deployment link :https://testnet.snowtrace.io/address/0x6571EcBF52144FE730cDa72514DC92dE9a0Bcb17/contract/43113/code
