# Building on Canton

## Quickstart and Hands-on

- Setup and LocalNet
  - Clone [cn-quickstart](https://github.com/digital-asset/cn-quickstart) for a Docker Compose scaffold with a reference app.
  - [Quickstart installation](https://docs.digitalasset.com/build/3.5/quickstart/download/cnqs-installation.html) covers prerequisites and LocalNet bring-up.
  - [Canton Getting Started](https://docs.digitalasset.com/operate/3.5/tutorials/getting_started.html) steps through console setup, participants, and party provisioning.
- Walk-throughs
  - Walk through the licensing app in [Explore the Quickstart demo](https://docs.digitalasset.com/build/3.5/quickstart/operate/explore-the-demo.html).
  - [Quickstart project structure](https://docs.digitalasset.com/build/3.5/quickstart/configure/project-structure-overview.html) covers Gradle, Docker, and architecture layout.
- JSON Ledger API
  - Take a REST tour with curl in [Get started with the JSON Ledger API](https://docs.digitalasset.com/build/3.5/tutorials/json-api/canton_and_the_json_ledger_api.html).
  - [JSON Ledger API in Quickstart](https://docs.digitalasset.com/build/3.5/tutorials/get-started/using-the-json-ledger-api.html) covers OAuth2, parties, and DAR upload.

## Toolbox

- IDE and CLI
  - [Daml Studio](https://marketplace.visualstudio.com/items?itemName=DigitalAssetHoldingsLLC.daml) - official VS Code extension
  - [Canton Console](https://docs.digitalasset.com/operate/3.5/howtos/operate/console/console.html) - REPL for remote admin
  - [Daml Shell](https://docs.daml.com/build/3.5/components/application-development/daml-shell.html) - CLI for PQS ledger queries; enterprise licence required
- SDK runtime
  - [SDK components](https://docs.digitalasset.com/build/3.5/overview/sdk_components.html) - compiler, codegen, sandbox, PQS, DPM
- Ledger APIs
  - [JSON Ledger API](https://docs.daml.com/reference/json-api/json-api.html) - HTTP interface to the ledger
  - [JSON Ledger API OpenAPI spec](https://docs.digitalasset.com/build/3.5/reference/json-api/openapi.html) - for typed client generation
  - [gRPC Ledger API services](https://docs.digitalasset.com/build/3.5/explanations/ledger-api-services.html) - commands, reads, utility, test
- Client libraries
  - [JavaScript/TypeScript client libraries](https://docs.daml.com/app-dev/bindings-ts/index.html) - @daml/react, @daml/ledger, @daml/types
  - [Java bindings](https://docs.digitalasset.com/build/3.5/component-howtos/application-development/client-libraries/ledger-api-client-libraries/java-client-libraries.html) - reference and IOU quickstart
- Source
  - [digital-asset/daml](https://github.com/digital-asset/daml) - the SDK source

## Example Apps

- [digital-asset/ex-models](https://github.com/digital-asset-archive/ex-models) - auctions, voting, chess, crowdfunding, tasks (archived Jan 2025)
- [Lunar Dollar reference](https://moonsonglabs.com/casestudy/demonstrating-a-baseline-for-building-advanced-financial-applications-on-canton/) - stablecoin and yield vault architecture

## Libraries and Frameworks

- Daml Finance
  - [Daml Finance](https://github.com/digital-asset/daml-finance) - enterprise tokenization library
- Splice
  - [Splice](https://github.com/hyperledger-labs/splice) - reference apps for decentralized synchronizers
  - [Splice docs](https://docs.splice.global/) - deployment and app development
- Wallet SDKs
  - [splice-wallet-kernel](https://github.com/hyperledger-labs/splice-wallet-kernel) - Wallet Gateway, dApp SDK, Wallet SDK monorepo
  - [PartyLayer](https://partylayer.xyz/) - unified SDK for integrating with multiple Canton wallet implementations from a single API

## dApp Frontend Development

Canton authentication is OAuth2/OIDC against a participant node; frontends talk to the ledger over the JSON Ledger API or typed TypeScript bindings. Wallets sign via CIP-0103.

- [Integrating with Canton Network](https://docs.digitalasset.com/integrate/devnet/integrating-with-canton-network/index.html) covers Wallet SDK, CIP-0056, and validator hosting.
- [Wallet SDK configuration](https://docs.digitalasset.com/integrate/devnet/wallet-sdk-configuration/index.html) - custom factories, OIDC transitions
- Add wallet discovery, picker, and signing with [@canton-network/dapp-sdk](https://www.npmjs.com/package/@canton-network/dapp-sdk).
- [@canton-network/wallet-sdk](https://www.npmjs.com/package/@canton-network/wallet-sdk) handles synchronizer auth and transaction submission.
- CIP-0103 rationale: [Scaling Canton Apps with Interop Standard](https://www.canton.network/blog/scaling-canton-apps-with-a-standard-for-wallet-and-app-interoperability).

### Ecosystem wallets

- [Loop](https://www.canton.network/ecosystem/5n-loop-wallet) - Five North browser wallet
- [Console Wallet](https://consolewallet.io/) - PixelPlex self-custodial extension
- [Cantor8 / C8](https://www.canton.network/ecosystem/cantor8) - external-signing mobile and web wallet
- [Cypherock X1](https://cypherock.com/) - hardware wallet with Canton Rewards promo
- [Bron](https://www.bron.org/) - multi-chain non-custodial wallet
