Set up a clean starting point for implementing a new feature. This workflow creates a dedicated branch, scaffolds any required files, and leaves a focused implementation plan ready to act on.

Provide the feature name when invoking this command, e.g.:
> `/setup-new-feature dark mode toggle`

---

Steps to follow:

1. **Confirm the working tree is clean:**
   ```
   git status
   ```
   If there are uncommitted changes, warn the user and stop — do not proceed until the tree is clean.

2. **Pull the latest main:**
   ```
   git checkout main && git pull origin main
   ```

3. **Create a feature branch** using kebab-case derived from the feature name:
   ```
   git checkout -b feat/<feature-name-in-kebab-case>
   ```

4. **Understand the existing codebase** before scaffolding:
   - Read `index.html`, `style.css`, and `script.js`.
   - Read `.cursor/rules/` convention files relevant to the feature type.

5. **Scaffold** any new files or sections needed (only if clearly required — prefer editing existing files).
   - Follow the project's file structure: all source at root, no new HTML pages, no build tools.
   - Add HTML markup to `index.html`, styles to `style.css`, and JS to `script.js`.

6. **Write an implementation plan** as an inline comment block or a brief summary, covering:
   - What needs to be built.
   - Which files will be touched.
   - Any design tokens or Lucide icons to use.
   - Known edge cases to handle.

7. **Report back:**
   - Branch name created.
   - Files touched or created.
   - The implementation plan, ready to execute.
