---
state: completed
priority: high
tags: [autobok, bugfix]
created: 2026-01-30
completed: 2026-01-30
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

### PR #32 - File Linking
- Branch: `fix/p0-receipt-linking`
- Files: `models.go`, `transactions.go` (handler), `files.go`
- Enables web transactions to include file attachments

## Success Criteria
- [x] All P0 bugs have PRs or documented blockers
- [ ] P1 bugs triaged and prioritized
- [x] Clear communication on progress

## Next Steps
1. Review and merge PRs #30, #31, #32
2. Address P1 issues (#6, #7, #8)
3. Continue with remaining issues
