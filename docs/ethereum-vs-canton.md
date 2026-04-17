# Ethereum vs. Canton

Coming from Ethereum? This chapter maps the terminology and tooling you already know to their Canton counterparts, and collects deeper reads on where the two platforms architecturally differ.

## Articles and Deep Dives

- Technical contrasts
  - Read [Canton Network vs. EVM-Compatible Blockchains](https://defiprime.com/canton-vs-evm) for a technical EVM comparison. *(Est. time: 15 min)*
  - [Ethereum and Canton: Unifying Public Innovation with Institutional Scale](https://www.canton.network/blog/ethereum-and-canton-unifying-public-innovation-with-institutional-scale) positions Zenith as the bridge between both ecosystems. *(Est. time: 10 min)*
- Institutional privacy
  - 21Shares: [Why Canton Solves DeFi's Institutional Privacy Gap](https://www.21shares.com/en-us/insights/why-canton-solves-defis-institutional-privacy-gap) for TradFi. *(Est. time: 20 min)*
- Daml contract model
  - Read [Daml and Canton: An Introduction](https://www.halborn.com/blog/post/daml-and-canton-an-introduction) for the rights-and-obligations framing. *(Est. time: 15 min)*
  - [Why Daml's Deterministic Model Fits Regulated Finance](https://www.halborn.com/blog/post/why-daml-s-deterministic-model-fits-regulated-finance) covers determinism and why it eliminates reentrancy. *(Est. time: 15 min)*
- Settlement and consensus
  - Deep dive on BFT consensus and atomic settlement in [The Canton Network: A Comprehensive Guide](https://www.halborn.com/blog/post/the-canton-network-a-comprehensive-guide). *(Est. time: 25 min)*
- Sovereign app layer
  - [Why "Broadcast Everything" Will Never Work for On-Chain Finance](https://www.canton.network/blog/why-broadcast-everything-will-never-work-for-onchain-finance) makes the sovereign app layer argument. *(Est. time: 10 min)*

## Terminology Mapping

How common Ethereum terms map to their Canton equivalents.

| Ethereum | Canton |
|---|---|
| Smart contract | Daml template |
| Solidity | Daml |
| Account / EOA | Party (format `name::fingerprint`) |
| Gas | Traffic, paid in Canton Coin |
| ETH | Canton Coin (CC) |
| ERC-20 / token standard | Canton Network Token Standard (CIP-0056) |
| Block explorer (Etherscan) | Global explorers (Cantonscan, CCView, others); also per-app Scan APIs |
| Public RPC endpoint (Infura, Alchemy) | Per-participant Ledger API; no global RPC endpoint |
| Local dev chain (Anvil, Hardhat Network) | LocalNet via CN Quickstart |
| Testnet | DevNet (development staging) and TestNet (production staging) |
| Solidity on EVM | Zenith, Canton's EVM layer (in development) |

## How-to Mapping

How common Ethereum workflows translate to Canton.

| Task | Ethereum | Canton |
|---|---|---|
| Write contracts | Solidity in Remix, Hardhat, or Foundry | Daml in VS Code with the Daml SDK |
| Test contracts | Hardhat or Foundry test suites | Daml Script (`daml test`) |
| Run a local chain | Hardhat Network, Anvil, or Ganache | LocalNet via CN Quickstart |
| Connect to a test network | Public RPC endpoint | Through a sponsoring Super Validator |
| Query ledger state | JSON-RPC (`eth_call`, `getLogs`) | Ledger API against your participant's PQS |
| Inspect a transaction | Etherscan | The relevant app's Scan API |
| Deploy a fungible token | Write or clone an ERC-20 | Implement the Canton Network Token Standard (CIP-0056) |
| Run Solidity unchanged | Native on any EVM chain | Zenith, Canton's EVM layer (in development) |

Daml models rights and obligations rather than the account-and-state model, so several Ethereum idioms (reentrancy guards, `msg.sender` patterns, gas-based DoS mitigations) have no direct Canton equivalent because the underlying execution model differs.

## Zenith: EVM on Canton

- [zenith.network](https://zenith.network/) hosts the Super Validator running the Zenith EVM and Stack.
- [Zenith docs intro](https://docs.zenith.network/docs/intro) explains the multi-VM execution environment.
