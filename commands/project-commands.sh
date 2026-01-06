#!/bin/bash
# Project Management Commands for Claude Code CLI

# Command: project-init
# Initializes a new project with common files
project-init() {
    local project_name=${1:-"my-project"}
    echo "Initializing project: $project_name"

    # Create basic directory structure
    mkdir -p src tests docs

    # Create basic files
    cat > README.md << EOF
# $project_name

## Description
[Add project description here]

## Installation
\`\`\`bash
# Add installation instructions
\`\`\`

## Usage
\`\`\`bash
# Add usage instructions
\`\`\`

## License
MIT
EOF

    cat > .gitignore << EOF
# Dependencies
node_modules/
vendor/

# Build outputs
dist/
build/
*.log

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Environment
.env
.env.local
EOF

    echo "Project structure created!"
    tree -L 2 2>/dev/null || find . -type d -maxdepth 2 | sed 's|[^/]*/| |g'
}

# Command: project-stats
# Shows project statistics
project-stats() {
    echo "## Project Statistics"
    echo ""
    echo "### File Counts by Type"
    find . -type f -not -path "./node_modules/*" -not -path "./.git/*" | sed 's/.*\.//' | sort | uniq -c | sort -rn | head -20
    echo ""
    echo "### Total Lines of Code"
    find . -type f \( -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.java" -o -name "*.go" \) -not -path "./node_modules/*" -not -path "./.git/*" | xargs wc -l 2>/dev/null | tail -1
    echo ""
    echo "### Largest Files"
    find . -type f -not -path "./node_modules/*" -not -path "./.git/*" -exec du -h {} \; | sort -rh | head -10
}

# Command: dependency-check
# Checks for outdated dependencies
dependency-check() {
    if [ -f "package.json" ]; then
        echo "## Node.js Dependencies"
        npm outdated 2>/dev/null || echo "No outdated packages or npm not available"
    elif [ -f "requirements.txt" ]; then
        echo "## Python Dependencies"
        pip list --outdated 2>/dev/null || echo "pip not available"
    elif [ -f "go.mod" ]; then
        echo "## Go Dependencies"
        go list -u -m all 2>/dev/null || echo "go not available"
    else
        echo "No supported dependency files found"
    fi
}
