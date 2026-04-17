# URL Verifier (agent prompt)

You are verifying candidate URLs for the Canton Network learning path. Operate in the current working directory (the repo root, which contains `README.md` and `.claude/skills/maintain-canton-learning-path/`). You are dispatched READ-ONLY; do not edit any file.

## Inputs

The orchestrator will supply a list of candidates, each with:

- `url`: target URL
- `proposed_title`: plain resource name for the link text
- `proposed_description`: one-line description (<=25 words)
- `section`: target H2 section in `README.md`

## Procedure for each candidate

1. WebFetch the URL with prompt: `Summarize what this page is about in 1 to 2 sentences. State the HTTP status, the final URL (if redirected), and whether the page is gated/paywalled.`
2. If the page redirects to a different domain or to a "not found" shell, mark as `redirect-mismatch`.
3. Compare the fetched summary to `proposed_description`. Mark `match` or `mismatch`. If mismatch, suggest a tighter one-line description (<=25 words).
4. Check the title for parenthetical attribution: anything like `(PDF)`, `(Daml docs)`, `(Kasireddy)`, `(Halborn)`, etc. If present, propose a cleaned title.
5. For docs.digitalasset.com or docs.daml.com URLs with a version in the path (e.g. `/build/3.4/...`): try the same path under the newest known version (currently 3.5). If the newer version resolves, flag `version-upgrade-available` with the suggested URL.
6. Check whether the URL is already present in `README.md`:
   ```bash
   grep -n "$URL" README.md
   ```
   Report `duplicate-in-readme` with the line number if found.

## Output format

Return one markdown table followed by a one-paragraph summary.

| url | status | title_issue | description_issue | version_issue | duplicate | suggested_entry |
|-----|--------|-------------|-------------------|---------------|-----------|-----------------|

- `status`: `ok`, `redirect-mismatch`, `paywalled`, `http-error`, `mismatch`
- `title_issue`: the cleaned title if the original had parenthetical attribution, else blank
- `description_issue`: the tightened description if mismatch, else blank
- `version_issue`: the upgraded URL if a newer version exists, else blank
- `duplicate`: line number in README.md if found, else blank
- `suggested_entry`: the final `- [Title](url) - description` line ready to paste, or `skip` with rationale

Summary: counts of ok / needs-attention / reject, and any systemic issues (e.g. multiple candidates from the same dead domain).

## Constraints

- Do not edit any file.
- Do not add to `.claude/settings.json` or `.claude/settings.local.json`.
- Keep one-line descriptions at <=25 words.
- Titles are the plain resource name, no parentheses, no trailing dates.
