#!/bin/sh
# Print my open GitHub PRs for the tmux status bar.
# For example " 6 ✓1" means 6 open PRs, and 1 of them is approved.
# Prints nothing if gh is not installed.
#
# tmux runs this every status-interval (5s), so the counts are cached in a
# file and fetched from GitHub again at most every 5 minutes.

command -v gh >/dev/null 2>&1 || exit 0

cache=${TMPDIR:-/tmp}/tmux-gh-prs-$(id -u)

# find prints the file only if it changed less than 5 minutes ago.
if [ -z "$(find "$cache" -mmin -5 2>/dev/null)" ]; then
  counts=$(gh api graphql -f query='{
    open: search(query: "is:pr is:open archived:false author:@me", type: ISSUE) { issueCount }
    approved: search(query: "is:pr is:open archived:false author:@me review:approved", type: ISSUE) { issueCount }
  }' --jq '"\(.data.open.issueCount) \(.data.approved.issueCount)"' 2>/dev/null)
  if [ -n "$counts" ]; then
    echo "$counts" >"$cache"
  else
    # Offline or logged out: keep the old counts and try again in 5 minutes.
    touch "$cache"
  fi
fi

read -r open approved 2>/dev/null <"$cache" || exit 0
# \357\220\207 is the nerd font "pull request" icon (U+F407).
printf ' \357\220\207 %s ✓%s\n' "$open" "$approved"
