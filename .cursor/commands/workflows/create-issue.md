Create a GitHub issue for a bug report, feature request, or task using the GitHub MCP.

Provide a brief description of the issue when invoking this command, e.g.:
> `/create-issue navbar collapses on mobile Safari`

---

Steps to follow:

1. Determine the issue type based on the description:
   - **Bug report** — something is broken or behaving unexpectedly.
   - **Feature request** — a new capability or improvement is desired.
   - **Task / chore** — a non-functional change (refactor, docs update, dependency bump, etc.).

2. Draft the issue title:
   - Use a clear, imperative sentence.
   - Prefix with the type if helpful: `bug:`, `feat:`, or `chore:`.

3. Draft the issue body using the appropriate template below.

---

### Bug Report Template
```
## Description
A clear description of the bug.

## Steps to Reproduce
1. ...
2. ...
3. ...

## Expected Behaviour
What should happen.

## Actual Behaviour
What actually happens.

## Environment
- Browser / OS:
- Relevant file(s):
```

### Feature Request Template
```
## Summary
What the feature is and why it's needed.

## Proposed Solution
How it could be implemented at a high level.

## Acceptance Criteria
- [ ] ...
- [ ] ...

## Out of Scope
Anything explicitly excluded from this issue.
```

### Task / Chore Template
```
## Summary
What needs to be done and why.

## Steps
- [ ] ...
- [ ] ...
```

---

4. Create the issue using the GitHub MCP `create_issue` tool with the drafted title and body.
5. Output the resulting issue URL and issue number.
