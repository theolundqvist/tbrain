---
state: in-progress
priority: high
tags: [autobok, bugfix]
created: 2026-01-30
updated: 2026-02-01
---

# Fix autobok P0 Bugs

The autobok repo has 27 open issues that need attention. Start with the P0 (critical) bugs.

## P0 Issues (Fix First) - ✅ COMPLETED

1. **✅ #3: Date parsing interprets ambiguous dates as wrong year**
   - ~~Affects transaction date accuracy~~
   - ~~Core functionality broken~~
   - **FIXED:** PR #30 - Added date validation (>12 months in past rejected)

2. **✅ #4: Transaction stays in wrong fiscal year after date correction**
   - ~~Related to #3~~
   - ~~Data integrity issue~~
   - **FIXED:** PR #31 - Recompute fiscal year ledger when date changes
   - **BUG FIX APPLIED 2026-02-01:** Fixed Greptile-found bug - now uses correct ledger IDs when fetching updated transactions

3. **✅ #5: Receipt uploaded via phone not linked to web-created transaction**
   - ~~Cross-platform sync broken~~
   - ~~UX critical~~
   - **FIXED:** PR #32 - Added file_ids parameter to web transaction creation API

## P1 Issues (Next)

4. **#6: Telegram and web conversations go out of sync**
5. **✅ #7: Staged transactions not visible across devices until approved**
   - **FIXED:** PR #33 - Added cache invalidation for transaction CRUD operations
   - Web transactions now notify other clients via SSE events
6. **#8: Cache invalidation missing: account approval in Telegram does not update web**

## Completed Work

### PR #30 - Date Validation
- Branch: `fix/p0-date-validation`
- Files: `create_transaction.go`, `update_transaction.go`
- Validates transaction dates are not >12 months in the past

### PR #31 - Fiscal Year Fix
- Branch: `fix/p0-fiscal-year-update`
- Files: `transactions.go`
- Recomputes ledger assignment when transaction date changes fiscal year
- **Bug fix applied 2026-02-01:** Line 999 and 1213 now use correct ledger IDs

### PR #32 - File Linking
- Branch: `fix/p0-receipt-linking`
- Files: `models.go`, `transactions.go` (handler), `files.go`
- Enables web transactions to include file attachments
- **Greptile fixes applied 2026-02-01:**
  - Error handling: Now returns errors instead of ignoring (`_`)
  - ON_CONFLICT: `DO_NOTHING()` for duplicate link handling
  - Validation: Verifies file & transaction exist and belong to company

### PR #33 - Cache Invalidation
- Branch: `fix/p1-transaction-sync`
- Files: `transactions.go` (handlers)
- SSE cache invalidation for transaction CRUD operations

## Current PR Status (as of 2026-02-01)

| PR | Branch | Status | Blocker |
|----|--------|--------|---------|
| #29 | fix/date-parsing-validation | Ready | Theodor review |
| #30 | fix/p0-date-validation | Superseded by #29 | Close this |
| #28 | fix/fiscal-year-on-date-update | Ready | Theodor review |
| #31 | fix/p0-fiscal-year-update | ✅ **FIXED** | Theodor review |
| #32 | fix/p0-receipt-linking | ✅ **Ready** | Theodor review |
| #33 | fix/p1-transaction-sync | Ready | Theodor review |

## Success Criteria
- [x] All P0 bugs have PRs or documented blockers
- [ ] P1 bugs triaged and prioritized
- [x] Clear communication on progress
- [x] Greptile-critical bugs fixed

## Next Steps
1. ✅ Fix PR #31 ledgerID bugs (DONE)
2. ✅ Fix PR #32 error handling (DONE - Greptile feedback addressed)
3. **Theodor to review and merge ready PRs:** #29, #31, #32, #33
4. Continue with P1 issues (#6, #8) after P0 merged
