# GitHub Listeners Setup

This document describes the GitHub integration setup for monitoring multiple repositories.

## Overview

GitHub listeners poll configured repositories for issues with the `task-request` label and automatically create task files in the workspace.

## Repositories Monitored

| Repository | Config File | Description |
|------------|-------------|-------------|
| `theolundqvist/autobok` | `github-autobok.yaml` | AI-powered bookkeeping |
| `theolundqvist/wedding-rsvp` | `github-wedding-rsvp.yaml` | Wedding RSVP system |
| `theolundqvist/redrawn` | `github-redrawn.yaml` | Redrawn project |
| `theolundqvist/swedenbuilders` | `github-swedenbuilders.yaml` | Sweden Builders project |

## Configuration

Config files are located in `/root/tbrain/.config/gptme-agent/`.

Each config specifies:
- **repo**: GitHub repository (owner/name format)
- **label**: Label to filter issues (default: `task-request`)
- **workspace_path**: Where to create task files
- **poll_interval_seconds**: How often to check (default: 300s = 5 min)
- **priority_labels**: Labels that mark high priority
- **exclude_labels**: Labels to exclude

## Scripts

### One-time Check

Check all repositories once (good for cron jobs or manual runs):

```bash
./scripts/github-check.sh
```

### Continuous Listeners

Run all listeners continuously in parallel:

```bash
./scripts/github-listeners.sh
```

This starts background processes for each repository. To stop:

```bash
killall -f 'gptme_contrib_lib.orchestrator'
```

## Requirements

- `gh` CLI installed and authenticated
- `gptme-contrib-lib` package installed
- `GPTME_WORKSPACE` environment variable set

## Setup Check

Verify everything is configured:

```bash
# Check gh authentication
gh auth status

# Check configs exist
ls -la /root/tbrain/.config/gptme-agent/

# Test one-time check
./scripts/github-check.sh
```

## How It Works

1. Each listener polls its configured repository every 5 minutes
2. Issues with the `task-request` label are converted to tasks
3. Task files are created in `/root/tbrain/tasks/`
4. Duplicates are automatically detected and skipped

## Labels

To create a task from a GitHub issue:

1. Add the `task-request` label to the issue
2. Optionally add priority labels (`priority:urgent`, `priority:high`)
3. The listener will pick it up on the next poll

## Troubleshooting

**Issue**: `gh auth status` fails
**Fix**: Run `gh auth login`

**Issue**: No tasks created
**Check**:
- Does the issue have the `task-request` label?
- Is the issue open (not closed)?
- Check logs in listener output

**Issue**: Duplicate tasks
**Note**: This is prevented - the system checks if an issue is already referenced in existing tasks
