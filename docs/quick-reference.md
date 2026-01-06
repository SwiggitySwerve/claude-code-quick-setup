# Claude Code CLI Quick Reference

A quick reference guide for common Claude Code CLI operations, commands, and patterns.

## Installation & Setup

### Quick Install
```bash
npm install -g @anthropic-ai/claude-code
claude-code init
```

### Verify Installation
```bash
claude-code --version
claude-code --help
```

## Basic Usage

### Interactive Mode
```bash
claude-code
```

### Direct Prompts
```bash
claude-code "Your prompt here"
claude-code -p "Another prompt"
```

### With Files
```bash
claude-code "Review this file" path/to/file.js
claude-code "Refactor this function" src/utils.ts
```

## Essential Commands

### File Operations
```bash
# Read file
claude-code "Read and summarize package.json"

# Edit file
claude-code "Update the README with new features"

# Create file
claude-code "Create a new config file with default settings"
```

### Code Analysis
```bash
# Explain code
claude-code "Explain how this function works"

# Find bugs
claude-code "Find potential bugs in this code"

# Review PR
claude-code "Review this pull request"
```

### Documentation
```bash
# Generate docs
claude-code "Document all functions in this file"

# Add comments
claude-code "Add explanatory comments to this code"

# Create README
claude-code "Generate a comprehensive README"
```

## Common Aliases

Add to your shell config (`~/.bashrc`, `~/.zshrc`):

```bash
# Claude Code aliases
alias cc='claude-code'
alias ccd='claude-code "Document this code"'
alias cct='claude-code "Generate tests for this"'
alias ccr='claude-code "Refactor this code"'
alias ccd='claude-code "Debug this issue"'
```

## Skills Quick Reference

### Using Skills

```bash
# Document code
claude-code "Use document-code skill on src/utils.js"

# Generate tests
claude-code "Use test-generator skill for UserService"

# Refactor
claude-code "Use refactor-code skill to improve readability"

# Debug
claude-code "Use debug-helper skill for this error"

# Optimize
claude-code "Use optimization skill on this slow function"

# API integration
claude-code "Use api-integration skill to connect to GitHub API"
```

## Patterns Quick Reference

### Pattern 1: Read-Edit-Flow
```bash
# 1. Read existing code
claude-code "Read and understand app.js"

# 2. Make changes
claude-code "Add error handling to all async functions"

# 3. Verify
claude-code "Show me what changed and run tests"
```

### Pattern 2: Test-Driven Development
```bash
# 1. Generate test
claude-code "Write unit tests for calculateTotal function"

# 2. Implement
claude-code "Implement calculateTotal to pass the test"

# 3. Refactor
claude-code "Refactor calculateTotal for better readability"
```

### Pattern 3: Documentation First
```bash
# 1. Document requirements
claude-code "Create API documentation for user endpoints"

# 2. Implement
claude-code "Implement the endpoints as documented"

# 3. Validate
claude-code "Verify implementation matches documentation"
```

## Keyboard Shortcuts (Terminal)

```bash
# Ctrl+C - Cancel current operation
# Ctrl+D - End input/send message
# Ctrl+L - Clear screen
# Up/Down arrows - Navigate command history
```

## Environment Variables

```bash
# Required
export CLAUDE_API_KEY="your-api-key"

# Optional
export CLAUDE_MODEL="claude-sonnet-4-5"  # Model to use
export CLAUDE_DEBUG="true"               # Enable debug logging
export CLAUDE_HOOKS_PATH="./hooks"       # Custom hooks directory
export CLAUDE_MAX_TOKENS="4096"          # Max response tokens
export CLAUDE_TEMPERATURE="0.7"          # Response randomness (0-1)
```

## Configuration Files

### Main Config (`~/.claude/config.json`)
```json
{
  "model": "claude-sonnet-4-5",
  "temperature": 0.7,
  "maxTokens": 4096,
  "skillsPath": "~/.claude/skills",
  "hooksPath": "~/.claude/hooks",
  "commandsPath": "~/.claude/commands"
}
```

### Project Config (`.claude.json`)
```json
{
  "skills": ["skills/document-code.md"],
  "hooks": ["hooks/pre-commit-hook.json"],
  "exclude": ["node_modules", "dist", ".git"],
  "include": ["src/**/*.ts", "test/**/*.ts"]
}
```

