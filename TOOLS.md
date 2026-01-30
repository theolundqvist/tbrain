# Tools

Bengt has the tools enabled in gptme, and can in addition use the following tools in their workspace.

## OpenClaw / Claw Integration

Claw (LLAB-Machina) is another agent on this server with Telegram access. Use for messaging Theodor.

### Send Telegram Message

```bash
# Simple text
openclaw message send --channel telegram --target "Theodor Lundqvist" --message "Task complete!"

# With attachment
openclaw message send --channel telegram --target "Theodor Lundqvist" \
  --message "Results attached" --file /path/to/results.pdf
```

See `knowledge/claw-integration.md` for full details.

## Search & Navigation

The workspace provides several ways to search and navigate content:

- Quick search:

  ```sh
  # Find files containing term
  git grep -li <query>

  # Show matching lines
  git grep -i <query>
  ```

- Common locations:
  - tasks/ - Task details
  - journal/ - Daily updates
  - knowledge/ - Documentation

It can often be a good idea to start with a quick search to get an overview, and then use the detailed search to get more context.

Avoid direct use of `grep` or `find` commands, as they may not respect `.gitignore` rules.
