#!/bin/bash
# One-time GitHub check for all repositories

set -e

WORKSPACE="/root/tbrain"
CONFIG_DIR="$WORKSPACE/.config/gptme-agent"
GPTMECONTRIB="$WORKSPACE/gptme-contrib"

export GPTME_WORKSPACE="$WORKSPACE"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[CHECK]${NC} $1"
}

# List of configs to check
CONFIGS=(
    "github-autobok.yaml:autobok"
    "github-wedding-rsvp.yaml:wedding-rsvp"
    "github-redrawn.yaml:redrawn"
    "github-sb-web.yaml:sb-web"
)

log "Checking GitHub for new tasks..."

total_created=0

for config_pair in "${CONFIGS[@]}"; do
    IFS=':' read -r config_file repo_name <<<"$config_pair"
    config_path="$CONFIG_DIR/$config_file"

    if [ ! -f "$config_path" ]; then
        echo "  ⚠️  Config not found: $config_file"
        continue
    fi

    log "Checking $repo_name..."

    result=$(cd "$GPTMECONTRIB" && uv run python -m gptme_contrib_lib.orchestrator \
        --config "$config_path" \
        --once 2>&1)

    if echo "$result" | grep -q "Created [1-9]"; then
        created=$(echo "$result" | grep -oP 'Created \K\d+')
        echo "  ✅ Created $created task(s) from $repo_name"
        ((total_created+=created))
    else
        echo "  ⏭️  No new tasks from $repo_name"
    fi
done

log "Total tasks created: $total_created"
