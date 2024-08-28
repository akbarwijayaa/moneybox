# Moneybox Smart Contract Documentation
Contract Address : `0x3f81b634DcE40dE94F20dFcC42A1420945B0ed41`
## Overview

The `Moneybox` smart contract allows the owner to receive and store Ether. The contract includes functionality to withdraw Ether from the contract to a specified address. Only the owner of the contract has the authority to withdraw funds.

## Functions

### receive()

- **Type:** External Payable Function
- **Purpose:** Allows the contract to receive Ether. When Ether is sent to the contract's address, the `receive` function is automatically triggered, increasing the contract's balance.
- **Parameters:** None
- **Returns:** None
- **Special Notes:** This function does not need to be called directly. It is triggered whenever Ether is sent to the contract.

### constructor()

- **Type:** Constructor Function
- **Purpose:** Initializes the contract by setting the `owner` as the address that deployed the contract.
- **Parameters:** None
- **Returns:** None

### withdraw(uint amount, address payable destAddr)

- **Type:** Public Function
- **Purpose:** Allows the owner to withdraw Ether from the contract and send it to a specified address.
- **Parameters:**
  - `amount` (uint256): The amount of Ether to withdraw (in wei).
  - `destAddr` (address payable): The address to which the Ether should be sent.
- **Returns:** None
- **Requirements:**
  - Only the owner of the contract can call this function.
  - The withdrawal amount must not exceed the contract's current balance.
- **Special Notes:** If the conditions are not met, the transaction will revert, and no Ether will be transferred.

## State Variables

### balance

- **Type:** uint256
- **Purpose:** Stores the total amount of Ether currently held by the contract.
- **Visibility:** Public (can be viewed by anyone)

### owner

- **Type:** address
- **Purpose:** Stores the address of the contract's owner.
- **Visibility:** Private (can only be accessed within the contract)

## Usage Example

### Deploying the Contract

- When the contract is deployed, the deployer's address will be set as the `owner`.

### Sending Ether to the Contract

- Send Ether to the contract's address directly. The contract's `balance` will automatically increase by the sent amount.

### Withdrawing Ether

- Only the owner can call the `withdraw` function.
- Example: If the owner wants to withdraw 1 Ether to address `0xABC...123`, they would call `withdraw(1000000000000000000, 0xABC...123)`.

## Important Notes

- **Ownership:** Only the address that deploys the contract has the authority to withdraw funds. This address is the `owner`.
- **Security:** Ensure that the contract's owner address is secure to prevent unauthorized withdrawals.
- **Gas Fees:** Interacting with the contract will require gas fees, which are paid by the sender of the transaction.

This documentation provides an overview of the Moneybox smart contract and its usage. Make sure to review the contract's code and test it in a safe environment before deploying it on the Ethereum mainnet.
