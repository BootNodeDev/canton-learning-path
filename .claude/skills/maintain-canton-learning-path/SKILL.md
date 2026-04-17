---
name: maintain-canton-learning-path
description: Use when adding, removing, updating, reorganizing, or reviewing entries in this repo's README, or when asked to refresh/extend the Canton Network learning path
---

# Maintain the Canton Learning Path

Curated list of Canton Network learning resources. Content is split across `README.md` (title, intro, Foundations, chapter index, License) and per-chapter files under `docs/`. No build, no tests. All editorial rules are load-bearing.

## File layout

```
README.md                  title, intro, Foundations, chapter index -> docs/*, License
docs/
  concepts.md              Canton Network: Concepts
  ethereum-vs-canton.md    Ethereum vs. Canton
  daml.md                  Daml
  building.md              Building on Canton
  internals.md             Platform Internals
  operations.md            Operations and Ecosystem
  ai-assisted.md           AI-Assisted Development
  community.md             Learning and Community
```

Inside every `docs/*.md`, heading levels are shifted one level up compared to the original README layout: the chapter title is H1, old H3 subsections are H2, the single old H4 (`Ecosystem wallets` under `dApp Frontend Development`) is H3. Heading TEXT is unchanged so in-file anchors stay stable.

When the user asks to add/update/remove a resource, the target file is determined by the topic: Daml testing resource -> `docs/daml.md`, validator operation -> `docs/operations.md`, etc. Foundations resources stay in `README.md`.

## Startup (run in order)

### 1. Model check (blocking)

If the active model is not Opus:

Use `AskUserQuestion` with:
- Title: "Running on a non-Opus model - editorial judgment is stronger on Opus"
- Body: "Curating the learning path (evaluating sources, writing descriptions, deciding what to drop) benefits from Opus-class reasoning. You can switch with `/model` before proceeding."
- Options:
  1. "Continue with the current model"
  2. "I'll switch to Opus first"

If the user picks option 2, print:
> To switch: type `/model` in a new message and select `claude-opus-4-7`. Then restart the skill.

Then halt. The skill restarts cleanly after the switch.

If the user picks option 1, proceed. Do not repeat this check.

If the env var `CANTON_PATH_SUPPRESS_MODEL_NOTE=1` is set, skip this check entirely.

### 2. Confirm plan mode

This skill expects to run in plan mode so the user can review edits before they land. A skill cannot enter plan mode on its own; the user switches via shift+tab or the CLI `--permission-mode plan` flag.

If plan mode is NOT active, ask the user via `AskUserQuestion`:

- Question: "This skill expects plan mode so you can review edits before they land. Continue without, or stop and switch?"
- Options (single-select):
  - "Stop and switch (recommended)" - tell the user to press shift+tab or restart with `--permission-mode plan`, then stop here.
  - "Proceed without plan mode" - continue but announce every edit before applying it.

All reads, WebFetches, and agent dispatches below are safe under plan mode. The only write step is the final edit to `README.md` or a `docs/*.md` file + commit + push, which requires `ExitPlanMode` approval when plan mode is active.

### 3. Pull latest

```bash
git pull --ff-only
```

## Hard rules

1. **Verify every URL via WebFetch before adding.** A 200 is not enough; the content must match the description.
2. **Max 10 links per heading (any level below H1).** Subsections count separately. The heading levels differ per file: `README.md` uses H2-H4, `docs/*.md` uses H2-H3 (H1 is the chapter title and has no link bullets under it directly). If adding would exceed 10 for that heading, remove or merge a weaker entry first.
3. **One-line descriptions, <=25 words.** No multi-sentence blurbs. No dates in descriptions ("from February 2026", "approved October 2025") - they go stale. Trim enumerations: prefer one or two specifics over a full list, or generalize. Omit the description if the title is self-explanatory.
4. **Link title is the plain resource name.** No parenthetical attribution: no `(Daml docs)`, `(PDF)`, `(Kasireddy)`, `(November 2025)`, `(Halborn)`, etc.
5. **Reading times in these four sections only:** `README.md` > Foundations > Pre-requisites, `README.md` > Foundations > Blockchain Fundamentals, `docs/concepts.md` > General Info, `docs/ethereum-vs-canton.md` > Articles and Deep Dives. Format `*(Est. time: N min)*` or `*(Est. time: N hours)*`. Keep estimates conservative.
6. **No ToC** (GitHub renders one automatically per file).
7. **No emojis. No em/en dashes.** Use commas, periods, or spaced hyphens.
8. **Prefer the latest Canton SDK version in URLs.** Older paths (3.3, 3.4) frequently 404; resolve to the newest available version for the same page.

