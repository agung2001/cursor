#!/bin/bash
# afterFileEdit hook — logs each AI file edit to .cursor/logs/edits.log

LOG_DIR="$(dirname "$0")/../logs"
LOG_FILE="$LOG_DIR/edits.log"

mkdir -p "$LOG_DIR"

INPUT=$(cat)

FILE_PATH=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('file_path','unknown'))" 2>/dev/null)
CONVERSATION_ID=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('conversation_id','unknown'))" 2>/dev/null)
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] edited: $FILE_PATH (conversation: $CONVERSATION_ID)" >> "$LOG_FILE"
