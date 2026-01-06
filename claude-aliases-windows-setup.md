# Claude CLI Aliases - Windows Setup Guide

This document shows how to set up Claude CLI aliases on Windows for CMD and PowerShell.

## Aliases to Replicate

| Alias | Purpose |
|-------|---------|
| `claude-glm` | Routes Claude API calls through GLM's proxy endpoint |
| `claude-yolo` | Runs Claude with `--dangerously-skip-permissions` (skips confirmation prompts) |
| `claude-yolo-glm` | Combines both: GLM proxy + skip permissions |

---

## PowerShell Setup

### Option 1: Add to PowerShell Profile

**1. Open your PowerShell profile:**
```powershell
notepad $PROFILE
```
*(If the file doesn't exist, PowerShell will prompt to create it)*

**2. Add these functions to your profile:**
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

# Set GLM API key (replace with your actual key or load from environment)
$env:GLM_API_KEY = "your-glm-api-key-here"
```

**3. Reload your profile:**
```powershell
. $PROFILE
```

### Option 2: Add to System Environment Variables

**For GLM API Key:**
1. Press `Win + R`, type `sysdm.cpl`
2. Go to **Advanced** → **Environment Variables**
3. Add under **User variables**:
   - Variable: `GLM_API_KEY`
   - Value: `your-api-key-here`

---

## Command Prompt (CMD) Setup

### Option 1: Using Doskey Macros

**1. Create a file named `claude-aliases.cmd`:**
```cmd
@echo off
doskey claude-yolo=claude --dangerously-skip-permissions $*
doskey claude-glm=set ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic $T set ANTHROPIC_AUTH_TOKEN=%GLM_API_KEY% $T claude $*
doskey claude-yolo-glm=set ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic $T set ANTHROPIC_AUTH_TOKEN=%GLM_API_KEY% $T claude --dangerously-skip-permissions $*
```

**2. Load it in your CMD session:**
```cmd
claude-aliases.cmd
```

**3. To auto-load on every CMD startup:**

- **Method A - Registry:**
  ```cmd
  reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d "path\to\claude-aliases.cmd"
  ```

- **Method B - Shortcut Target:**
  1. Right-click your CMD shortcut
  2. Add to the end of Target: `/k "path\to\claude-aliases.cmd"`

### Option 2: Using Batch Scripts

Create individual batch files in a folder that's in your PATH:

**`claude-yolo.bat`:**
```batch
@echo off
claude --dangerously-skip-permissions %*
```

**`claude-glm.bat`:**
```batch
@echo off
setlocal
set "ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic"
set "ANTHROPIC_AUTH_TOKEN=%GLM_API_KEY%"
claude %*
endlocal
```

**`claude-yolo-glm.bat`:**
```batch
@echo off
setlocal
set "ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic"
set "ANTHROPIC_AUTH_TOKEN=%GLM_API_KEY%"
claude --dangerously-skip-permissions %*
endlocal
```

Place these `.bat` files in any directory in your PATH (e.g., `C:\Users\YourName\bin`).

---

## Setting Environment Variables in Windows

### PowerShell (Temporary - Session Only)
```powershell
$env:GLM_API_KEY = "your-key-here"
```

### PowerShell (Permanent)
```powershell
[System.Environment]::SetEnvironmentVariable('GLM_API_KEY', 'your-key-here', 'User')
```

### CMD (Temporary - Session Only)
```cmd
set GLM_API_KEY=your-key-here
```

### CMD (Permanent - via setx)
```cmd
setx GLM_API_KEY "your-key-here"
```

### GUI Method (Both)
1. Press `Win + R`, type `sysdm.cpl`
2. **Advanced** → **Environment Variables**
3. Add new variable under **User variables**

---

## Usage Examples

After setup, use the commands the same way on all platforms:

```powershell
# PowerShell
claude-yolo "help me write a function"
claude-glm "explain this code"
claude-yolo-glm "refactor this project"
```

```cmd
# CMD
claude-yolo "help me write a function"
claude-glm "explain this code"
claude-yolo-glm "refactor this project"
```

---

## Quick Verification

Test your setup:

```powershell
# PowerShell
claude-yolo --version
```

```cmd
# CMD
claude-yolo --version
```

If the version prints correctly, your aliases are working!

---

## Notes

- **PowerShell functions** are more robust than CMD aliases
- **Batch files** (`.bat`) work universally but require multiple files
- **Doskey** macros are lightweight but session-only unless auto-loaded
- Environment variables set with `setx` require restarting the terminal to take effect
- `$*` in doskey and `%*` in batch files pass all arguments through
