---
state: new
created: 2026-01-30T08:21:00+00:00
priority: high
tags: [infrastructure, notifications, telegram, openclaw]
---

# Set Up Telegram Notifications for Agent Communication

Configure a notification system so Bengt can message Theodor when assistance is needed (e.g., opening ports, making decisions, handling errors). Evaluate OpenClaw API vs Telegram CLI approaches.

## Goals

- [ ] Research and compare notification options (OpenClaw API vs Telegram CLI)
- [ ] Extract/verify Telegram bot token and user ID
- [ ] Set up working notification mechanism
- [ ] Create helper function/script for sending messages
- [ ] Test end-to-end notification flow
- [ ] Document usage in knowledge base

## Subtasks

### Phase 1: Research (choose approach)

- [ ] Investigate OpenClaw API capabilities
  - Check if telegram hook is already configured
  - Verify bot token availability
  - Check user ID retrieval method
- [ ] Research Telegram CLI alternatives
  - telegram-cli (telegrammtproto)
  - tg (Telegram terminal messenger)
  - Other lightweight options
- [ ] Compare: reliability, ease of use, dependencies, maintenance

### Phase 2: Implementation

- [ ] Extract Telegram credentials from OpenClaw or config
  - Bot token
  - User ID (Theodor's Telegram ID)
- [ ] Install and configure chosen solution
- [ ] Create reusable notification script/function
- [ ] Add to agent tools/lessons for easy access
- [ ] Test sending messages

### Phase 3: Integration

- [ ] Define notification triggers (when to message Theodor)
  - Port opening requests
  - Critical errors requiring human decision
  - Long-running task completion
  - Security concerns
- [ ] Add notification calls to relevant agent workflows
- [ ] Document notification etiquette (don't spam)

## Technical Context

- **OpenClaw**: Already installed on this machine
- **Telegram Bot**: Presumably already exists (check OpenClaw config)
- **Current notification**: Manual checking of agent state

## Notes

OpenClaw might already have:
- Bot token in config
- Telegram hook setup
- User ID mapping

Alternative: Direct Telegram Bot API calls with curl:
```bash
curl -s -X POST "https://api.telegram.org/bot<TOKEN>/sendMessage" \
  -d "chat_id=<USER_ID>" \
  -d "text=Message from Bengt: Need help with..."
```

## Questions to Answer

1. Is OpenClaw's telegram integration easier than direct API?
2. Can we get bot token from OpenClaw CLI/config?
3. What is Theodor's Telegram user ID?
4. Should notifications be queued/batched or immediate?

## Related

- [OpenClaw Gateway service](/root/.config/systemd/user/openclaw-gateway.service) (already installed)
- [Lessons on tool usage](/lessons/tools/)
