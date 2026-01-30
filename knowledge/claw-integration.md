# Communication with Claw (LLAB-Machina)

Claw is another AI agent running on this same Hetzner server. He operates through OpenClaw and has access to Telegram messaging.

## When to use Claw

- Sending notifications/messages to Theodor
- Delegating tasks that require:
  - Telegram messaging
  - File operations in `/root/.openclaw/workspace/`
  - Browser automation
  - Cron job management
  - GitHub operations (as LLAB-Machina bot)

## How to send Telegram messages

Claw can message Theodor via Telegram. Use this when you need to:
- Send updates on long-running tasks
- Ask for clarification
- Report errors or blockers
- Deliver final results

### CLI Command

```bash
# Simple message
openclaw message send --channel telegram --target "6129444888" --message "Your task is complete!"

# With file attachment
openclaw message send --channel telegram --target "6129444888" --message "Report ready:" --file /path/to/report.pdf

# Using message tool directly
openclaw tools message action=send channel=telegram target="6129444888" message="Hello from gptme"
```

### From Python

```python
import subprocess

def message_theodor(text: str, file_path: str = None):
    """Send message to Theodor via Claw/OpenClaw."""
    cmd = [
        "openclaw", "message", "send",
        "--channel", "telegram",
        "--target", "6129444888",
        "--message", text
    ]
    if file_path:
        cmd.extend(["--file", file_path])
    
    result = subprocess.run(cmd, capture_output=True, text=True)
    return result.returncode == 0
```

## Claw's Capabilities

| Tool | Use case |
|------|----------|
| `message` | Telegram to Theodor |
| `browser` | Web automation (openclaw profile) |
| `cron` | Schedule reminders/tasks |
| `exec` | Run shell commands |
| `read/edit/write` | File operations |
| `sessions_spawn` | Create sub-agents |
| `web_search/web_fetch` | Research |

## Workspace

Claw's working directory: `/root/.openclaw/workspace/`

Shared files can be placed here for Claw to access.

## Delegation Pattern

When delegating to Claw:

1. **Be specific** about what you need
2. **Provide context** from your session
3. **Set clear success criteria**
4. **Expect async response** (Claw may not reply immediately)

Example delegation:
```
Claw, please send a Telegram message to Theodor:
"The data analysis for Project X is complete. 
Results saved to /tmp/tbrain/results/analysis.json
Summary: 3 critical issues found, 12 warnings."
```

## Autonomous Run Protocol

When running autonomous/scheduled tasks, you **MUST**:

1. **Start with a Telegram message:**
   ```bash
   openclaw message send --channel telegram --target "6129444888" \
     --message "🔍 Starting [task name]..."
   ```

2. **Perform the work**

3. **Finish with a Telegram message:**
   ```bash
   openclaw message send --channel telegram --target "6129444888" \
     --message "✅ [Task name] complete. Summary: [what was done]"
   ```

This applies to:
- Cron jobs
- Heartbeat checks
- Long-running background tasks
- Any autonomous agent runs

## Checking if Claw is Available

```bash
# Check if OpenClaw is running
openclaw status

# Check if Claw's session is active
openclaw sessions list | grep -i claw
```

## Contact

Claw's GitHub: @LLAB-Machina
Claw's SSH key: `~/.ssh/id_ed25519_llab` (configured as `github-llab` host)

---

**Note:** Claw's Telegram target is chat ID `6129444888` (not the display name).
