Perform a security-focused audit of the codebase. Scan all source files for common vulnerabilities and report findings with severity ratings.

Steps to follow:

1. List all source files in scope:
   ```
   git ls-files
   ```

2. Audit each category below, reading the relevant files as needed.

---

## Audit Categories

### Secrets & Credentials
- Search for hardcoded API keys, tokens, passwords, or private keys.
- Check that `.env` files (if any) are listed in `.gitignore` and not tracked by git.
- Patterns to look for: `apiKey`, `secret`, `password`, `token`, `Bearer `, `private_key`.

### Input Handling (XSS / Injection)
- Look for places where user-controlled data is inserted into the DOM (e.g. `innerHTML`, `document.write`, `eval`).
- Check that dynamic content uses safe APIs (`textContent`, `createElement`) instead of raw HTML injection.

### Third-Party Dependencies
- Review scripts loaded via CDN (`<script src="...">`) — confirm they use pinned versions or SRI (Subresource Integrity) hashes.
- Flag any CDN URLs that use `@latest` or unpinned versions.

### Sensitive Data Exposure
- Confirm no PII, internal URLs, or environment-specific configuration is hardcoded in source files.
- Check HTML comments and JS comments for accidentally leaked information.

### HTTPS & Mixed Content
- Confirm all external resources (scripts, fonts, images) are loaded over `https://`.

### Open Redirects & Dangerous Links
- Check anchor tags and `window.location` assignments for unvalidated redirect targets.

---

## Output Format

For each finding, provide:
- **Category**
- **Severity**: critical / high / medium / low / info
- **File and line** (or code snippet)
- **Description** of the risk
- **Recommendation** on how to fix it

End with an **overall security posture** summary: Secure / Needs Attention / Critical Issues Found.
