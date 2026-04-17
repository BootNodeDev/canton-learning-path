#!/usr/bin/env bash
# Run all hard-rule editorial lint checks against README.md and docs/*.md.
# Exit 0 if clean, 1 if any check fails, 2 if environment is wrong.
# Portable: uses perl with -CSD for Unicode because macOS BSD grep lacks -P.
set -euo pipefail

repo_root=$(git rev-parse --show-toplevel 2>/dev/null) || {
  echo "FAIL: not inside a git repository" >&2
  exit 2
}
cd "$repo_root"
[[ -f README.md ]] || {
  echo "FAIL: README.md not found at $repo_root" >&2
  exit 2
}

shopt -s nullglob
files=(README.md docs/*.md)

fail=0

report_ok() {
  echo "OK: $1"
}
report_fail() {
  echo "FAIL: $1"
  [[ -n "${2:-}" ]] && echo "$2"
  fail=1
}

check_file() {
  local file=$1
  local bad

  # 1. Forbidden parenthetical attributions in link titles.
  bad=$(grep -nE '\(PDF\)|\(Daml docs\)|\(Kasireddy\)|\(Ethereum\.org\)|\(Halborn\)|\(Digital Asset\)|\(Preethi[^)]*\)' "$file" || true)
  if [[ -z "$bad" ]]; then
    report_ok "$file: parenthetical attributions"
  else
    report_fail "$file: parenthetical attributions" "$bad"
  fi

  # 2. Em dash / en dash (decode as UTF-8 via -CSD).
  bad=$(perl -CSD -nle 'print "  line $.: $_" if /[\x{2014}\x{2013}]/' "$file")
  if [[ -z "$bad" ]]; then
    report_ok "$file: em/en dashes"
  else
    report_fail "$file: em/en dashes" "$bad"
  fi

  # 3. Emoji (covers Misc Symbols, Dingbats, Supplemental Symbols, Pictographs).
  bad=$(perl -CSD -nle 'print "  line $.: $_" if /[\x{2600}-\x{27BF}\x{2B00}-\x{2BFF}\x{1F000}-\x{1FFFF}]/' "$file")
  if [[ -z "$bad" ]]; then
    report_ok "$file: emoji"
  else
    report_fail "$file: emoji" "$bad"
  fi

  # 4. 10-link cap per heading. README uses H2-H4; docs/*.md use H1-H3 (H1 is the chapter title).
  #    Scanning H2-H4 in README and H1-H3 (but we use H2-H3 since H1 has no link bullets) works
  #    uniformly with a single regex that matches any heading at levels 1-4.
  local over
  over=$(awk '
    /^#{1,4} / {
      if (NR>1 && count>10) print "  " h ": " count " links"
      h=$0; count=0; next
    }
    /^- \[/ { count++ }
    END { if (count>10) print "  " h ": " count " links" }
  ' "$file")
  if [[ -z "$over" ]]; then
    report_ok "$file: 10-link cap"
  else
    report_fail "$file: 10-link cap" "$over"
  fi

  # 5. Reading-time markers must use *(Est. time: N min)* / *(Est. time: N hours)*.
  #    A bare (N min) or (N hours) without the Est. time prefix is the old format.
  bad=$(grep -nE '\([0-9]+ (min|hours)\)' "$file" || true)
  if [[ -z "$bad" ]]; then
    report_ok "$file: reading-time format"
  else
    report_fail "$file: reading-time format (use *(Est. time: N min)* not bare (N min))" "$bad"
  fi
}

for f in "${files[@]}"; do
  check_file "$f"
done

exit $fail
