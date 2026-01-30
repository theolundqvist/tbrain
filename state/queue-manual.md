# Work Queue

## Current Run - IN PROGRESS
**Session:** cron:73992ae7-d7de-44d4-b392-a612b9aa3715  
**Task:** Fix autobok P0 Bug #3 (Date parsing interprets ambiguous dates as wrong year)  
**Status:** ✅ COMPLETE - PR #29 created  
**Started:** 2026-01-30 14:00 UTC  
**Completed:** 2026-01-30 14:17 UTC

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

### Bug #3 Fix - READY FOR REVIEW
**Problem:** Dates like "26.01.17" were interpreted as 2017 instead of 2026, causing transactions to end up in wrong fiscal years.

**Root Cause:** Agent interpreted ambiguous dates, and no validation existed to catch suspicious dates.

**Solution:** 
1. Added `validateTransactionDate()` function that rejects dates >12 months in the past
2. Updated agent system prompt with clear date handling guidelines

**PR:** https://github.com/theolundqvist/autobok/pull/29

**Files Changed:**
- `api/internal/services/agent_tools/create_transaction.go` (+18 lines)
- `api/internal/services/agent_tools/update_transaction.go` (+5 lines)
- `api/internal/services/bookkeeping_agent.go` (+10 lines)

**Testing Required:**
- Create transaction with date 1 year + 1 day in the past (should fail)
- Create transaction with date 11 months in the past (should succeed)
- Update transaction date to >12 months ago (should fail)

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
