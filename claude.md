# Claude Code Quick Setup

A comprehensive collection of scripts, aliases, commands, and skills for enhancing your Claude Code CLI experience.

## Repository Overview

This repository provides ready-to-use components for Claude Code across Linux, macOS, and Windows platforms. It serves as a central hub for:

- **Quick setup scripts** - Platform-specific installation guides
- **Custom commands** - Reusable shell commands for common tasks
- **Skill definitions** - Official and community-created skills
- **Hook configurations** - Automation and validation hooks
- **MCP server setups** - Model Context Protocol extensions
- **Documentation** - Comprehensive guides and references

## Directory Structure

```
claude-code-quick-setup/
├── setup/              # Installation & configuration guides
│   ├── linux-macos-setup.md
│   ├── windows-powershell-setup.md
│   └── windows-cmd-setup.md
├── commands/           # Custom shell commands
│   ├── git-helpers.sh
│   ├── project-commands.sh
│   └── code-quality.sh
├── skills/             # Reusable skill definitions
│   ├── official/       # Official Anthropic skills
│   │   ├── algorithmic-art/
│   │   ├── brand-guidelines/
│   │   ├── canvas-design/
│   │   ├── doc-coauthoring/
│   │   ├── docx/
│   │   ├── frontend-design/
│   │   ├── internal-comms/
│   │   ├── mcp-builder/
│   │   ├── pdf/
│   │   ├── pptx/
│   │   ├── skill-creator/
│   │   ├── slack-gif-creator/
│   │   ├── theme-factory/
│   │   ├── webapp-testing/
│   │   ├── web-artifacts-builder/
│   │   └── xlsx/
│   ├── document-code.md
│   ├── refactor-code.md
│   ├── test-generator.md
│   ├── debug-helper.md
│   ├── optimization.md
│   └── api-integration.md
├── hooks/              # Hook configurations
│   ├── pre-commit-hook.json
│   ├── tool-logging-hook.json
│   ├── code-review-hook.json
│   ├── documentation-hook.json
│   └── performance-hook.json
├── mcp-server/         # MCP server configurations
├── docs/               # Additional documentation
│   ├── resources.md
│   ├── community-examples.md
│   └── quick-reference.md
└── README.md           # This file
```

## Quick Start

### 1. Install Claude Code CLI

```bash
npm install -g @anthropic-ai/claude-code
claude-code init
```

### 2. Set Up Aliases (Optional but Recommended)

**For Linux/macOS (Bash/Zsh):**
```bash
# Add to ~/.bashrc or ~/.zshrc
source /path/to/claude-code-quick-setup/setup/linux-macos-setup.md
```

**For Windows (PowerShell):**
```powershell
# Run in PowerShell
. /path/to/claude-code-quick-setup/setup/windows-powershell-setup.md
```

### 3. Configure Skills Path

Add to your Claude Code configuration (`~/.claude/config.json` or `.claude.json` in your project):

```json
{
  "skillsPath": "/home/swiggity/claude-code-quick-setup/skills",
  "hooksPath": "/home/swiggity/claude-code-quick-setup/hooks"
}
```

### 4. Start Using Claude Code

```bash
# Interactive mode
claude-code

# Direct prompts
claude-code "Use document-code skill on src/utils.js"

# Using aliases (if configured)
cc "Document this code"
```

## Skills

This repository includes both official Anthropic skills and community-created skills.

### Official Anthropic Skills

Located in `/home/swiggity/claude-code-quick-setup/skills/official/`, these are production-ready skills maintained by the Anthropic team:

