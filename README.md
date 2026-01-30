# Bengt - Development Assistant

[![built using gptme](https://img.shields.io/badge/built%20using-gptme%20%F0%9F%A4%96-5151f5?style=flat)](https://github.com/ErikBjare/gptme)

The name of the agent is **Bengt**.

Bengt is a software development assistant focused on Theodor Lundqvist's projects, with primary focus on **autobok** (AI-powered bookkeeping) and supporting work on **scrapchef.ai** / Foresight Data Machines.

**Primary Focus**: Writing code, fixing bugs, shipping features

## Current Projects

### autobok (Primary)
- **Repo**: `theolundqvist/autobok`
- **Status**: 27 open issues (P0-P4)
- **Tech**: Go backend (Fuego), Next.js frontend, PostgreSQL, Telegram bot
- **Focus**: Bug fixes, UX improvements, feature development

### scrapchef / TownSquare (Pending)
- **Org**: `foresightdatamachines`
- **Status**: Awaiting access confirmation
- **Focus**: TBD based on requirements

## Quick Start

Run Bengt with:

```sh
pipx install gptme

# optional (but recommended): setup pre-commit hooks
pipx install pre-commit
make install

# run Bengt (from the workspace directory)
gptme "Check autobok issues and fix the highest priority bug"
```

The agent's context is automatically loaded via `gptme.toml`.

## Autonomous Operation

Bengt can run autonomously on a schedule:

**Quick Setup**:
1. Customize `scripts/runs/autonomous/autonomous-run.sh` 
2. Set up systemd timer or cron job
3. Monitor via logs: `journalctl --user -u agent-autonomous.service`

**See**: [`scripts/runs/autonomous/README.md`](./scripts/runs/autonomous/README.md)

## Workspace Structure

- **Tasks**: [`TASKS.md`](./TASKS.md) and [`tasks/`](./tasks/)
- **Journal**: [`journal/`](./journal/) - Progress documentation
- **Knowledge**: [`knowledge/`](./knowledge/) - Technical docs
- **People**: [`people/`](./people/) - Contact profiles
- **State**: [`state/`](./state/) - Work queue management

## Communication

- **GitHub**: PRs, issues, code changes (as LLAB-Machina bot)
- **Telegram**: Via Claw for urgent notifications
- **Task delegation**: File-based in `/tasks/from-claw/`

## Forking

Before forking:

```sh
git submodule update --init --recursive
```

Then:

```sh
./fork.sh <path> [<agent-name>]
```

## Documentation

- [`ABOUT.md`](./ABOUT.md) - Bengt's identity and purpose
- [`ARCHITECTURE.md`](./ARCHITECTURE.md) - Workspace structure
- [`TASKS.md`](./TASKS.md) - Task management system
