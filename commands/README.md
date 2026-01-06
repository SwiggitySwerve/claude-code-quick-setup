# Commands

This directory contains custom commands and scripts for Claude Code CLI.

## Usage

Place command files here and reference them in your Claude Code configuration.

## Available Commands

### Git Helpers ([git-helpers.sh](./git-helpers.sh))
- `git-summary` - Comprehensive repository overview
- `git-cleanup` - Clean merged branches and stale references
- `git-file-history` - Show history for specific file
- `git-branch-info` - Detailed branch information

### Project Commands ([project-commands.sh](./project-commands.sh))
- `project-init` - Initialize new project structure
- `project-stats` - Show project statistics
- `dependency-check` - Check for outdated dependencies

### Code Quality ([code-quality.sh](./code-quality.sh))
- `lint-all` - Run all available linters
- `format-check` - Check code formatting
- `security-scan` - Run security scans

## Integration

Add these commands to your shell configuration (`.bashrc`, `.zshrc`):

```bash
# Source Claude Code commands
source ~/claude-code-quick-setup/commands/git-helpers.sh
source ~/claude-code-quick-setup/commands/project-commands.sh
source ~/claude-code-quick-setup/commands/code-quality.sh
```

Or use individual commands as needed.