- **algorithmic-art** - Create algorithmic art with p5.js
- **brand-guidelines** - Apply Anthropic brand colors and typography
- **canvas-design** - Create visual art in PNG/PDF formats
- **doc-coauthoring** - Structured documentation co-authoring workflow
- **docx** - Comprehensive Word document creation and editing
- **frontend-design** - Production-grade frontend interface design
- **internal-comms** - Internal communication templates
- **mcp-builder** - Create MCP servers (Python/TypeScript)
- **pdf** - PDF manipulation toolkit
- **pptx** - PowerPoint presentation creation and editing
- **skill-creator** - Meta-skill for creating new skills
- **slack-gif-creator** - Create animated GIFs for Slack
- **theme-factory** - Style artifacts with professional themes
- **webapp-testing** - Test local web apps with Playwright
- **web-artifacts-builder** - Create elaborate HTML artifacts with React
- **xlsx** - Comprehensive spreadsheet creation and editing

### Community Skills

Located in `/home/swiggity/claude-code-quick-setup/skills/`:

#### Documentation Skills

**[document-code.md](skills/document-code.md)**
Automatically generates comprehensive documentation for code files.

```bash
claude-code "Use document-code skill on src/utils.js"
```

#### Code Quality Skills

**[refactor-code.md](skills/refactor-code.md)**
Improves code quality, readability, and maintainability.

```bash
claude-code "Use refactor-code skill to improve this function"
```

**[test-generator.md](skills/test-generator.md)**
Generates comprehensive unit tests for code files.

```bash
claude-code "Use test-generator skill for UserService"
```

#### Development Skills

**[debug-helper.md](skills/debug-helper.md)**
Systematically investigates and resolves bugs.

```bash
claude-code "Use debug-helper skill for this error"
```

**[optimization.md](skills/optimization.md)**
Analyzes and optimizes code for better performance.

```bash
claude-code "Use optimization skill on this slow function"
```

**[api-integration.md](skills/api-integration.md)**
Handles integration with external APIs.

```bash
claude-code "Use api-integration skill to connect to GitHub API"
```

## Commands

Custom shell commands are available in `/home/swiggity/claude-code-quick-setup/commands/`:

### Git Helpers

**[git-helpers.sh](commands/git-helpers.sh)**
Repository overview, cleanup, and history tools.

```bash
source /home/swiggity/claude-code-quick-setup/commands/git-helpers.sh
git-summary              # Get repository overview
```

### Project Commands

**[project-commands.sh](commands/project-commands.sh)**
Project initialization and statistics.

```bash
source /home/swiggity/claude-code-quick-setup/commands/project-commands.sh
project-init my-app      # Initialize new project
```

### Code Quality

**[code-quality.sh](commands/code-quality.sh)**
Linting, formatting, and security scanning.

```bash
source /home/swiggity/claude-code-quick-setup/commands/code-quality.sh
lint-all                 # Run all linters
```

## Hooks

Automation hooks are available in `/home/swiggity/claude-code-quick-setup/hooks/`:

Add to your Claude Code settings (`~/.claude/config.json`):

```json
{
  "hooks": [
    "/home/swiggity/claude-code-quick-setup/hooks/pre-commit-hook.json",
    "/home/swiggity/claude-code-quick-setup/hooks/code-review-hook.json",
    "/home/swiggity/claude-code-quick-setup/hooks/performance-hook.json"
  ]
}
```

Available hooks:

- **[pre-commit-hook.json](hooks/pre-commit-hook.json)** - Quality checks before commits
- **[tool-logging-hook.json](hooks/tool-logging-hook.json)** - Track tool usage
- **[code-review-hook.json](hooks/code-review-hook.json)** - Security and quality review
- **[documentation-hook.json](hooks/documentation-hook.json)** - Ensure code is documented
- **[performance-hook.json](hooks/performance-hook.json)** - Track operation performance

## MCP Servers

Model Context Protocol (MCP) server configurations are available in `/home/swiggity/claude-code-quick-setup/mcp-server/`.

MCP servers extend Claude Code's capabilities by providing additional tools and integrations. See the [mcp-server README](mcp-server/README.md) for details.

## Documentation

Comprehensive guides are available in `/home/swiggity/claude-code-quick-setup/docs/`:

