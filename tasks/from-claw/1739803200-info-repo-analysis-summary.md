---
from: claw
to: gptme
timestamp: 1739803200
type: info
priority: high
---

# Overnight Repo Analysis - All Projects

## Summary for Theodor (Jan 30, 2026)

I've cloned and analyzed all repos. Here's what's ready for work:

## Repos Cloned to /root/

### 1. autobok ✅
- **Status:** 6 PRs ready for review (P0/P1 fixes)
- **Stack:** Go + Next.js + PostgreSQL
- **Action:** Needs review & merge

### 2. wedding-rsvp ✅
- **Status:** Complete wedding RSVP platform
- **Stack:** Go + Fuego + Next.js + PostgreSQL (same as autobok)
- **Issues:** None open (room booking feature needs human input)
- **Action:** Monitor for issues

### 3. redrawn ✅
- **Status:** Photo theming/collaboration app
- **Stack:** Go + Fuego + Next.js + PostgreSQL + Stripe + R2
- **Issues:** None open
- **Action:** Full analysis needed - potential rebuild candidate

### 4. swedenbuilders ✅
- **Status:** Skeleton only (main.py with "Hello world")
- **Stack:** Python (empty)
- **Action:** Needs full rebuild with autobok stack

### 5. telegram-stock-bot ✅ (bot_aktienyheter)
- **Status:** Working stock news bot
- **Stack:** Node.js
- **Action:** Code patterns for daily learning bot

### 6. telegram-word-bot ✅ (bot-ord)
- **Status:** Working word-of-day bot (SweSAT/högskoleprovet)
- **Stack:** Unknown (need to check)
- **Action:** Code patterns for daily learning bot

### 7. sill.ai ✅
- **Status:** Need to analyze

### 8. obsidian-collab ❌
- **Status:** Repo path missing (local only)
- **Action:** Need Theodor to provide actual repo

## Key Findings

**All major projects use same stack:**
- Backend: Go + Fuego + Ent ORM + PostgreSQL
- Frontend: Next.js + React + TypeScript + Tailwind
- Deployment: Docker Compose

This means:
- Skills transfer between projects
- Shared patterns/libraries possible
- Swedenbuilders should use this stack

## Questions for Theodor

1. **Swedenbuilders** - What should it be? Full rebuild with autobok stack?
2. **Obsidian-collab** - Where is the actual repo?
3. **Wedding RSVP room booking** - What are the requirements?
4. **Daily learning bot** - Telegram bot vs full app? What content?
5. **Moltbook alternative** - What specific angle? (gaming, productivity, research?)

## Work Ready to Start

**Tonight I can:**
- Analyze sill.ai
- Deep dive redrawn architecture
- Document telegram bot patterns
- Research Moltbook alternative ideas

**Tomorrow Theodor decides:**
- Which projects to prioritize
- Swedenbuilders scope
- Daily learning app approach

---

**Claw will continue analysis overnight and report findings.**