## Section order (do not reorder without explicit instruction)

Each chapter lives in its own file. The chapter title is H1 in that file; subsections are H2; the single H4 case (`Ecosystem wallets`) is H3 in `docs/building.md`. Heading TEXT is load-bearing: changing it breaks GitHub anchors. Add new sections inside the chapter (file) that matches their topic; surface a fit problem to the user rather than creating a new chapter.

1. **`README.md` > Foundations** (H2 in README)
   1. Pre-requisites (H3)
   2. Blockchain Fundamentals (H3)
2. **`docs/concepts.md` - Canton Network: Concepts** (H1)
   1. General Info
   2. Canton Core Concepts
   3. Privacy Model Deep Dive
   4. Canton Coin and Tokenomics
   5. Interoperability and Atomic Settlement
3. **`docs/ethereum-vs-canton.md` - Ethereum vs. Canton** (H1)
   1. Articles and Deep Dives
   2. Terminology Mapping
   3. How-to Mapping
4. **`docs/daml.md` - Daml** (H1)
   1. Learning Daml
   2. Daml Patterns and Best Practices
   3. Testing Daml
   4. Daml Finance and Tokenization
4. **`docs/building.md` - Building on Canton** (H1)
   1. Quickstart and Hands-on
   2. Toolbox
   3. Example Apps
   4. Libraries and Frameworks
   5. dApp Frontend Development (with `### Ecosystem wallets` H3 subsection)
5. **`docs/internals.md` - Platform Internals** (H1)
   1. Under the Hood
   2. Zenith: EVM on Canton
   3. Canton Improvement Proposals (CIPs)
6. **`docs/operations.md` - Operations and Ecosystem** (H1)
   1. Node Operation and Infrastructure
   2. Explorers and Analytics
   3. Real-world Deployments
7. **`docs/ai-assisted.md` - AI-Assisted Development** (H1, with H2 subsections: general assistants, model choice, testing, general usage, making an LLM better at Daml)
8. **`docs/community.md` - Learning and Community** (H1)
   1. Courses and Certification
   2. Hackathons, Grants and Careers
   3. Community, Forums and Talks
9. **`README.md` > License** (H2 in README)

The chapter order above also matches the order of the chapter-index H2 sections in `README.md`. Each chapter section in `README.md` has a one-paragraph intro and a single `[Read the full chapter](docs/X.md).` link; do not add more than that top-level link under the chapter's H2 in `README.md`.

## Entry format

Four permitted styles:

```markdown
- [Resource name](url) - short description
- Read [Resource name](url) on a specific aspect of the topic.
- Watch [Resource name](url) for a video walk-through.
- Grouped topic
  - Work through [Resource name](url) *(Est. time: 20 hours)*
  - Browse [Resource name](url) for reference.
```

Reading-time suffix (four designated sections only): append `*(Est. time: N min)*` or `*(Est. time: N hours)*` at the end of the line.

**Prefer the grouped-topic style** when a section has >=4 bullets that span more than one sub-theme (e.g., "Technical contrasts" vs "Institutional privacy" inside Canton vs. Ethereum). Keep groups to 2-4 sub-items. A section with <4 bullets or a single cohesive theme stays flat.

The 10-link cap counts top-level `- [` bullets per heading. Grouped sub-bullets (indented) do not each count as a slot.

## Agent dispatch rule

Two phases MUST dispatch subagents via the `Task` tool with the provided prompt templates. Do NOT inline them - the prompt files encode output contracts that are lost when done inline.

For each dispatch:
1. Read the prompt template file.
2. Call `Task` with `subagent_type: general-purpose` (the prompts rely on `WebFetch`, which `general-purpose` exposes; `Explore` does not). Pass the template content as `prompt`, plus the specified inputs.
3. Wait for the structured table/list output.

| Phase | When | Template |
|-------|------|----------|
| URL verification | Adding, replacing, or periodically sweeping links | `.claude/skills/maintain-canton-learning-path/url-verifier-prompt.md` |
| Link research | Filling a topic gap ("find Daml testing resources") | `.claude/skills/maintain-canton-learning-path/link-researcher-prompt.md` |

Both agents are read-only and run during plan mode. Multiple verification agents can run in parallel; dispatch them in a single message when candidate lists are independent.

## Repetitive commands (inline recipes)

Run from the repo root. Most recipes take a file argument so you can target the chapter file you are editing.

