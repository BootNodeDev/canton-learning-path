# Daml

## Learning Daml

Daml derives from Haskell; a working knowledge of the syntax helps. Start with the Haskell primers below if you are new to functional programming.

- Haskell primers
  - Work through [Learn You a Haskell for Great Good](https://learnyouahaskell.github.io/), the classic intro. *(Est. time: 20 hours)*
  - Browse the [Haskell Wiki learning portal](https://wiki.haskell.org/Learning_Haskell) for textbooks and online practice.
- The [Fast Track to Daml](https://docs.digitalasset.com/build/3.5/reference/daml-language-cheat-sheet.html) cheatsheet covers Daml syntax on one page.
- Follow the [Smart contract development path](https://docs.digitalasset.com/build/3.5/tutorials/smart-contracts/intro.html) for a progressive tutorial on the current platform.
- [Daml Masterclass](https://medium.com/daml-masterclass) is a long-form Medium series on contract design. *(Predates Daml 3.x but ledger semantics still apply)*
- Watch the [Daml 101 playlist](https://www.youtube.com/playlist?list=PLjLGVUzUMRxUqUXUGltc85HkB7CxsIYR4) for short language intros. *(Tooling clips predate Daml 3.x)*

## Daml Patterns and Best Practices

- [Good Design Patterns](https://docs.digitalasset.com/build/3.5/sdlc-howtos/smart-contracts/develop/patterns.html) covers Propose-Accept, Delegation, Authorization, and Locking.
- Learn template and choice anatomy in [Daml Smart Contract Structure](https://blog.digitalasset.com/blog/-daml-smart-contract-structure-part-1).

## Testing Daml

- The idiomatic Daml test harness: [Test Templates Using Daml Script](https://docs.digitalasset.com/build/3.5/tutorials/smart-contracts/daml-scripts.html).
- Run dpm test, debug, and trace workflows with [Test Daml Contracts on Platform](https://docs.digitalasset.com/build/3.5/tutorials/smart-contracts/tests.html).

## Daml Finance and Tokenization

- Docs and code
  - [Daml Finance docs](https://docs.daml.com/daml-finance/index.html) covers instruments, accounts, holdings, and settlement. *(Daml SDK 2.x)*
- Patterns
  - [The Finance Library, Part 1](https://medium.com/daml-masterclass/the-finance-library-part-1-2f94ed07c349) covers modular design and settlement chains.
  - [Asset Servicing](https://medium.com/daml-masterclass/asset-servicing-c899ed60404a) models bonds and equity option lifecycles.
- Market context
  - [State of RWA Tokenization 2026](https://www.canton.network/blog/state-of-rwa-tokenization-2026) maps market sizing and current frictions.
  - [Treasuries On-Chain](https://www.canton.network/blog/treasuries-on-chain-an-industry-case-for-change-value-exchange) covers momentum behind tokenized Treasuries.
