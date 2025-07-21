#!/bin/bash

# Delete all workflow runs in a repository using GitHub CLI
# Usage: ./delete_workflow_runs.sh [owner/repo]

# Set the repository (use current repo if not specified)
REPO=${1:-$(gh repo view --json nameWithOwner -q .nameWithOwner)}

echo "Deleting all workflow runs for repository: $REPO"

# Get all workflow runs and delete them
gh run list --repo "$REPO" --limit 1000 --json databaseId -q '.[].databaseId' | while read -r run_id; do
    if [ -n "$run_id" ]; then
        echo "Deleting run ID: $run_id"
        gh run delete "$run_id" --repo "$REPO" || echo "Failed to delete run $run_id"
    fi
done

echo "Finished deleting workflow runs"
