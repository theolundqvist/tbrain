# Autobok - AI-Powered Bookkeeping System

## Overview
**URL**: https://autobok.lundqvistliss.com
**Repository**: https://github.com/theolundqvist/autobok
**Description**: Automatisk bokföring med AI (Automatic bookkeeping with AI - Swedish)
**Last Updated**: 2026-01-28

## Purpose
AI-powered receipt parsing and bookkeeping system with Telegram bot integration. Helps automate the bookkeeping process by processing receipts and categorizing transactions using AI.

## Tech Stack

### Backend
- **Language**: Go
- **Framework**: Fuego
- **Database**: PostgreSQL with Jet SQL
- **API**: REST API

### Frontend
- **Framework**: Next.js
- **UI**: React, TypeScript, Tailwind CSS

### Infrastructure
- **Bot**: Telegram Bot API for receipt submission
- **Deployment**: Docker Compose
- **Proxy**: Nginx Proxy Manager

### Additional Technologies
- Python (scripts)
- Shell scripting
- Typst (document generation)
- HTML/CSS/JavaScript

## Quick Start Commands
```bash
make install    # Install dependencies
make init-env   # Create .env file
make db-up      # Start PostgreSQL
make uphead     # Apply migrations
make api        # Run backend (separate terminal)
make web        # Run frontend
```

## Key Scripts
- `./scripts/deploy.sh` - Deploy to production
- `./scripts/pull-backup.sh` - Pull latest backup from production
- `./scripts/restore-backup.sh` - Restore backup to local database

## Recent Development Activity (as of 2026-01-28)

### Recent Work
1. **Dev Server Integration** - Merged PR #1 for vibe-kanban dev server
2. **Event Broker Improvements** - Wire shared EventBroker to Telegram ConversationManager for SSE cache invalidation
3. **QR Code Features** - Implementing QR code expiry functionality
4. **Bug Fixes** - Account update diff issues, env port configuration

### Development Pattern
- Uses vibe-kanban for task management
- Active development with daily commits
- Co-authored work with Claude Opus 4.5 AI assistant

## Documentation
- Setup Guide: `docs/SETUP.md`
- Deployment Guide: `DEPLOYMENT.md`

## Architecture Notes

### Telegram Integration
The system has a Telegram bot that allows users to submit receipts. The bot integrates with:
- ConversationManager for handling user interactions
- EventBroker for real-time updates via SSE
- Cache invalidation system for web subscribers

### AI Processing
The system uses AI to:
- Parse receipts
- Extract transaction data
- Categorize expenses
- Automate bookkeeping entries

## TODO Items
- [ ] Explore the codebase structure in detail
- [ ] Understand the AI receipt parsing implementation
- [ ] Review the Telegram bot workflow
- [ ] Check deployment configuration
- [ ] Understand the vibe-kanban integration

## Related
- Owner: Theodor Lundqvist
- Side project (non-work)
- Production deployment at autobok.lundqvistliss.com
