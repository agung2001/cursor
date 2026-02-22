#!/usr/bin/env python3
# stop hook — logs session summary and sends a desktop notification (cross-platform)

import sys
import json
import os
import platform
import subprocess
from datetime import datetime

data = json.load(sys.stdin)
status = data.get("status", "unknown")
conversation_id = data.get("conversation_id", "unknown")
timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

# Logging
log_dir = os.path.join(os.path.dirname(__file__), "..", "logs")
os.makedirs(log_dir, exist_ok=True)
log_file = os.path.join(log_dir, "sessions.log")

with open(log_file, "a") as f:
    f.write(f"[{timestamp}] task {status} (conversation: {conversation_id})\n")

# Notification content
messages = {
    "completed": ("Task Complete", "Cursor agent finished successfully."),
    "error":     ("Task Failed",   "Cursor agent encountered an error."),
    "aborted":   ("Task Aborted",  "Cursor agent was stopped."),
}
title, message = messages.get(status, ("Cursor", "Agent task ended."))

system = platform.system()

if system == "Darwin":
    subprocess.run([
        "osascript", "-e",
        f'display notification "{message}" with title "{title}" sound name "Glass"'
    ])

elif system == "Windows":
    ps_script = (
        f"[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType=WindowsRuntime] | Out-Null;"
        f"$template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02);"
        f"$template.SelectSingleNode('//text[@id=1]').InnerText = '{title}';"
        f"$template.SelectSingleNode('//text[@id=2]').InnerText = '{message}';"
        f"$toast = [Windows.UI.Notifications.ToastNotification]::new($template);"
        f"[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Cursor').Show($toast);"
    )
    subprocess.run(["powershell", "-Command", ps_script])

elif system == "Linux":
    subprocess.run(["notify-send", title, message])
