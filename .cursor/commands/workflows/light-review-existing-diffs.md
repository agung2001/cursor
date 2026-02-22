Perform a quick, high-signal review of the current working tree or staged diff. This is a lighter pass than the full `code-review-checklist` — focus on catching obvious bugs, security issues, and style violations without going deep into every line.

Get the diff:
```
git diff          # unstaged changes
git diff --cached # staged changes only
git diff HEAD     # all uncommitted changes
```

---

## What to look for

**Must flag (blocking issues):**
- Hardcoded secrets, passwords, or API keys.
- Obvious logic errors (wrong operator, inverted condition, missing return).
- Syntax errors or code that will throw at runtime.
- Accidental removal of critical logic.

**Should flag (warnings):**
- `console.log`, `debugger`, or leftover TODO comments checked in.
- Functions that grew significantly longer without obvious justification.
- CSS or JS that bypasses the design token system.
- New magic numbers or strings that should be constants.

**Nice to flag (suggestions):**
- Naming that could be clearer.
- Minor style inconsistencies with the surrounding code.

---

Keep the output concise. For each finding, provide:
- **Severity**: blocker / warning / suggestion
- **File and line** (if determinable from the diff)
- **One-line description** of the issue

End with a single-line verdict: `LGTM`, `Minor issues`, or `Needs fixes before merging`.
