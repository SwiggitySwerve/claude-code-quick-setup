# Claude CLI Aliases - Windows PowerShell Setup

## Setup Instructions

### 1. Open Your PowerShell Profile

```powershell
notepad $PROFILE
```

*If the file doesn't exist, PowerShell will prompt to create it.*

### 2. Add These Functions

```powershell
# Claude CLI Aliases

function claude-yolo {
    claude --dangerously-skip-permissions $args
}

function claude-glm {
    $env:ANTHROPIC_BASE_URL = "https://api.z.ai/api/anthropic"
    $env:ANTHROPIC_AUTH_TOKEN = $env:GLM_API_KEY
    claude $args
}

function claude-yolo-glm {
    $env:ANTHROPIC_BASE_URL = "https://api.z.ai/api/anthropic"
    $env:ANTHROPIC_AUTH_TOKEN = $env:GLM_API_KEY
    claude --dangerously-skip-permissions $args
}

# Set GLM API key (replace with your actual key)
$env:GLM_API_KEY = "your-glm-api-key-here"
```

### 3. Reload Your Profile

```powershell
. $PROFILE
```

## Usage

```powershell
claude-yolo "help me write code"      # Skip permission prompts
claude-glm "explain this"             # Use GLM proxy
claude-yolo-glm "refactor this"       # Both options combined
```

## Setting GLM API Key Permanently

### Option 1: Environment Variable (Recommended)

```powershell
[System.Environment]::SetEnvironmentVariable('GLM_API_KEY', 'your-key-here', 'User')
```

Then restart PowerShell and remove the `$env:GLM_API_KEY = ...` line from your profile.

### Option 2: Keep in Profile

The `$env:GLM_API_KEY` line in your profile works but stores the key in plain text.

### Option 3: Windows System Settings

1. Press `Win + R`, type `sysdm.cpl`
2. Go to **Advanced** → **Environment Variables**
3. Add under **User variables**:
   - Variable: `GLM_API_KEY`
   - Value: `your-api-key-here`

## Verify Setup

```powershell
claude-yolo --version
```

If the version displays correctly, your aliases are working!
