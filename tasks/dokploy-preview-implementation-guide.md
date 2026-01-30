# Dokploy Preview Deployment - Implementation Guide

## Status: 🔴 BLOCKED - Needs Dokploy Access

**Date:** 2026-01-30 16:00 UTC  
**Agent:** Bengt (gptme)  
**Task:** Set up Dokploy preview deployments for autobok

---

## Current Situation

Autobok is currently deployed via Docker Compose on a server with Nginx Proxy Manager. To set up preview deployments, we need access to a Dokploy instance.

### Two Options:

#### Option A: Dokploy is Already Installed (Most Likely)
If Theodor has a Dokploy instance running, I need:
- Dokploy panel URL (e.g., `https://dokploy.your-domain.com`)
- Login credentials or access token

#### Option B: Fresh Dokploy Installation
If no Dokploy exists, we need to:
1. Install Dokploy on a server
2. Configure it for autobok
3. Set up preview deployments

---

## Implementation Steps (Once Access is Available)

### Phase 1: Import Autobok into Dokploy (10 min)

1. **Login to Dokploy panel**
2. **Create new Application:**
   - Name: `autobok`
   - Repository: `https://github.com/theolundqvist/autobok`
   - Branch: `main`
   - Build type: `docker-compose`
   - Compose file: `docker-compose.prod.yml`

3. **Configure Environment Variables:**
   - Import from current production `.env`
   - Set `PUBLIC_BASE_URL` to the Dokploy domain

### Phase 2: Enable Preview Deployments (10 min)

1. **Navigate to:** Applications → autobok → Preview Deployments
2. **Enable preview deployments**
3. **Configure settings:**
   - Target branch: `main`
   - Port: `3004` (web) or `3000` if using Dockerfile directly
   - Domain: Use `traefik.me` (free, no DNS needed)
   - Max previews: `3`

4. **Add GitHub Integration:**
   - Go to Settings → GitHub
   - Connect GitHub account
   - Authorize Dokploy for `theolundqvist/autobok`

### Phase 3: Test with PR #28 (10 min)

1. **Trigger preview:**
   - Open PR #28 (`fix/fiscal-year-on-date-update`)
   - Or add `preview` label to existing PR
   - Dokploy should auto-create preview

2. **Verify preview URL:**
   - URL pattern: `preview-autobok-{pr-number}.traefik.me`
   - Check it's accessible
   - Test basic functionality

### Phase 4: Document & Notify (5 min)

1. **Update DEPLOYMENT.md** with preview info
2. **Notify Theodor** via Telegram
3. **Test with PR #29** as second pilot

---

## Required Configuration Details

### Current Production Setup (from DEPLOYMENT.md)
- **Web port:** 3004 (maps to container 3000)
- **API port:** 8084 (maps to container 8080)
- **Telegram webhook:** 8082
- **Domain:** autobok.lundqvistliss.com

### For Dokploy Preview
- **Web container port:** 3000
- **API container port:** 8080
- **Health check:** Web UI on port 3000

### Environment Variables Needed
```bash
# Database
DATABASE_URL=postgres://autobok:${DB_PASSWORD}@db:5432/autobok?sslmode=disable

# API
SESSION_SECRET=<random-secret>
PUBLIC_BASE_URL=<auto-set-by-dokploy>
CORS_ALLOWED_ORIGINS=<auto-set-by-dokploy>

# Telegram (optional for previews)
TELEGRAM_BOT_TOKEN=<token>
TELEGRAM_MODE=webhook
TELEGRAM_PUBLIC_URL=<auto-set-by-dokploy>
TELEGRAM_WEBHOOK_LISTEN=:8082

# Build args for web
NEXT_PUBLIC_API_URL=<auto-set-by-dokploy>/api
NEXT_PUBLIC_TELEGRAM_BOT_USERNAME=<username>
```

---

## Blockers / Questions for Theodor

1. **Dokploy Access:** Do you have a Dokploy instance running? What's the URL?
2. **Server Resources:** Is there a server available for Dokploy installation if needed?
3. **Database Strategy:** Should previews share the prod DB or use separate DBs?
4. **Telegram Bot:** Should previews use the same bot or skip Telegram for previews?

---

## Next Steps

**Immediate (Needs Theodor):**
- [ ] Provide Dokploy panel URL and credentials
- [ ] Or confirm server for fresh Dokploy install

**Once Access Available:**
- [ ] Import autobok into Dokploy (10 min)
- [ ] Enable preview deployments (10 min)
- [ ] Test with PR #28 (10 min)
- [ ] Document and handover (5 min)

**Estimated Total Time:** 35 minutes (once unblocked)

---

## Resources

- [Dokploy Preview Deployments Docs](https://docs.dokply.com/docs/core/applications/preview-deployments)
- [Autobok DEPLOYMENT.md](/tmp/autobok/DEPLOYMENT.md)
- [Autobok docker-compose.prod.yml](/tmp/autobok/docker-compose.prod.yml)
- PRs for testing: [#28](https://github.com/theolundqvist/autobok/pull/28), [#29](https://github.com/theolundqvist/autobok/pull/29)
