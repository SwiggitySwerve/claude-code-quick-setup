# Claude Code Quick Setup

Quick setup scripts and documentation for Claude Code CLI aliases across different platforms.

## Overview

This repository contains configuration files and documentation for setting up useful Claude CLI aliases on Linux, macOS, and Windows.

## Available Aliases

| Alias | Purpose |
|-------|---------|
| `claude-yolo` | Runs Claude with `--dangerously-skip-permissions` (bypasses confirmation prompts) |
| `claude-glm` | Routes Claude API calls through GLM's proxy endpoint |
| `claude-yolo-glm` | Combines both: GLM proxy + skip permissions |

## Quick Setup

Choose your platform below for detailed instructions:

- [Linux/macOS Setup](./linux-macos-setup.md)
- [Windows PowerShell Setup](./windows-powershell-setup.md)
- [Windows CMD Setup](./windows-cmd-setup.md)

## Prerequisites

- Claude Code CLI installed
- (Optional) GLM API key for proxy aliases

## Repository Structure

```
.
├── README.md                    # This file
├── linux-macos-setup.md         # Linux & macOS bash/zsh setup
├── windows-powershell-setup.md  # Windows PowerShell setup
└── windows-cmd-setup.md         # Windows Command Prompt setup
```

## License

MIT License - Feel free to use and modify as needed.
