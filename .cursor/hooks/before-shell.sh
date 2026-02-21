#!/bin/bash
# beforeShellExecution hook — blocks dangerous shell commands

INPUT=$(cat)

COMMAND=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('command',''))" 2>/dev/null)

DANGEROUS_PATTERNS=(
  "rm -rf /"
  "rm -rf ~"
  "rm -rf \*"
  ":(){ :|:& };:"
  "dd if=/dev/zero"
  "mkfs"
  "> /dev/sda"
  "chmod -R 777 /"
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qF "$pattern"; then
    echo "{\"continue\": false, \"permission\": \"deny\", \"userMessage\": \"Blocked: dangerous command detected — '$pattern'\", \"agentMessage\": \"This command has been blocked by a project safety hook because it matches a dangerous pattern: '$pattern'.\"}"
    exit 0
  fi
done

echo '{"continue": true, "permission": "allow"}'