**Links per heading (any level H1-H4, works for both `README.md` and `docs/*.md`):**
```bash
awk '/^#{1,4} / {if (NR>1) print h ": " count; h=$0; count=0; next} /^- \[/ {count++} END {print h ": " count}' docs/daml.md
```

**Links per heading across every file:**
```bash
for f in README.md docs/*.md; do echo "=== $f ==="; awk '/^#{1,4} / {if (NR>1) print h ": " count; h=$0; count=0; next} /^- \[/ {count++} END {print h ": " count}' "$f"; done
```

**Show a section's current block (inside a `docs/*.md` the target heading is H2, e.g. `## Testing Daml`):**
```bash
awk -v s="## Testing Daml" '$0==s {p=1} /^## / && $0!=s && p {exit} p' docs/daml.md
```

**Is this URL already in the path (README + all chapter files)?**
```bash
grep -rn 'https://example.com/path' README.md docs/
```

**Find near-duplicates (same domain, different paths, across all files):**
```bash
grep -hoE 'https?://[^)]+' README.md docs/*.md | awk -F/ '{print $3}' | sort | uniq -c | sort -rn | head -20
```

**Full lint (required before commit):**
```bash
.claude/skills/maintain-canton-learning-path/scripts/lint.sh
```

Exit 0 = clean, 1 = at least one failure. All failures must be fixed before commit. The lint script iterates over `README.md` + every `docs/*.md` automatically.

## Workflow

1. **Startup** (model check, plan mode, pull).
2. **Identify the target file.** Foundations / License changes -> `README.md`. Everything else -> the chapter file under `docs/` whose topic matches (see the Section order mapping above). **Read** both `README.md` and the target chapter file.
3. **Gather candidates**:
   - User gave URLs -> dispatch the **URL verifier** agent.
   - User gave a topic -> dispatch the **Link researcher** agent.
4. **Check section capacity** with the "links per heading" recipe on the target file. If the target heading is at 10, identify the weakest existing entry to drop/merge and state the reasoning.
5. **Draft the plan file** with additions, drops, rationale, and the target file path.
6. **ExitPlanMode** for approval.
7. **Apply** the edit to the target file (`README.md` or `docs/*.md`).
8. **Lint** with `scripts/lint.sh` (runs across every file). Any FAIL = fix and re-run; do not commit red.
9. **Commit** with imperative subject (`chore:`, `docs:`, etc., matching history). **Push** with `git push`.

## Red flags (stop and reconsider)

| Thought | Reality |
|---------|---------|
| "URL looks fine, I'll skip WebFetch" | Canton docs paths change per SDK release. Verify or do not add. |
| "Just one extra link, 11 is fine" | 10 is the cap. Replace or merge. |
| "I'll inline the verification, agent dispatch is overhead" | Prompt file encodes the output contract. Dispatch. |
| "The parenthetical gives useful context" | It clutters the title. Move to the description or drop it. |
| "Two sentences is cleaner than one" | It is not. Cut to one line. |
| "Listing three items gives useful context" | It pads length. Cut to one or two, or generalize. |
| "The date shows this is current/authoritative" | Dates in descriptions go stale. Drop them. |
| "Small emoji would add warmth" | No. |
| "Reading times take too long to estimate" | Conservative estimates are fine; required in the four designated sections. |
| "I'll force-push to tidy history" | Do not, unless the user explicitly asks. |
| "Older SDK-version URL still works" | Prefer the latest equivalent; keep older paths only if no current equivalent exists. |
| "Plan mode is overkill for a one-line change" | Enter plan mode anyway. The user wants to see the edit before it lands. |

## Common mistakes

- Adding a URL that works today but points to a version-specific docs page that will 404 at the next SDK release.
- Putting site attribution in the title instead of the description (or dropping it where possible).
- Duplicating an entry across unrelated sections. Each resource has one primary home.
- Forgetting to update anchor-sensitive internal references when renaming a heading.
- Staging `.claude/settings.local.json` or `.DS_Store`. `.gitignore` excludes them; do not override with `git add -f`.

## Commit style

Match the existing history (`chore:` / `docs:` prefix, imperative subject, <=72 chars, no period). Examples:

- `docs: add Daml Masterclass series to Learning Daml`
- `chore: replace deprecated quickstart URL with current SDK version`
- `docs: swap ccview link for current analytics dashboard`

## When to propose structural changes

Sections, order, and formatting rules are load-bearing; change only when the user explicitly asks. If a candidate resource does not fit any existing section cleanly, surface the fit problem to the user rather than inventing a new section.
