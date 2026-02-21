#!/bin/bash
# stop hook — sends a macOS notification and logs the session summary

LOG_DIR="$(dirname "$0")/../logs"
LOG_FILE="$LOG_DIR/sessions.log"

mkdir -p "$LOG_DIR"

INPUT=$(cat)

STATUS=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('status','unknown'))" 2>/dev/null)
CONVERSATION_ID=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('conversation_id','unknown'))" 2>/dev/null)
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] task $STATUS (conversation: $CONVERSATION_ID)" >> "$LOG_FILE"

case "$STATUS" in
  completed)
    TITLE="Task Complete"
    MESSAGE="Cursor agent finished successfully."
    SOUND="Glass"
    ;;
  error)
    TITLE="Task Failed"
    MESSAGE="Cursor agent encountered an error."
    SOUND="Basso"
    ;;
  aborted)
    TITLE="Task Aborted"
    MESSAGE="Cursor agent was stopped."
    SOUND="Funk"
    ;;
  *)
    TITLE="Cursor"
    MESSAGE="Agent task ended."
    SOUND="Glass"
    ;;
esac

osascript -e "display notification \"$MESSAGE\" with title \"$TITLE\" sound name \"$SOUND\""
