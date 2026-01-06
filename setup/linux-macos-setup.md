# Claude CLI Aliases - Linux/macOS Setup

## Bash/Zsh Aliases

Add these to your `~/.bashrc`, `~/.zshrc`, or `~/.bashrc.d/claude-aliases` file:

```bash
# Claude CLI Aliases

# Bypass permission prompts
alias claude-yolo='claude --dangerously-skip-permissions'

# Route through GLM proxy
alias claude-glm='ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic ANTHROPIC_AUTH_TOKEN=$GLM_API_KEY claude'

# GLM proxy + bypass permissions
alias claude-yolo-glm='ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic ANTHROPIC_AUTH_TOKEN=$GLM_API_KEY claude --dangerously-skip-permissions'

# Set your GLM API key (optional)
export GLM_API_KEY="your-glm-api-key-here"
```

## Apply Changes

After adding the aliases, reload your shell configuration:

```bash
# For bash
source ~/.bashrc

# For zsh
source ~/.zshrc
```

## Usage

```bash
claude-yolo "help me write code"      # Skip permission prompts
claude-glm "explain this"             # Use GLM proxy
claude-yolo-glm "refactor this"       # Both options combined
```

## Setting GLM API Key Permanently

Add this to your shell configuration or environment file:

```bash
export GLM_API_KEY="your-glm-api-key-here"
```

Or create a `.env` file and source it:

```bash
# ~/.config/claude.env
export GLM_API_KEY="your-glm-api-key-here"

# Then in your .bashrc/.zshrc:
source ~/.config/claude.env
```