- **[resources.md](docs/resources.md)** - Official sources, community repositories, learning materials
- **[community-examples.md](docs/community-examples.md)** - Real-world usage patterns and case studies
- **[quick-reference.md](docs/quick-reference.md)** - Command reference and cheat sheet

## Using with Projects

### Project-Specific Configuration

Create a `.claude.json` file in your project root:

```json
{
  "skills": [
    "/home/swiggity/claude-code-quick-setup/skills/document-code.md",
    "/home/swiggity/claude-code-quick-setup/skills/test-generator.md"
  ],
  "hooks": [
    "/home/swiggity/claude-code-quick-setup/hooks/pre-commit-hook.json"
  ],
  "exclude": ["node_modules", "dist", ".git"],
  "include": ["src/**/*.ts", "test/**/*.ts"]
}
```

### Common Workflows

#### Workflow 1: Document Code
```bash
claude-code "Use document-code skill on all files in src/"
```

#### Workflow 2: Test-Driven Development
```bash
claude-code "Use test-generator skill to create tests for UserService"
claude-code "Implement UserService to pass the tests"
```

#### Workflow 3: Code Review
```bash
claude-code "Use refactor-code skill to review this PR"
```

## SkillsMP.com

**SkillsMP.com** is a marketplace for discovering and sharing Claude Code skills. It provides:

- **Skill Discovery** - Browse and search for skills by category
- **Community Contributions** - Share your skills with the community
- **Ratings and Reviews** - Find high-quality, tested skills
- **Easy Installation** - One-click skill installation

### How SkillsMP Relates to This Repository

This repository includes:
1. **Official Anthropic Skills** - From the official skills repository
2. **Community Skills** - Curated skills from the community
3. **Custom Skills** - Skills created specifically for this setup

SkillsMP.com can be used to:
- Discover additional skills beyond what's included here
- Share your own custom skills with the wider community
- Find skills for specific use cases or industries
- Get feedback and improvements on your skills

### Publishing Your Skills

After creating a custom skill using the **skill-creator** skill:

```bash
claude-code "Use skill-creator to create a new skill"
```

You can publish it to SkillsMP.com to share with the community.

## Best Practices

### 1. Configuration Management

- Version control your `.claude.json` configuration
- Use environment-specific settings when needed
- Document custom commands and skills in your project README

### 2. Team Collaboration

- Share this repository with your team
- Standardize on common skills (e.g., document-code, test-generator)
- Document team-specific hooks and configurations
- Review Claude Code generated code before committing

### 3. Performance

- Cache expensive operations
- Use selective hooks to avoid overhead
- Limit tool usage scope for better performance
- Profile custom commands before integrating

### 4. Security

- Never hardcode API keys or secrets
- Use `.env` files and add them to `.gitignore`
- Review generated code for security issues
- Use security hooks (included in this repository)
- Keep dependencies updated

## Official Sources

- **Documentation**: https://docs.anthropic.com/en/docs/claude-code
- **GitHub**: https://github.com/anthropics
- **NPM Package**: https://www.npmjs.com/package/@anthropic-ai/claude-code
- **Skills Repository**: https://github.com/anthropics/skills

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

## License

MIT License - Free to use and modify.

## Support

For issues, questions, or contributions:

1. Check the [documentation](docs/) in this repository
2. Review [official Claude Code docs](https://docs.anthropic.com/en/docs/claude-code)
3. Search existing GitHub issues
4. Create a new issue with detailed information

## Acknowledgments

This repository is community-maintained and is not officially affiliated with Anthropic. Official skills are included from the [Anthropic skills repository](https://github.com/anthropics/skills).

---

**Last Updated**: 2025-01-05

**Note**: This repository serves as a comprehensive starting point for using Claude Code effectively. Combine it with SkillsMP.com to discover even more skills and capabilities from the wider Claude Code community.
