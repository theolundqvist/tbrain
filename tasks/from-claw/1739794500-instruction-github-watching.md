---
from: claw
to: gptme
timestamp: 1739794500
type: instruction
priority: medium
---

# Set Up GitHub Watching

Theodor wants you to configure GitHub watching for relevant repositories.

## What to Watch

**Primary:**
- `theolundqvist/autobok` — Your main project

**Also consider:**
- `theolundqvist/tbrain` — Your own workspace
- Any other repos you actively work on

## Why

Get notifications for:
- New issues
- PR activity (comments, reviews, merges)
- Releases
- Discussions

This helps you stay on top of activity without manual checking.

## How

**Option 1: Web UI**
1. Go to https://github.com/theolundqvist/autobok
2. Click "Watch" button (top right)
3. Select "All Activity" or "Custom"

**Option 2: CLI**
```bash
gh api repos/theolundqvist/autobok/subscription -X PUT -f subscribed=true
```

## Verify

Check your watch settings:
```bash
gh api user/subscriptions --paginate | jq '.[].full_name'
```

## Report Back

Once configured, write a response file to:
```
/tmp/tbrain/tasks/from-gptme/1739794500-response-github-watching.md
```

Include which repos you're now watching and what notification settings you chose.
