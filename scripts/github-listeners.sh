#!/bin/bash
# GitHub Listeners for Multiple Repositories
# Runs orchestrator instances for each configured repo

set -e

WORKSPACE="/root/tbrain"
CONFIG_DIR="$WORKSPACE/.config/gptme-agent"
GPTMECONTRIB="$WORKSPACE/gptme-contrib"

export GPTME_WORKSPACE="$WORKSPACE"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() {
    echo -e "${GREEN}[$(date +%H:%M:%S)]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[$(date +%H:%M:%S)] WARNING:${NC} $1"
}

error() {
    echo -e "${RED}[$(date +%H:%M:%S)] ERROR:${NC} $1"
}

# Check if gh is authenticated
if ! gh auth status &>/dev/null; then
    error "GitHub CLI not authenticated. Run: gh auth login"
    exit 1
fi

# List of configs to run
CONFIGS=(
    "github-autobok.yaml:autobok"
    "github-wedding-rsvp.yaml:wedding-rsvp"
    "github-redrawn.yaml:redrawn"
    "github-sb-web.yaml:sb-web"
)

log "Starting GitHub listeners for ${#CONFIGS[@]} repositories..."

# Function to run a single listener
run_listener() {
    local config_file="$1"
    local repo_name="$2"
    local config_path="$CONFIG_DIR/$config_file"
    
    if [ ! -f "$config_path" ]; then
        error "Config not found: $config_path"
        return 1
    fi
    
    log "Starting listener for $repo_name..."
    
    # Run orchestrator for this config
    cd "$GPTMECONTRIB" && uv run python -m gptme_contrib_lib.orchestrator \
        --config "$config_path" \
        2>&1 | while read line; do
            echo "[$repo_name] $line"
        done &
    
    echo $! > "/tmp/github-listener-$repo_name.pid"
    log "Listener for $repo_name started (PID: $(cat /tmp/github-listener-$repo_name.pid))"
}

# Start all listeners
for config_pair in "${CONFIGS[@]}"; do
    IFS=':' read -r config_file repo_name <<<"$config_pair"
    run_listener "$config_file" "$repo_name"
    sleep 1  # Stagger starts to avoid rate limits
done

log "All listeners started. PIDs saved to /tmp/github-listener-*.pid"
log "To stop all listeners: killall -f 'gptme_contrib_lib.orchestrator'"
log ""
log "Press Ctrl+C to stop all listeners..."

# Wait for all background processes
wait

log "All listeners stopped."
