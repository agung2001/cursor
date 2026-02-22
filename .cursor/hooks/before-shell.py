#!/usr/bin/env python3
# beforeShellExecution hook — blocks dangerous shell commands (cross-platform)

import sys
import json

DANGEROUS_PATTERNS = [
    "rm -rf /",
    "rm -rf ~",
    "rm -rf *",
    ":(){ :|:& };:",
    "dd if=/dev/zero",
    "mkfs",
    "> /dev/sda",
    "chmod -R 777 /",
    "format c:",
    "del /f /s /q c:\\",
    "rd /s /q c:\\",
    "Remove-Item -Recurse -Force C:\\",
]

data = json.load(sys.stdin)
command = data.get("command", "")

for pattern in DANGEROUS_PATTERNS:
    if pattern.lower() in command.lower():
        print(json.dumps({
            "continue": False,
            "permission": "deny",
            "userMessage": f"Blocked: dangerous command detected — '{pattern}'",
            "agentMessage": f"This command has been blocked by a project safety hook because it matches a dangerous pattern: '{pattern}'."
        }))
        sys.exit(0)

print(json.dumps({"continue": True, "permission": "allow"}))
