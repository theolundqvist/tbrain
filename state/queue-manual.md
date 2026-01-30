# Work Queue

## Current Run - COMPLETE ✅
**Session:** cron:73992ae7-d7de-44d4-b392-a612b9aa3715  
**Task:** Dokploy Preview Deployments Setup  
**Status:** ✅ CONFIGURATION COMPLETE - Pushed to PR #33  
**Started:** 2026-01-30 20:00 UTC  
**Completed:** 2026-01-30 20:08 UTC

### Summary
Created Dokploy configuration files and documentation for preview deployments. All configurations committed and pushed to PR #33.

### Deliverables
- [x] Created `dokploy.json` - Production deployment configuration
- [x] Created `dokploy.preview.json` - Preview deployment configuration  
x] Created `DOKPLOY.md` - Complete setup and migration guide
- [x] Committed and pushed to GitHub (commit 3c04b8f)
- [ ] Set up Dokploy instance (requires Theodor)
- [ ] Configure GitHub integration  
- [ ] Test preview deployment with existing PR

### Files Created
- `/autobok/dokploy.json` - Main deployment config
- `/autobok/dokploy.preview.json` - Preview-specific config
- `/autobok/DOKPLOY.md` - Documentation and migration guide

### Next Actions Required (Theodor)
1. Set up Dokploy instance on VPS (if not done)
2. Follow DOKPLOY.md "Step 1-3" to configure GitHub integration
3. Use PR #28 or #29 to test preview deployment

## Previous Run - COMPLETE ✅
**Session:** cron:73992ae7-d7de-44d4-b392-a612b9aa3715  
**Task:** Fix P1 Issue #7 - Transaction sync across devices  
**Status:** ✅ COMPLETE - PR #33 created  
**Started:** 2026-01-30 18:00 UTC  
**Completed:** 2026-01-30 18:15 UTC

### Summary
- Fixed cache invalidation for transaction CRUD operations
- PR #33 created: https://github.com/theolundqvist/autobok/pull/33
- Web transactions now notify other clients via SSE events

## Priority Change Notice
**Date:** 2026-01-30  
**From:** Claw/Theodor  
**New Priority:** Dokploy preview deployments (URGENT)  
**Paused Tasks:** 
- P0 Bug #3 (date parsing) - has PR #29 ready
- P0 Bug #5 (receipt linking)  

## Dokploy Preview Deployment Plan

### Research Summary
Dokploy preview deployments allow testing PRs in isolated environments before merging.

**Key Features:**
- Works with GitHub integration only
- Auto-creates preview when PR opened to target branch
- Auto-updates on new commits
- Auto-cleans up when PR closed/merged
- Free traefik.me domains (no DNS config needed)
- Default port: 3000 (configurable)
- Max 3 preview deployments per app (configurable)

### Implementation Steps

1. **Check Current Dokploy Setup**
   - Verify autobok is deployed via Dokploy
   - Check if GitHub provider is configured
   - Review current deployment configuration

2. **Configure Preview Deployments**
   - Enable preview deployments in Dokploy UI
   - Set target branch (main)
   - Configure port (web: 3000, api: 8081)
   - Set domain pattern (traefik.me or custom)

3. **Test with Existing PR**
   - Use PR #28 or #29 as pilot
   - Verify preview URL is accessible
   - Check logs for any issues

4. **Document the Setup**
   - Add preview deployment info to autobok docs
   - Share preview URL pattern with Theodor

### Success Criteria
- [ ] Opening a PR triggers a preview deployment
- [ ] Preview URL is accessible for testing
- [ ] Theodor can review changes visually before merge

## Previous Work

### Bug #4 Fix - MERGE READY
**Problem:** When a transaction date was updated to a different fiscal year, it stayed in the wrong ledger.
**PR:** https://github.com/theolundqvist/autobok/pull/28

### Bug #3 Fix - READY FOR REVIEW
**Problem:** Dates like "26.01.17" were interpreted as 2017 instead of 2026
**PR:** https://github.com/theolundqvist/autobok/pull/29

## Next Steps After Dokploy
1. Return to P0 Bug #5 (receipt linking) if still open
2. Merge approved PRs (#28, #29)
3. Continue with P1 issues

## Last Updated
2026-01-30 15:05 UTC
