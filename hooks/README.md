# Hooks

This directory contains hook configurations for Claude Code events.

## Available Hook Events

- `user-prompt-submit` - Runs before user prompt is submitted
- `tool-use` - Runs when a tool is invoked
- `tool-result` - Runs after a tool returns results
- `pre-response` - Runs before Claude sends a response

## Available Hooks

### [Pre-commit Validation](./pre-commit-hook.json)
Validates code quality before allowing commits.

**Features:**
- Runs linters on staged files
- Type checking (TypeScript)
- Runs affected tests
- Configurable failure handling

**Events:** `user-prompt-submit`

### [Tool Usage Logger](./tool-logging-hook.json)
Logs all tool usage for debugging and analytics.

**Features:**
- JSON format logging
- Performance tracking
- Duration measurement
- Debug mode support

**Events:** `tool-use`, `tool-result`

### [Automated Code Review](./code-review-hook.json)
Performs automated code review when files are modified.

**Features:**
- Security issue detection
- Hardcoded secret detection
- TODO/FIXME tracking
- Complexity analysis
- Pattern matching

**Events:** `tool-result`

### [Documentation Validator](./documentation-hook.json)
Ensures code changes include appropriate documentation.

**Features:**
- Checks for function documentation
- Reminds about README updates
- Validates docstring presence

**Events:** `pre-response`

### [Performance Monitor](./performance-hook.json)
Monitors performance of long-running operations.

**Features:**
- Slow operation warnings
- Very slow operation alerts
- Optimization suggestions
- Tool-specific recommendations

**Events:** `tool-result`

## Usage

Configure hooks in your Claude Code settings file (`~/.claude/settings.json`):

```json
{
  "hooks": [
    "hooks/pre-commit-hook.json",
    "hooks/code-review-hook.json",
    "hooks/performance-hook.json"
  ]
}
```

## Creating Custom Hooks

Hook configuration structure:

```json
{
  "hookName": "my-custom-hook",
  "description": "What this hook does",
  "events": ["tool-use", "tool-result"],
  "condition": "optional JavaScript expression",
  "actions": [
    {
      "type": "log|run-command|check|analysis",
      "description": "Action description",
      "command": "shell command if type is run-command",
      "onFailure": "warn|error|ignore"
    }
  ],
  "message": {
    "onWarning": "Warning message",
    "onSuccess": "Success message"
  }
}
```

### Action Types

1. **log** - Log information
2. **run-command** - Execute a shell command
3. **check** - Perform validation
4. **analysis** - Analyze code patterns
5. **append-file** - Write to a file

### Conditions

Use JavaScript expressions to filter when hooks run:

```json
{
  "condition": "toolName === 'Edit' && duration > 5000"
}
```

Available variables:
- `toolName` - Name of the tool
- `duration` - Operation duration in ms
- `success` - Boolean indicating success
- `prompt` - User's prompt text
- `filesChanged` - Array of modified files
