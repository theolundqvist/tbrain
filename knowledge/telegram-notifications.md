# Telegram Notifications for Bengt

Quick helper for sending Telegram notifications to Theodor.

## Usage

### From CLI
```bash
# Using the helper script
/root/tbrain/scripts/notify-telegram.sh "Your message here" normal

# Using openclaw directly
openclaw message send --channel telegram --target "6129444888" --message "Your message"
```

### From Code/Scripts
```bash
source /root/tbrain/scripts/notify-telegram.sh "Task complete" normal
```

## Priority Levels

| Priority | Emoji | Use Case |
|----------|-------|----------|
| urgent | 🚨 | System down, data loss |
| high | ⚠️ | Needs attention today |
| normal | ℹ️ | Task completion, updates |
| low | 📝 | FYI, non-urgent |

## Examples

```bash
# Task completion
notify-telegram.sh "✅ Credit service implemented" normal

# Needs decision
notify-telegram.sh "❓ Need API key for OpenAI" high

# Critical error
notify-telegram.sh "🔥 Database connection failed" urgent
```

## Configuration

- **Target**: 6129444888 (Theodor's Telegram ID)
- **Channel**: telegram
- **Tool**: OpenClaw message send
