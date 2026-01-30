# Bidirectional Agent Communication

gptme (tbrain) and Claw (OpenClaw) can trigger each other for task delegation.

## gptme → Claw

### Method 1: File-based trigger (recommended)
Drop a task file in Claw's workspace:

```bash
# From gptme - create task for Claw
cat > /root/.openclaw/workspace/tasks/from-gptme/$(date +%s).md << 'EOF'
---
from: gptme
priority: high
task: Send Telegram notification
---

Please send this message to Theodor:
"Analysis complete. 3 issues found."
EOF
```

### Method 2: Direct OpenClaw trigger
```bash
# Send message to Claw's session (if running)
openclaw sessions list | grep -i claw
# Then use sessions_send if session found
```

## Claw → gptme

### Method 1: File-based trigger (recommended)
Claw drops tasks in:
```
/tmp/tbrain/tasks/from-claw/<timestamp>.md
```

Check for new tasks:
```bash
ls -la /tmp/tbrain/tasks/from-claw/ 2>/dev/null | tail -20
```

### Method 2: Process signal
Check if Claw is running and signal:
```bash
pgrep -f openclaw && echo "Claw active"
```

## Task File Format

```markdown
---
from: gptme|claw
to: claw|gptme
task_id: <unix-timestamp>
priority: low|medium|high|urgent
type: notification|action|request|delegate
---

# Task Title

Description of what needs to be done.

## Success Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Context
Links, files, relevant info.

## Expected Output
What should happen when complete.
```

## Response Format

```markdown
---
from: claw|gptme
in_response_to: <task_id>
status: ack|in_progress|complete|blocked|failed
---

# Response

Results or status update.
```

## Workflow Example

**gptme needs Claw to send a message:**
1. gptme writes: `/root/.openclaw/workspace/tasks/from-gptme/1738225600.md`
2. Claw (on next heartbeat) sees the file
3. Claw sends Telegram message
4. Claw writes response: `/tmp/tbrain/tasks/from-claw/1738225600-response.md`
5. gptme sees response on next check

## Quick Status Check

```bash
# Check for tasks from Claw
find /tmp/tbrain/tasks/from-claw/ -type f -mmin -60 2>/dev/null

# Check Claw's response folder
ls /tmp/tbrain/tasks/from-claw/ 2>/dev/null
```

## Autonomous Run Integration

When running autonomously, both agents should:
1. Check their `tasks/from-<other-agent>/` folder
2. Process any pending tasks
3. Send start/finish messages to Telegram (per protocol)
4. Write responses back to appropriate folder
