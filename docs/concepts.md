# Canton Network: Concepts

## General Info

- The [Canton FAQ](https://canton.network/faq) covers architecture, custody, and common use cases. *(Est. time: 15 min)*
- Read [Why Canton](https://www.canton.network/why-canton) for the tokenomics and composability pitch. *(Est. time: 10 min)*
- [Canton Network: Technical Overview](https://docs.digitalasset.com/integrate/devnet/canton-network-overview/index.html) walks through the synchronizer architecture. *(Est. time: 15 min)*
- Official SDK and operator docs: [Digital Asset Platform Documentation](https://docs.digitalasset.com/).
- The [Canton Network Whitepaper](https://www.canton.network/hubfs/Canton/Canton%20Network%20-%20White%20Paper.pdf) covers the interoperability protocol. *(Est. time: 45 min)*
- [Polyglot Canton Whitepaper](https://www.canton.network/hubfs/Canton%20Network%20Files/whitepapers/Polyglot_Canton_Whitepaper_11_02_25.pdf) extends Canton to Solidity and WASM. *(Est. time: 30 min)*
- Full list at the [Canton whitepapers index](https://canton.network/whitepapers).
- [Canton Network Developer Resources](https://www.canton.network/developer-resources) is the starting point for builders.

## Canton Core Concepts

- [How Canton Works](https://www.blockdaemon.com/blog/how-canton-works) covers subnets, the Global Synchronizer, and super validators.
- [Canton Network Smart Contract Development](https://pixelplex.io/blog/canton-network-smart-contract-development/) contrasts Daml and Solidity via DvP atomicity.
- [Canton Network Explained](https://pixelplex.io/blog/canton-network-explained/) covers participant nodes, sync domains, and the Global Synchronizer.
- Client libraries and Query Store patterns: [How to Communicate with a Daml/Canton Ledger](https://www.halborn.com/blog/post/how-to-communicate-with-a-daml-canton-ledger).
- [Exploring Canton Network](https://medium.com/iobuilders/exploring-canton-network-a-deep-dive-into-privacy-first-distributed-ledgers-58046e0901a7) is a hands-on PoC walk-through building fungible tokens.
- [Introduction to Canton](https://docs.digitalasset.com/build/3.5/overview/introduction.html) - narrative overview from the official SDK docs.
- [State of the Network: Canton](https://coinmetrics.substack.com/p/state-of-the-network-issue-321) maps network-of-networks architecture and Canton Coin incentives.

## Privacy Model Deep Dive

- [Privacy or Perish](https://www.canton.network/blog/privacy-or-perish) argues on-chain privacy is a prerequisite for TradFi adoption.
- [Daml Smart Contracts: Privacy Management with Canton](https://blog.digitalasset.com/blog/daml-smartcontracts-privacy-management-with-canton) explains the tip-and-iceberg identity model.
- [Front-Door and Back-Door Security](https://www.halborn.com/blog/post/daml-and-canton-front-door-and-back-door-security) covers OAuth flows, participant-level encryption, and repudiation.
- The authorization model behind privacy: [Parties and Authority](https://docs.digitalasset.com/build/3.5/tutorials/smart-contracts/parties.html).

## Canton Coin and Tokenomics

- Utility and mint design
  - [Canton Coin: Flipping the Script on Tokenomics](https://www.canton.network/blog/canton-coin-flipping-the-script-on-tokenomics) explains the infra/apps/users reward split.
  - App reward mechanics: [Earn with Every Transaction](https://www.canton.network/blog/earn-with-every-transaction-continuous-transaction-based-revenue-for-apps-and-assets-on-canton).
- Formal papers
  - [Canton Coin: A Responsible Approach to Digital Tokens](https://www.canton.network/hubfs/Canton%20Coin%20A%20Responsible%20Approach%20to%20Digital%20Tokens.pdf) explains the utility-token design.
  - EU 2023/1114 disclosures: [Canton Coin MiCA Whitepaper](https://www.canton.network/hubfs/Canton%20Network%20Files/whitepapers/Canton%20Coin%20%20-%20MiCA%20Whitepaper.pdf).

## Interoperability and Atomic Settlement

- The [Canton Global Synchronizer](https://www.canton.network/global-synchronizer) page explains BFT-based atomic interoperability.
- [Global Synchronizer Overview](https://docs.splice.global/overview/overview.html) covers Super Validators, consensus, tokenomics, and governance.
- [Daml Interoperability: CBDC](https://blog.digitalasset.com/blog/daml_interoperability_cbdc) demonstrates atomic cross-bank settlement, with a reference repo.
- [The Weekend Revolution: Collateral Working Overtime](https://www.canton.network/blog/the-weekend-revolution-collateral-is-finally-working-overtime) makes the case for 24/7 collateral mobility.
