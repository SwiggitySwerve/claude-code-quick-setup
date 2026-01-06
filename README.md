# Claude Code Quick Setup

Quick setup scripts, aliases, commands, and extensions for Claude Code CLI.

## Overview

This repository contains configuration files, documentation, and ready-to-use components for enhancing your Claude Code experience across Linux, macOS, and Windows.

## Directory Structure

```
claude-code-quick-setup/
├── setup/           # Installation & configuration guides
├── commands/        # Custom commands and scripts
├── skills/          # Reusable skill definitions
├── hooks/           # Hook configurations
├── mcp-server/      # MCP server setups
└── docs/            # Additional documentation
```

## Quick Start

1. **Setup Aliases** → See [setup/](./setup/) for platform-specific instructions
2. **Add Commands** → Browse [commands/](./commands/) for useful additions
3. **Install Skills** → Check [skills/](./skills/) for ready-to-use skills

## What's Included

### Commands ([commands/](./commands/))
Ready-to-use shell commands for common development tasks:

- **[Git Helpers](./commands/git-helpers.sh)** - Repository overview, cleanup, and history
- **[Project Commands](./commands/project-commands.sh)** - Project initialization and statistics
- **[Code Quality](./commands/code-quality.sh)** - Linting, formatting, and security scanning

### Skills ([skills/](./skills/))
Comprehensive skill definitions for Claude Code:

**Documentation:**
- [Document Code](./skills/document-code.md) - Auto-generate code documentation

**Code Quality:**
- [Refactor Code](./skills/refactor-code.md) - Improve code quality and maintainability
- [Test Generator](./skills/test-generator.md) - Generate comprehensive unit tests

**Development:**
- [Debug Helper](./skills/debug-helper.md) - Systematic debugging methodology
- [Optimization](./skills/optimization.md) - Performance and memory optimization
- [API Integration](./skills/api-integration.md) - External API integration patterns

### Hooks ([hooks/](./hooks/))
Pre-configured hooks for automation:

- [Pre-commit Validation](./hooks/pre-commit-hook.json) - Quality checks before commits
- [Tool Usage Logger](./hooks/tool-logging-hook.json) - Track tool usage
- [Automated Code Review](./hooks/code-review-hook.json) - Security and quality review
- [Documentation Validator](./hooks/documentation-hook.json) - Ensure code is documented
- [Performance Monitor](./hooks/performance-hook.json) - Track operation performance

### Documentation ([docs/](./docs/))
Comprehensive guides and references:

- [Resources Guide](./docs/resources.md) - Official sources, community repositories, learning materials
- [Community Examples](./docs/community-examples.md) - Real-world usage patterns and case studies
- [Quick Reference](./docs/quick-reference.md) - Command reference and cheat sheet

## Repository Sections

### [setup/](./setup/)
Installation guides for Claude CLI aliases:
- `linux-macos-setup.md` - Bash/Zsh configuration
- `windows-powershell-setup.md` - PowerShell functions
- `windows-cmd-setup.md` - Command Prompt setup

### [mcp-server/](./mcp-server/)
MCP (Model Context Protocol) server configurations.

## Usage Examples

### Using Commands
```bash
# Source the commands in your shell
source ~/claude-code-quick-setup/commands/git-helpers.sh

# Use the commands
git-summary              # Get repository overview
project-init my-app      # Initialize new project
lint-all                 # Run all linters
```

### Using Skills
```bash
# In Claude Code CLI, reference skills by name
claude-code "Use document-code skill on src/utils.js"
claude-code "Use test-generator skill for UserService"
claude-code "Use refactor-code skill to improve readability"
```

### Using Hooks
Add to your Claude Code settings (`~/.claude/settings.json`):
```json
{
  "hooks": [
    "~/claude-code-quick-setup/hooks/pre-commit-hook.json",
    "~/claude-code-quick-setup/hooks/code-review-hook.json",
    "~/claude-code-quick-setup/hooks/performance-hook.json"
  ]
}
```

## Official Sources

- **Documentation**: https://docs.anthropic.com/en/docs/claude-code
- **GitHub**: https://github.com/anthropics
- **NPM Package**: https://www.npmjs.com/package/@anthropic-ai/claude-code

## Features

- Multi-language support (JavaScript, Python, Rust, Go, and more)
- Cross-platform compatibility (Linux, macOS, Windows)
- Comprehensive documentation and examples
- Ready-to-use configurations
- Community-driven patterns and best practices
- Security-focused hooks and validations
- Performance monitoring and optimization

## Contributing

We welcome contributions! Please feel free to submit PRs with:

- New custom commands
- Additional skill definitions
- Hook configurations
- Documentation improvements
- Bug fixes
- Usage examples

See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

## License

MIT License - Free to use and modify.

## Star History

If you find this repository helpful, please consider giving it a star!

---

**Note**: This repository is community-maintained and is not officially affiliated with Anthropic. For official Claude Code documentation, see https://docs.anthropic.com/en/docs/claude-code
