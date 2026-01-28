# Bengt

[![built using gptme](https://img.shields.io/badge/built%20using-gptme%20%F0%9F%A4%96-5151f5?style=flat)](https://github.com/ErikBjare/gptme)

The name of the agent is Bengt.

This git repository is the brain of Bengt. It is a workspace of their thoughts and ideas.

 - Bengt will write their thoughts, plans, and ideas in this repository.
 - Bengt's agent harness, including this repo, is in-progress.
 - Bengt is encouraged to suggest improvements to their harness.

Information about Bengt can be found in [`ABOUT.md`](./ABOUT.md), including their personality and goals.
Information about Bengt's harness and architecture can be found in [`ARCHITECTURE.md`](./ARCHITECTURE.md).



## Usage

Run Bengt with:

```sh
pipx install gptme

# optional (but recommended): setup pre-commit hooks
pipx install pre-commit
make install

# run Bengt (from the workspace directory)
gptme "<prompt>"
```

The agent's context is automatically loaded via `gptme.toml` which configures the files and context command to include.

## Autonomous Operation

Bengt can run autonomously on a schedule using the included infrastructure:

**Quick Setup**:
1. Customize `scripts/runs/autonomous/autonomous-run.sh` with your agent's details
2. Edit the prompt template in the script to match your agent's goals
3. Set up systemd timer (Linux) or cron job for scheduling
4. Monitor via logs: `journalctl --user -u agent-autonomous.service`

**See**: [`scripts/runs/autonomous/README.md`](./scripts/runs/autonomous/README.md) for complete documentation.

**Features**:
- CASCADE workflow (Loose Ends → Task Selection → Execution)
- Two-queue system (manual + generated priorities)
- Safety guardrails (GREEN/YELLOW/RED operation classification)
- Session documentation and state management
- Systemd timer templates included

## Forking

Before forking to create a new agent you must update the submodules:

```sh
git submodule update --init --recursive
```

and it is recommended to install the `tree` command if you don't have it already:

```sh
# Debian/Ubuntu
sudo apt install tree

# macOS
# Using Homebrew
brew install tree
```

You can now create a clean fork of Bengt by running:

```sh
./fork.sh <path> [<agent-name>]
```

Then simply follow the instructions in the output.

## Workspace Structure

 - Bengt keeps track of tasks in [`TASKS.md`](./TASKS.md)
 - Bengt keeps a journal in [`./journal/`](./journal/)
 - Bengt keeps a knowledge base in [`./knowledge/`](./knowledge/)
 - Bengt maintains profiles of people in [`./people/`](./people/)
 - Bengt manages work priorities in [`./state/`](./state/) using the two-queue system (manual + generated)
 - Bengt uses scripts in [`./scripts/`](./scripts/) for context generation, task management, and automation
 - Bengt can add files to [`gptme.toml`](./gptme.toml) to always include them in their context

### Key Directories

**[`state/`](./state/)**: Work queue management
- `queue-manual.md` - Manually maintained work queue with strategic context
- `queue-generated.md` - Auto-generated queue from tasks and GitHub
- See [`state/README.md`](./state/README.md) for detailed documentation

**[`scripts/`](./scripts/)**: Automation and utilities
- `context.sh` - Main context generation orchestrator
- `gptodo` - Task management CLI (install from gptme-contrib)
- `runs/autonomous/` - Autonomous operation infrastructure
- See [`scripts/README.md`](./scripts/README.md) for complete documentation

**[`lessons/`](./lessons/)**: Behavioral patterns and constraints
- Prevents known failure modes through structured guidance
- See [`lessons/README.md`](./lessons/README.md) for lesson system documentation
