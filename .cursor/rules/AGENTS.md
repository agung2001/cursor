# AGENTS.md

Persistent Cursor Rule: **Always load project rules listed in `.cursor/rules/` for this project.**

- Refer to the design conventions and file structure rules found in:
  - `file-structure.mdc`
  - `project-overview.mdc`
  - `html-conventions.mdc`
  - `css-conventions.mdc`
  - `js-conventions.mdc`

- When acting as an agent in this project, follow:
  - All design tokens, CSS, and HTML/JavaScript authoring conventions as described in these files.
  - Project is a single-page static site: no frameworks, no build tool, no extra HTML pages.

- When generating or editing code:
  - Always prefer semantic, accessible, maintainable approaches.
  - Enforce the specified [File Structure](file-structure.mdc).
  - Use only vanilla HTML, CSS, and JavaScript patterns defined by the project.

- Do not add new agents/rules files without explicit user instruction.
- Do not introduce conventions that conflict with the rules documented in this folder.
