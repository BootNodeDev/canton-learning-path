# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A curated, progression-ordered learning path for Canton Network developers, published at https://github.com/BootNodeDev/canton-learning-path.

Content lives in `README.md` (title, intro, Foundations, chapter index, License) and per-chapter files under `docs/` (`concepts.md`, `daml.md`, `building.md`, `internals.md`, `operations.md`, `ai-assisted.md`, `community.md`). Everything else (LICENSE, `.gitignore`, `.claude/`) exists to support those. There is no build system, no test suite, no package manager, no application code.

## Source of truth for maintenance rules

**All editorial rules, section order, formatting requirements, lint checks, and workflow live in `.claude/skills/maintain-canton-learning-path/SKILL.md`.** When adding, removing, or updating entries, read that skill first and follow it. This file intentionally does not duplicate those rules so they stay in one place.

Invoke the skill via the `Skill` tool when the task is: add/remove/update a resource, refresh links, or reorganize a section.

## Verifying links

Every URL in `README.md` and `docs/*.md` must resolve and contain content matching its description. Use `WebFetch` to verify before adding. The project `.claude/settings.json` pre-authorizes WebFetch against the Canton-ecosystem domains already in use; if you need a new domain, add it to that file (tracked) rather than to `.claude/settings.local.json` (ignored, personal overrides only).

## Lint before commit

The skill's SKILL.md contains the exact grep/awk commands for checking forbidden parenthetical attributions, em/en dashes, emojis, and the 10-link-per-section cap. Run them before every commit.

## Git

Single `main` branch, linear history. Changes ship as small, focused commits pushed directly to `main`. No PR workflow is enforced on this repo.
