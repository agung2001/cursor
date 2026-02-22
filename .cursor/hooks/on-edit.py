#!/usr/bin/env python3
# afterFileEdit hook — logs each AI file edit to .cursor/logs/edits.log (cross-platform)

import sys
import json
import os
from datetime import datetime

data = json.load(sys.stdin)
file_path = data.get("file_path", "unknown")
conversation_id = data.get("conversation_id", "unknown")
timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

log_dir = os.path.join(os.path.dirname(__file__), "..", "logs")
os.makedirs(log_dir, exist_ok=True)
log_file = os.path.join(log_dir, "edits.log")

with open(log_file, "a") as f:
    f.write(f"[{timestamp}] edited: {file_path} (conversation: {conversation_id})\n")
