# Work Queue

## Current Run
Session 2026-01-30: Created autonomous run infrastructure + new tasks for redrawn, wedding-rsvp

## Collaboration Setup (IMPORTANT)

**OpenClaw Coordination**:
- Bengt (gptme) and OpenClaw are collaborators on same Hetzner machine
- Same GitHub account: theolundqvist
- **Timing**: OpenClaw runs at XX:00, Bengt runs at XX:30 (30-min offset)
- **Next Autonomous Run**: Tell OpenClaw about:
  - New repos: swebuild/redrawn, theolundqvist/wedding-rsvp
  - Collaboration setup (same machine, same account)
  - Timing coordination (consider reconfiguring OpenClaw to 60min on XX:00)

## Planned Next

1. **[Set Up Telegram Notifications]** (0/11 complete, new)
   - Priority: HIGH
   - Goal: Configure notification system (OpenClaw API vs Telegram CLI) so Bengt can message Theodor when assistance needed
   - Next Action: Check OpenClaw config for existing telegram bot token and user ID
   - Status: Task created, research phase
   - Timeline: 1-2 hours to implement
   - Source: [tasks/setup-telegram-notifications.md](tasks/setup-telegram-notifications.md)

2. **[Host Autobok on Hetzner with Dokploy + Sablier]** (0/9 complete, new)
   - Priority: HIGH
   - Goal: Deploy autobok on current Hetzner machine using Dokploy, Docker Compose, and Sablier for preview URLs
   - Next Action: Research Dokploy installation requirements and check server readiness
   - Status: Task created, ready to start
   - Timeline: 2-3 hours initial setup
   - Source: [tasks/host-autobok-dokploy.md](tasks/host-autobok-dokploy.md)

3. **[Redrawn v2: Complete Rebuild]** (0/19 complete, new)
   - Priority: HIGH
   - Goal: Rebuild redrawn from scratch using autobok patterns (Go/Fuego backend, Next.js frontend), create v2 branch
   - Next Action: Read current redrawn codebase and study autobok architecture patterns
   - Status: Task created, needs architecture planning
   - Timeline: Multiple sessions (2-3 days work)
   - Source: [tasks/redrawn-v2-rebuild.md](tasks/redrawn-v2-rebuild.md)
   - Note: Use autobok as template, not copy-paste

4. **[Explore OpenClaw Integration]** (0/3 complete, new)
   - Priority: MEDIUM
   - Goal: Understand existing OpenClaw setup and how to leverage it for agent workflows
   - Next Action: Examine OpenClaw gateway service and available APIs/hooks
   - Status: OpenClaw service already installed
   - Timeline: 30 minutes exploration
   - Source: System discovery

5. **[Monitor Wedding RSVP Website]** (0/4 complete, new)
   - Priority: MEDIUM
   - Goal: Passive monitoring of wedding-rsvp repo for issues/requests from Theodor/Rebecca
   - Next Action: Watch repository for new issues
   - Status: Monitoring mode (no active dev unless requested)
   - Timeline: Ongoing
   - Source: [tasks/wedding-rsvp-monitor.md](tasks/wedding-rsvp-monitor.md)

## Last Updated
2026-01-30 08:31 UTC
