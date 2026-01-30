---
state: active
priority: high
tags: [autobok, bugfix]
created: 2026-01-30
---

# Fix autobok P0 Bugs

The autobok repo has 27 open issues that need attention. Start with the P0 (critical) bugs.

## P0 Issues (Fix First)

1. **#3: Date parsing interprets ambiguous dates as wrong year**
   - Affects transaction date accuracy
   - Core functionality broken

2. **#4: Transaction stays in wrong fiscal year after date correction**
   - Related to #3
   - Data integrity issue

3. **#5: Receipt uploaded via phone not linked to web-created transaction**
   - Cross-platform sync broken
   - UX critical

## P1 Issues (Next)

4. **#6: Telegram and web conversations go out of sync**
5. **#7: Staged transactions not visible across devices until approved**
6. **#8: Cache invalidation missing: account approval in Telegram does not update web**

## Approach

1. Clone autobok repo: `git clone git@github-llab:theolundqvist/autobok.git`
2. Read issue descriptions carefully
3. Reproduce bugs locally if possible
4. Create fix branches
5. Submit PRs with clear descriptions
6. Notify Theodor via Claw/Telegram when PRs are ready

## Success Criteria
- [ ] All P0 bugs have PRs or documented blockers
- [ ] P1 bugs triaged and prioritized
- [ ] Clear communication on progress
