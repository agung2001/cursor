Test the `on-stop.py` hook notification by running the following command in the terminal:

```
echo '{"status": "completed", "conversation_id": "test-123", "hook_event_name": "stop", "workspace_roots": ["."]}' | python3 .cursor/hooks/on-stop.py
```

To test each status type, run:

```
echo '{"status": "error", "conversation_id": "test-123", "hook_event_name": "stop", "workspace_roots": ["."]}' | python3 .cursor/hooks/on-stop.py
```

```
echo '{"status": "aborted", "conversation_id": "test-123", "hook_event_name": "stop", "workspace_roots": ["."]}' | python3 .cursor/hooks/on-stop.py
```

Each command simulates what Cursor sends to the hook when a task ends. A desktop notification should appear and a log entry will be written to `.cursor/logs/sessions.log`.
