# AITU_Adilkhan_SE-2327 Token

## Project Description
This project implements an ERC-20 token named `AITU_Adilkhan_SE-2327` on the Ethereum blockchain. The token is created using the ERC-20 standard and includes additional features for tracking transactions.

## Features
- **Initial Token Supply:** 2000.
- **Token Name:** AITU_Adilkhan_SE-2327.
- **Token Symbol:** AITU.
- **Readable Balance:** A function that returns the balance in a human-readable format.
- **Transaction Tracking:** Functions to retrieve information about the latest transaction:
  - Timestamp of the latest transaction.
  - Address of the sender.
  - Address of the receiver.

## Deployment Instructions
1. Make sure you have [MetaMask](https://metamask.io/) installed and connected to an Ethereum test network (e.g., Sepolia).
2. Open [Remix IDE](https://remix.ethereum.org/).
3. Import the `AITU_Adilkhan_SE-2327.sol` file into Remix.
4. In the **Solidity Compiler** section:
   - Select compiler version `^0.8.0`.
   - Compile the smart contract.
5. In the **Deploy & Run Transactions** section:
   - Select **Injected Web3** (to connect MetaMask).
   - Click **Deploy** and confirm the transaction in MetaMask.
6. Copy the address of the deployed contract for further use.

## Usage Examples
### Check Balance
- Call the `getHumanReadableBalance` function to check the token balance of a specific address.

### Transfer Tokens
- Use the `transfer` function to send tokens to another address.

### Track Transactions
- Use the following functions to get information about the latest transaction:
  - `getLastTransactionTimestamp`.
  - `getLastTransactionReceiver`.

## Screenshots
Add screenshots here to showcase the deployment and functionality.

## License
This project is distributed under the [MIT License](LICENSE).
