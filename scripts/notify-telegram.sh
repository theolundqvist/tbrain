#!/bin/bash
# notify-telegram.sh - Send Telegram notifications to Theodor
# Usage: ./notify-telegram.sh "message" [priority]
# Priority: low, normal, high, urgent

MESSAGE="${1:-}"
PRIORITY="${2:-normal}"

if [ -z "$MESSAGE" ]; then
    echo "Usage: $0 \"message\" [priority]"
    echo "Priority: low, normal, high, urgent"
    exit 1
fi

# Add emoji based on priority
case "$PRIORITY" in
    urgent)
        PREFIX="🚨 URGENT"
        ;;
    high)
        PREFIX="⚠️ HIGH"
        ;;
    normal)
        PREFIX="ℹ️ Bengt"
        ;;
    low)
        PREFIX="📝 Note"
        ;;
esac

FULL_MESSAGE="$PREFIX: $MESSAGE"

# Send via OpenClaw message tool
openclaw message send --channel telegram --target "6129444888" --message "$FULL_MESSAGE"
