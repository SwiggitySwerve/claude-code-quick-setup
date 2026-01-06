#!/bin/bash
# Git Helper Commands for Claude Code CLI
# Place this file in your commands/ directory

# Command: git-summary
# Provides a comprehensive git repository summary
git-summary() {
    echo "## Repository Overview"
    echo ""
    echo "### Branch Information"
    git branch -a
    echo ""
    echo "### Recent Commits"
    git log --oneline -10
    echo ""
    echo "### Status"
    git status --short
    echo ""
    echo "### Uncommitted Changes"
    git diff --stat
}

# Command: git-cleanup
# Cleans up merged branches and stale references
git-cleanup() {
    echo "Cleaning up git repository..."
    git remote prune origin
    git branch --merged | grep -v "\*" | xargs -n 1 git branch -d 2>/dev/null
    echo "Cleanup complete"
}

# Command: git-file-history
# Shows history for a specific file
# Usage: git-file-history <filename>
git-file-history() {
    if [ -z "$1" ]; then
        echo "Usage: git-file-history <filename>"
        return 1
    fi
    git log --follow --patch -- "$1"
}

# Command: git-branch-info
# Shows detailed information about current branch
git-branch-info() {
    local branch=$(git branch --show-current)
    echo "Branch: $branch"
    echo ""
    echo "Tracking:"
    git branch -vv | grep "*"
    echo ""
    echo "Commits ahead/behind remote:"
    git rev-list --left-right --count "$branch@{u}...$branch" 2>/dev/null || echo "No remote tracking"
    echo ""
    echo "Last commit:"
    git log -1 --pretty=format:"%h - %an, %ar : %s"
}