## Hook Events Reference

| Event | When It Fires | Use Cases |
|-------|--------------|-----------|
| `user-prompt-submit` | Before prompt processed | Validation, preprocessing |
| `tool-use` | When tool invoked | Logging, tracking |
| `tool-result` | After tool completes | Post-processing, validation |
| `pre-response` | Before response sent | Filtering, formatting |

## Tool Reference

### File Tools
- **Read** - Read file contents
- **Write** - Write/create file
- **Edit** - Edit file with find/replace
- **Glob** - Find files by pattern
- **Grep** - Search file contents

### Execution Tools
- **Bash** - Execute shell commands

### Analysis Tools
- **LSP** - Language Server Protocol operations

## Common Workflows

### Workflow 1: New Feature
```bash
# 1. Understand existing code
claude-code "Explain how the authentication system works"

# 2. Design new feature
claude-code "Design a password reset feature"

# 3. Implement
claude-code "Implement password reset with email verification"

# 4. Test
claude-code "Generate tests for password reset feature"

# 5. Document
claude-code "Document the new password reset feature"
```

### Workflow 2: Bug Fix
```bash
# 1. Reproduce bug
claude-code "Help me reproduce this bug: [description]"

# 2. Investigate
claude-code "Use debug-helper skill to find the root cause"

# 3. Fix
claude-code "Fix the bug in the authentication middleware"

# 4. Verify
claude-code "Run tests to verify the fix"

# 5. Prevent recurrence
claude-code "Add a test to prevent this bug from recurring"
```

### Workflow 3: Code Review
```bash
# 1. Overall review
claude-code "Review this pull request for bugs and improvements"

# 2. Security check
claude-code "Check for security vulnerabilities"

# 3. Performance check
claude-code "Analyze performance and suggest optimizations"

# 4. Documentation check
claude-code "Ensure all changes are properly documented"

# 5. Test coverage
claude-code "Verify test coverage is adequate"
```

## Tips & Tricks

### Efficiency Tips
1. **Be specific** - Detailed prompts get better results
2. **Use context** - Reference files and line numbers
3. **Iterate** - Build on previous responses
4. **Chain operations** - Use semicolons for multiple steps
5. **Use skills** - Skills are faster than explaining each time

### Quality Tips
1. **Review changes** - Always review generated code
2. **Run tests** - Verify nothing breaks
3. **Check security** - Look for vulnerabilities
4. **Maintain style** - Follow project conventions
5. **Document** - Keep docs in sync with code

### Performance Tips
1. **Narrow scope** - Specify exact files/lines
2. **Use .claudeignore** - Skip unnecessary files
3. **Cache results** - Reuse previous outputs
4. **Batch operations** - Group similar tasks
5. **Limit context** - Only include relevant files

## Troubleshooting

### Common Issues

**Issue**: Command not found
```bash
# Solution: Check installation
which claude-code
npm list -g @anthropic-ai/claude-code
```

**Issue**: API key errors
```bash
# Solution: Verify API key
echo $CLAUDE_API_KEY
claude-code --verify-auth
```

**Issue**: Slow responses
```bash
# Solution: Check model and tokens
claude-code --config
# Reduce maxTokens if needed
```

**Issue**: Hooks not working
```bash
# Solution: Validate hook syntax
claude-code --validate-hooks hooks/*.json
```

## Getting Help

```bash
# Built-in help
claude-code --help
claude-code <command> --help

# Check config
claude-code --config

# Test connection
claude-code --test

# Debug mode
CLAUDE_DEBUG=true claude-code "your prompt"
```

## Advanced Usage

### Chaining Commands
```bash
claude-code "Read package.json" && \
claude-code "Update dependencies" && \
claude-code "Run tests"
```

### Piping
```bash
cat large-file.txt | claude-code "Summarize this content"
find . -name "*.js" | claude-code "Review these files"
```

### Background Jobs
```bash
claude-code "Long running task" &
jobs -l  # Check background jobs
```

## Resources

- **Official Docs**: https://docs.anthropic.com/en/docs/claude-code
- **GitHub**: https://github.com/anthropics
- **Community**: Search GitHub for "claude-code" examples

---

**Quick Tip**: Bookmark this page for fast reference during development!
