# Claude CLI Aliases - Windows Command Prompt Setup

## Option 1: Doskey Macros (Recommended)

### 1. Create a Macros File

Create `C:\Users\YourName\claude-aliases.cmd`:

```cmd
@echo off
doskey claude-yolo=claude --dangerously-skip-permissions $*
doskey claude-glm=set ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic $T set ANTHROPIC_AUTH_TOKEN=%GLM_API_KEY% $T claude $*
doskey claude-yolo-glm=set ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic $T set ANTHROPIC_AUTH_TOKEN=%GLM_API_KEY% $T claude --dangerously-skip-permissions $*
```

### 2. Auto-Load on Startup

Choose one of these methods:

#### Method A - Registry (Run once)
```cmd
reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_SZ /d "C:\Users\YourName\claude-aliases.cmd"
```

#### Method B - Shortcut Target
1. Right-click your CMD shortcut
2. Add to the end of Target: `/k "C:\Users\YourName\claude-aliases.cmd"`

### 3. Reload in Current Session
```cmd
C:\Users\YourName\claude-aliases.cmd
```

## Option 2: Batch Scripts

### Create Batch Files

Create a folder in your PATH (e.g., `C:\Users\YourName\bin`) and add these files:

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

### Add to PATH

1. Press `Win + R`, type `sysdm.cpl`
2. **Advanced** → **Environment Variables**
3. Edit `Path` under **User variables**
4. Add: `C:\Users\YourName\bin`

## Setting GLM API Key

### Temporary (Session Only)
```cmd
set GLM_API_KEY=your-key-here
```

### Permanent
```cmd
setx GLM_API_KEY "your-key-here"
```
*Requires restarting CMD to take effect*

### GUI Method
1. Press `Win + R`, type `sysdm.cpl`
2. **Advanced** → **Environment Variables**
3. Add new **User variable**:
   - Variable: `GLM_API_KEY`
   - Value: `your-api-key-here`

## Usage

```cmd
claude-yolo "help me write code"      # Skip permission prompts
claude-glm "explain this"             # Use GLM proxy
claude-yolo-glm "refactor this"       # Both options combined
```

## Verify Setup

```cmd
claude-yolo --version
```

If the version displays correctly, your aliases are working!
