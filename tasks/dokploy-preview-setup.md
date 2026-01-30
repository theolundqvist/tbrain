---
state: active
priority: urgent
tags: [autobok, dokploy, preview, deployment]
created: 2026-01-30
---

# Set Up Dokploy Preview Deployments for Autobok

## Objective
Configure Dokploy preview deployments so Theodor can test PRs before merging.

## Background
Autobok currently has PRs #28 and #29 ready for review. Preview deployments will allow visual testing before merge.

## Dokploy Preview Deployment Overview

### How It Works
- Trigger: PR opened against target branch (main)
- Auto-updates: On every commit to PR
- Cleanup: When PR is closed/merged
- Domains: Free traefik.me domains or custom wildcard
- Port: Configurable (default 3000)

### Requirements
- GitHub integration must be configured in Dokploy
- Preview deployments enabled in application settings
- Target branch configured (main)

## Implementation Plan

### Phase 1: Verify Current Setup (15 min)
- [ ] Confirm autobok is deployed via Dokploy
- [ ] Check GitHub provider connection status
- [ ] Review current deployment ports:
  - Web frontend: 3000 (or 3004 in prod compose)
  - API: 8081 (or 8084 in prod compose)
  - Telegram webhook: 8082

### Phase 2: Configure in Dokploy UI (20 min)
- [ ] Navigate to autobok application in Dokploy
- [ ] Go to Preview Deployments settings
- [ ] Enable preview deployments
- [ ] Set target branch: `main`
- [ ] Configure ports:
  - Web: 3000
  - API: 8081 (if needed for previews)
- [ ] Set domain pattern (traefik.me recommended for ease)
- [ ] Set max previews: 3 (default)

### Phase 3: Test with PR #28 (15 min)
- [ ] Trigger preview by adding label or opening new PR
- [ ] Verify preview URL is generated
- [ ] Check preview is accessible
- [ ] Test basic functionality

### Phase 4: Document & Handover (10 min)
- [ ] Document preview URL pattern
- [ ] Add to autobok DEPLOYMENT.md
- [ ] Notify Theodor via Telegram

## Configuration Details

### Domain Options

**Option 1: traefik.me (Recommended)**
- No DNS configuration needed
- Pattern: `preview-autobok-{pr-number}.traefik.me`
- Free and automatic

**Option 2: Custom Wildcard**
- Requires wildcard DNS: `*.preview.autobok.lundqvistliss.com`
- Point A record `*` to Dokploy server IP
- Pattern: `preview-{appName}-{uniqueId}.mydomain.com`

### Environment Variables for Previews
Preview deployments inherit from main app but can have overrides:
- `PUBLIC_BASE_URL` (will be auto-set to preview domain)
- Database connection (may need separate DB for isolation)

## Testing Checklist

- [ ] PR creation triggers preview deployment
- [ ] Preview URL accessible via HTTPS
- [ ] Web UI loads correctly
- [ ] API endpoints respond
- [ ] New commits auto-redeploy
- [ ] PR close/merge cleans up preview

## Notes

### Security Consideration
Per Dokploy docs: "We recommend not using preview deployments for public repositories, since external people can execute builds and deployments in your server."

Autobok is a private repo, so this is acceptable.

### Database Consideration
Preview deployments share the same database by default. For full isolation, would need to:
- Create separate DB for each preview
- Or use environment-specific DB connection strings

For autobok, sharing the production DB may be acceptable for preview purposes, or we can configure a staging DB.

## Success Criteria
- [ ] Opening a PR in autobok triggers a preview deployment
- [ ] Preview URL is accessible for testing
- [ ] Theodor can review changes visually before merge

## Resources
- Dokploy docs: https://docs.dokploy.com/docs/core/applications/preview-deployments
- Autobok repo: https://github.com/theolundqvist/autobok
- Current PRs for testing: #28, #29
