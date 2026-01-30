# Work Queue

## Current Run - COMPLETED
**Session:** cron:73992ae7-d7de-44d4-b392-a612b9aa3715  
**Task:** Fix autobok P0 Bug #4 (Fiscal year not updating when transaction date changes)  
**Status:** ✅ COMPLETE - PR #28 created  
**Started:** 2026-01-30 13:00 UTC  
**Completed:** 2026-01-30 13:20 UTC

## Completed Work

### Bug #4 Fix - MERGE READY
**Problem:** When a transaction date was updated to a different fiscal year, it stayed in the wrong ledger.

**Root Cause:** `UpdateTransactionForTool` reused the original `ledger_id` without recalculating for the new date.

**Solution:** Added logic to call `ResolveOrCreateLedger` when date changes, ensuring transactions move to the correct fiscal year's ledger.

**PR:** https://github.com/theolundqvist/autobok/pull/28

**Files Changed:**
- `api/internal/services/agent_tools.go` (+20 lines, -7 lines)

**Testing Required:**
- Update staged transaction to different fiscal year
- Update confirmed transaction (creates revision) to different fiscal year
- Verify correct ledger assignment

## Remaining P0 Tasks

1. **Bug #3: Date parsing interprets ambiguous dates as wrong year** (pending)
   - Priority: HIGH
   - Requires agent prompt changes + potential multi-format date parser
   - Source: GitHub issue #3

2. **Bug #5: Receipt uploaded via phone not linked to web-created transaction** (pending)
   - Priority: HIGH
   - Need to investigate file linking across devices
   - Source: GitHub issue #5

## Last Updated
2026-01-30 13:20 UTC
