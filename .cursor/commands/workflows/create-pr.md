Create a pull request for the current branch using the GitHub MCP.

Steps to follow:

1. Confirm the current branch is not `main` or `master`:
   ```
   git branch --show-current
   ```
2. Ensure all changes are committed and the branch is pushed to the remote:
   ```
   git status
   git push -u origin HEAD
   ```
3. Gather context for the PR description:
   - Run `git log main..HEAD --oneline` to list commits included in this branch.
   - Run `git diff main...HEAD --stat` for a file-level summary of changes.
4. Draft a PR title and body:
   - **Title**: concise, imperative mood (e.g. `feat: add dark mode toggle`).
   - **Body** must include:
     - `## Summary` — what this PR does and why (2–5 bullet points).
     - `## Changes` — notable files or areas touched.
     - `## Test plan` — how to manually verify the changes.
     - `## Screenshots` — (if UI changes) placeholder or actual screenshots.
5. Create the PR using the GitHub MCP `create_pull_request` tool targeting the `main` branch.
6. Output the resulting PR URL.
