#!/bin/bash
# Script to send Telegram messages to Theodor via OpenClaw/Claw
# Usage: ./scripts/send-telegram.sh "Your message here" [optional_file_path]

MESSAGE="${1:-Message from gptme/tbrain}"
FILE_PATH="${2:-}"

if [ -n "$FILE_PATH" ] && [ -f "$FILE_PATH" ]; then
    openclaw message send \
        --channel telegram \
        --target "Theodor Lundqvist" \
        --message "$MESSAGE" \
        --file "$FILE_PATH"
else
    openclaw message send \
        --channel telegram \
        --target "Theodor Lundqvist" \
        --message "$MESSAGE"
fi
