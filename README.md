# Cursor Training Project

This project is a simple landing page for a cursor training program. It is built with HTML, CSS, and JavaScript.

## Agents

### Browser

Here are some useful prompts you can use with the `@Browser` agent in this project:

- `@Browser Open http://localhost:8000` : Opens the site in your default web browser (ensure the PHP server is running).
- `@Browser Review Design` : Review the current site design.

## Commands

- open-browser.md : Open project in default browser
- php-server.md : Run php server command

## Hooks

Cursor hooks are custom scripts that automate actions at specific points in the agent workflow. This project uses the following hooks:

- **before-shell.sh** : Runs _before_ executing a shell command.  
  **Sample use case:**
  - If a command like `rm -rf /` is attempted, the hook will block it and notify you with a message:
    ```
    Blocked: dangerous command detected — 'rm -rf /'
    ```
  - This helps prevent accidental or malicious execution of destructive commands.

- **on-edit.sh** : Runs _after_ a file is modified by the AI.  
  **Sample log entry created:**

  ```
  [2024-06-04 13:30:12] edited: index.html (conversation: 1234-5678)
  ```

  - The log file is stored at `.cursor/logs/edits.log`. This provides a clear audit trail of AI-driven changes.

- **on-stop.sh** : Runs when a Cursor agent task finishes (completed, failed, or aborted).  
  **Sample log entry created:**
  ```
  [2024-06-04 14:01:18] task completed (conversation: 1234-5678)
  ```

  - On macOS, you will also receive a desktop notification about the task status, such as "Task Complete" or "Task Failed".

These hooks help increase project safety, provide useful audit trails, and improve feedback while collaborating with Cursor agents.
