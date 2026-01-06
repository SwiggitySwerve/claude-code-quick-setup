#!/bin/bash
# Code Quality Commands for Claude Code CLI

# Command: lint-all
# Runs all available linters
lint-all() {
    echo "## Running Linters"
    echo ""

    if [ -f ".eslintrc.js" ] || [ -f ".eslintrc.json" ]; then
        echo "### ESLint"
        npx eslint . --ext .js,.jsx,.ts,.tsx 2>/dev/null || echo "ESLint not configured"
        echo ""
    fi

    if [ -f ".pylintrc" ] || [ -f "pyproject.toml" ]; then
        echo "### Pylint"
        pylint **/*.py 2>/dev/null || echo "Pylint not configured"
        echo ""
    fi

    if [ -f "Cargo.toml" ]; then
        echo "### Rust Clippy"
        cargo clippy 2>/dev/null || echo "Clippy not available"
        echo ""
    fi

    if command -v shellcheck &> /dev/null; then
        echo "### ShellCheck"
        find . -name "*.sh" -not -path "./node_modules/*" -exec shellcheck {} \;
        echo ""
    fi
}

# Command: format-check
# Checks code formatting
format-check() {
    echo "## Checking Code Formatting"
    echo ""

    if [ -f ".prettierrc" ] || [ -f ".prettierrc.json" ]; then
        echo "### Prettier"
        npx prettier --check . 2>/dev/null || echo "Prettier check failed"
        echo ""
    fi

    if [ -f ".black" ] || grep -q "black" pyproject.toml 2>/dev/null; then
        echo "### Black (Python)"
        black --check . 2>/dev/null || echo "Black check failed"
        echo ""
    fi
}

# Command: security-scan
# Runs security scans
security-scan() {
    echo "## Security Scan"
    echo ""

    if [ -f "package.json" ]; then
        echo "### npm audit"
        npm audit 2>/dev/null || echo "npm audit failed"
        echo ""
    fi

    if [ -f "requirements.txt" ]; then
        echo "### Safety check (Python)"
        pip install safety 2>/dev/null && safety check 2>/dev/null || echo "Safety not available"
        echo ""
    fi

    if [ -f "go.mod" ]; then
        echo "### Go security check"
        go install golang.org/x/vuln/cmd/govulncheck@latest 2>/dev/null
        govulncheck ./... 2>/dev/null || echo "govulncheck not available"
        echo ""
    fi
}
