Generate a concise onboarding guide for a new developer joining this project. Base the guide entirely on the actual codebase and existing documentation — do not invent conventions.

Steps to follow:

1. Read the following files to gather context:
   - `README.md`
   - `.cursor/rules/project-overview.mdc`
   - `.cursor/rules/file-structure.mdc`
   - `.cursor/rules/html-conventions.mdc`
   - `.cursor/rules/css-conventions.mdc`
   - `.cursor/rules/js-conventions.mdc`
2. Inspect the project root for any additional config files (`.gitignore`, etc.).
3. Produce a developer onboarding document with the following sections:

---

## Project Overview
Brief description of what the project is and its purpose.

## Tech Stack
List of languages, tools, and libraries used, with versions where relevant.

## Getting Started
Step-by-step instructions to get a local development environment running (clone, install dependencies if any, start dev server).

## Project Structure
Annotated file tree of the key files and folders.

## Conventions & Standards
Summary of the coding, CSS, HTML, and JS conventions enforced in this project.

## Common Workflows
How to:
- Start the dev server
- Make and preview a change
- Commit and push
- Open a pull request

## Useful Slash Commands
List of available `.cursor/commands/` with a one-line description of each.

---

Output the guide as clean markdown. Do not add anything that is not grounded in the actual project files.
