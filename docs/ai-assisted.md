# AI-Assisted Development

Canton's documentation is centralized and Daml has thin training-data coverage, so working effectively with AI on Canton is worth treating as its own skill.

## General-purpose coding assistants

- [Claude Code](https://claude.com/product/claude-code) - agentic CLI and IDE integration with large context windows
- [Cursor](https://cursor.com/) - AI-first IDE with a rules system for encoding Daml conventions
- [GitHub Copilot](https://github.com/features/copilot) - ubiquitous inline completions
- [Windsurf](https://windsurf.com/) - agentic IDE
- [Aider](https://aider.chat/) - terminal-native pair programmer
- [Continue](https://github.com/continuedev/continue) - open-source IDE assistant with swappable models

## Which assistant is best suited for Daml

No model is Daml-native. The relevant signal is how well a model handles Haskell-family syntax, since Daml derives from Haskell. In practice, frontier models from Anthropic and OpenAI tend to handle Daml better than code-specialized models whose training skews toward JavaScript, Python and Solidity (DeepSeek Coder, Codestral). Large context windows matter more than code specialization because current Canton docs must be fed in-context.

## Making an LLM better at Daml

Ordered from lowest to highest effort.

- **Rules file**: encode Daml idioms in `CLAUDE.md`, `.cursorrules`, or `AGENTS.md`. Pin the SDK version, list template and choice naming conventions, and instruct the agent to derive observers from business rules rather than copy them from other templates.
- **Few-shot examples**: paste canonical templates (Iou, Proposal-Accept, Delegation) into the prompt, and at least one Daml Script that must fail with a missing-authorization error.
- **RAG over official sources**: index [docs.daml.com](https://docs.daml.com/), [docs.digitalasset.com](https://docs.digitalasset.com/), [forum.canton.network](https://forum.canton.network/), and the [digital-asset/daml](https://github.com/digital-asset/daml) source.
- **MCP servers**: point an MCP-capable agent at the Daml SDK tree, Daml Finance source, and the Canton forum. For project-local context, a lightweight MCP over the repo's `daml/` tree and `daml.yaml` scopes the agent to your own code.
- **Agent skills**: package domain knowledge as reusable skills or agent tools: a Daml code review skill that checks authorization and privacy invariants, a test scaffold skill that generates Daml Scripts per template choice, a Canton deployment skill that produces participant or validator config from a template.
- **Custom scripts**: a pre-commit hook that runs `daml build` and `daml test` and feeds failures back to the agent; an authorization linter that flags mismatched signatory/observer/controller sets; a DAR diff tool that warns on breaking template-evolution changes.
- **Fine-tuning**: LoRA or full fine-tune on open-weights models (Llama, Qwen, DeepSeek) using your internal Daml corpus plus the public sources. Only worth it at scale.

## AI for Daml testing

- Prompt the model to enumerate signatory and observer edge cases before writing any contract code.
- Ask explicitly for a Daml Script that should fail with a missing-authorization error, and verify the expected failure.
- Use AI to review contracts for missing signatories, observers, controllers, and privacy leaks.

## AI for general Canton usage

- Query ledger state via the JSON Ledger API with an AI agent as an operational assistant. Use the prebuilt [@canton-network/core-ledger-client](https://www.npmjs.com/package/@canton-network/core-ledger-client) or generate a typed client from the [OpenAPI spec](https://docs.digitalasset.com/build/3.5/reference/json-api/openapi.html).
- Scaffold dApp frontends against the [@canton-network/dapp-sdk](https://www.npmjs.com/package/@canton-network/dapp-sdk) with AI-generated wiring.
- For synchronizer operations, AI is useful for log and trace triage but unreliable for config generation; cross-reference the operate docs.
- Expose Canton tooling to an agent via MCP: the [canton-mcp-server](https://github.com/ChainSafe/canton-mcp-server) wraps `daml` and `canton` CLIs, and the [Lighthouse explorer MCP](https://github.com/agenticledger/ClientMCP_LIGHTHOUSE_MCPSERVER) gives read access to CNS, governance, validators, and contracts.
- Pin the target Canton SDK version in the repo's rules file; the agent will otherwise mix 3.3/3.4/3.5 doc paths and API shapes.
