Perform a thorough code review of the current changes (staged, unstaged, or a specified diff) using the following checklist. Report findings grouped by category.

Run `git diff` (or `git diff HEAD` for all uncommitted changes) to get the diff to review.

---

## Checklist

### Correctness
- [ ] Logic is correct and handles all expected inputs.
- [ ] Edge cases are considered (empty values, nulls, boundary conditions).
- [ ] No off-by-one errors or incorrect conditionals.
- [ ] Async/await or promise chains are handled correctly (no unhandled rejections).

### Security
- [ ] No secrets, tokens, or credentials are hardcoded.
- [ ] User inputs are validated and sanitized before use.
- [ ] No new attack surfaces introduced (XSS, injection, CSRF, etc.).

### Performance
- [ ] No unnecessary loops, redundant computations, or blocking calls.
- [ ] DOM queries and reflows are minimized where applicable.
- [ ] Large assets or payloads are not loaded synchronously.

### Readability & Maintainability
- [ ] Variable and function names are clear and self-documenting.
- [ ] Functions are focused and not overly long.
- [ ] No dead code or commented-out blocks left in.
- [ ] Comments explain *why*, not *what*.

### Consistency
- [ ] Code style matches the surrounding codebase conventions.
- [ ] CSS follows the project's design token system.
- [ ] No new dependencies or patterns introduced without justification.

### Tests
- [ ] New behaviour is covered by tests (if a test suite exists).
- [ ] Existing tests still pass with the changes.

---

After reviewing, provide:
1. A **summary** of what the diff does.
2. A list of **issues found**, each with a severity (critical / warning / suggestion) and the file + line reference.
3. An **overall verdict**: Approve / Request Changes / Needs Discussion.
