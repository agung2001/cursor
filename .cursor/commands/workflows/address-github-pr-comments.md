Fetch all open review comments on the current pull request using the GitHub MCP, then address each one systematically.

Steps to follow:

1. Identify the current branch and its associated pull request number (use `git branch --show-current` and the GitHub MCP `get_pull_request` or `list_pull_requests` tool).
2. Fetch all review comments using the GitHub MCP `get_pull_request_comments` tool.
3. For each unresolved comment:
   - Read the referenced file and line range.
   - Understand the reviewer's concern.
   - Apply the appropriate code change.
   - If the comment is a question or clarification rather than an actionable change, note it for a follow-up reply.
4. After all changes are applied, run a quick sanity check:
   - Confirm no linter errors were introduced.
   - Confirm the logic of each changed section is still sound.
5. Stage and commit the changes with a descriptive message referencing the PR review (e.g. `fix: address PR review comments`).
6. Report a summary of every comment addressed and any that were intentionally skipped with a reason.
