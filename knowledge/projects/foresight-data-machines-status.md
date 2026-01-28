# Foresight Data Machines - Project Status

**Last Updated**: 2026-01-28 21:46 UTC

This document tracks all foresight-data-machines repositories and open PRs.

## Repository Overview

**Total Repositories**: 19

### Active Repositories (with open PRs)
- **TownSquare** - 9 open PRs
- **infrastructure** - 4 open PRs
- **platform-infrastructure** - 2 open PRs
- **devices-infrastructure** - 2 open PRs

### Other Repositories (no open PRs)
- notebooks
- CoPilot
- hardware-research
- scrapyard-inventory-overview
- android-management-api
- cmc-texas-scrap-tracking
- gerdau-map
- scrap-eye-app
- Android-device-management
- ScrapEyes-MVP-android
- openpilot
- ScrapDog
- crane-simulator
- am-production
- am-olaberria

---

## Open Pull Requests by Repository

### TownSquare (9 PRs)

#### PR #9841: Recorder: Flip instead of rotate, flip before drawtext
- **Branch**: `rotate-before-timestamp`
- **Updated**: 2026-01-27
- **URL**: https://github.com/foresight-data-machines/TownSquare/pull/9841
- **Status**: Active (updated yesterday)

#### PR #9828: 🐛 Fix KeyError when listing locations with no uncompleted labelling periods
- **Branch**: `enable-tn`
- **Updated**: 2026-01-26
- **URL**: https://github.com/foresight-data-machines/TownSquare/pull/9828
- **Status**: Active (updated 2 days ago)

#### PR #9805: Split data processing for scrapeye
- **Branch**: `split-data-processing-scrapeye`
- **Updated**: 2026-01-28 (TODAY)
- **URL**: https://github.com/foresight-data-machines/TownSquare/pull/9805
- **Status**: Active (updated today)
- **Note**: Most recently updated PR

#### PR #9783: ⚡️ Optimize metric_definitions query performance
- **Branch**: `fix-metrics-slow-query`
- **Updated**: 2026-01-28 (TODAY)
- **URL**: https://github.com/foresight-data-machines/TownSquare/pull/9783
- **Status**: Active (updated today)

#### PR #9743: Video Processing Pipeline
- **Branch**: `scrapeye/data-pipelines`
- **Updated**: 2026-01-28 (TODAY)
- **URL**: https://github.com/foresight-data-machines/TownSquare/pull/9743
- **Status**: Active (updated today)
- **Note**: Major feature - ScrapEye data pipelines

#### PR #9668: Show max(temp) instead of avg on dashboard
- **Branch**: `fix-helix-temps`
- **Updated**: 2026-01-08
- **URL**: https://github.com/foresight-data-machines/TownSquare/pull/9668
- **Status**: Stale (20 days old)

#### PR #9632: 🐛 [Modelling]: Use inner join for angles
- **Branch**: `fix/angle-outer-join`
- **Updated**: 2026-01-13
- **URL**: https://github.com/foresight-data-machines/TownSquare/pull/9632
- **Status**: Stale (15 days old)

#### PR #9145: Split scrapeye tests into its own workflow
- **Branch**: `scrapeye-ci`
- **Updated**: 2025-11-13
- **URL**: https://github.com/foresight-data-machines/TownSquare/pull/9145
- **Status**: Very stale (76 days old)

#### PR #8958: [ScrapEye]: Streaming service for in-cloud staging deployment
- **Branch**: `streaming-service`
- **Updated**: 2025-11-17
- **URL**: https://github.com/foresight-data-machines/TownSquare/pull/8958
- **Status**: Very stale (72 days old)

---

### infrastructure (4 PRs)

#### PR #23425: 🧱 Per-tenant Dagster K8s environments
- **Branch**: `scrapeye-dagster`
- **Updated**: 2026-01-28 (TODAY)
- **URL**: https://github.com/foresight-data-machines/infrastructure/pull/23425
- **Status**: Active (updated today)
- **Note**: Related to Dagster infrastructure for ScrapEye

#### PR #22707: Dagster tenant iam
- **Branch**: `chore/dagster-tenant-iam`
- **Updated**: 2026-01-02
- **URL**: https://github.com/foresight-data-machines/infrastructure/pull/22707
- **Status**: Stale (26 days old)

#### PR #22699: Split dagster into staging and prod
- **Branch**: `chore/split-dagster`
- **Updated**: 2026-01-02
- **URL**: https://github.com/foresight-data-machines/infrastructure/pull/22699
- **Status**: Stale (26 days old)

#### PR #13908: ✨ Add scrap-tracking dashboard
- **Branch**: `dashboards/scrap-tracking-cmc-texas`
- **Updated**: 2025-07-08
- **URL**: https://github.com/foresight-data-machines/infrastructure/pull/13908
- **Status**: Very stale (204 days old)

---

### platform-infrastructure (2 PRs)

#### PR #275: 🧱 (1) Per-tenant dagster db in shared instance
- **Branch**: `dagster-top-level`
- **Updated**: 2026-01-28 (TODAY)
- **URL**: https://github.com/foresight-data-machines/platform-infrastructure/pull/275
- **Status**: Active (updated today)
- **Note**: Part 1 of Dagster multi-tenant setup

#### PR #274: 🧱 (2) Per-tenant setup for dagster
- **Branch**: `tenant-dagster`
- **Updated**: 2026-01-26
- **URL**: https://github.com/foresight-data-machines/platform-infrastructure/pull/274
- **Status**: Active (updated 2 days ago)
- **Note**: Part 2 of Dagster multi-tenant setup

---

### devices-infrastructure (2 PRs)

#### PR #87: Replace rotation env
- **Branch**: `replace-rotation-env`
- **Updated**: 2026-01-27
- **URL**: https://github.com/foresight-data-machines/devices-infrastructure/pull/87
- **Status**: Active (updated yesterday)

#### PR #86: Connect to external cameras
- **Branch**: `costa-brava-setup`
- **Updated**: 2026-01-27
- **URL**: https://github.com/foresight-data-machines/devices-infrastructure/pull/86
- **Status**: Active (updated yesterday)

---

## Summary Statistics

**Total Open PRs**: 17

**By Activity Level**:
- **Active (updated in last 3 days)**: 8 PRs
- **Stale (updated 4-30 days ago)**: 5 PRs
- **Very Stale (updated >30 days ago)**: 4 PRs

**By Repository**:
- TownSquare: 9 PRs (53%)
- infrastructure: 4 PRs (23%)
- platform-infrastructure: 2 PRs (12%)
- devices-infrastructure: 2 PRs (12%)

**Key Themes**:
1. **ScrapEye Infrastructure** - Multiple PRs related to ScrapEye data processing, pipelines, and Dagster setup
2. **Dagster Multi-tenancy** - Coordinated effort across infrastructure and platform-infrastructure repos
3. **Device Configuration** - Camera setup and rotation handling in devices-infrastructure
4. **Performance Optimization** - Query optimization in TownSquare
5. **Stale PRs** - Several older PRs (>70 days) that may need review or closure

---

## Related Resources

- [ScrapChef TownSquare Project](./scrapchef-townsquare.md)
- [TownSquare Project Symlink](../../projects/TownSquare)
