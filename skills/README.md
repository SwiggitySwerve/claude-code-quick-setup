# Skills

This directory contains reusable skill definitions for Claude Code.

## Usage

Skills can be loaded into your Claude Code configuration to extend functionality.

## Categories

### [Official Anthropic Skills](./official/)
Official skills from the [Anthropic skills repository](https://github.com/anthropics/skills).

These are production-ready skills maintained by the Anthropic team:
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

### [Custom Community Skills](./)
Community-created skills for common development workflows.

### Documentation Skills

#### [Document Code](./document-code.md)
Automatically generates comprehensive documentation for code files including function descriptions, parameter details, and usage examples.

**When to use:**
- Adding new functions or classes
- Documentation is missing or outdated
- Before committing code changes

**Features:**
- Supports JSDoc, PyDoc, JavaDoc styles
- Generates parameter documentation
- Adds usage examples
- Documents return types and errors

### Code Quality Skills

#### [Refactor Code](./refactor-code.md)
Improves code quality, readability, and maintainability while preserving functionality.

**When to use:**
- Code is difficult to understand
- Code duplication exists
- Performance improvements needed
- Best practice violations

**Features:**
- Extract functions/methods
- Reduce complexity
- Improve naming
- Apply SOLID principles
- Performance optimization

#### [Test Generator](./test-generator.md)
Automatically generates comprehensive unit tests for code files.

**When to use:**
- Writing new code that needs tests
- Code lacks test coverage
- Implementing TDD

**Features:**
- Happy path tests
- Edge case coverage
- Error condition tests
- Multi-language support (Jest, pytest, Go, Rust)
- Mock generation

### Development Skills

#### [Debug Helper](./debug-helper.md)
Systematically investigates and resolves bugs, errors, and unexpected behavior.

**When to use:**
- Encountering errors or exceptions
- Code doesn't behave as expected
- Troubleshooting production issues

**Features:**
- Systematic debugging methodology
- Error pattern analysis
- Debugging tools and commands
- Common debugging patterns

#### [Optimization](./optimization.md)
Analyzes and optimizes code for better performance and reduced memory usage.

**When to use:**
- Code is slow or unresponsive
- Memory usage is high
- Scaling to larger datasets

**Features:**
- Algorithmic optimization
- I/O optimization
- Memory optimization
- Caching strategies
- Concurrency optimization
- Profiling tools

#### [API Integration](./api-integration.md)
Handles integration with external APIs, including authentication, request handling, and error management.

**When to use:**
- Adding new API integrations
- Fixing API-related bugs
- Improving error handling
- Implementing retry logic

**Features:**
- Multiple authentication methods
- Comprehensive error handling
- Retry logic with backoff
- Rate limiting
- Request caching
- Pagination handling

## How to Use Skills

In Claude Code CLI, reference a skill by name:

```
"Use the document-code skill on src/utils.js"
"Apply refactor-code to improve this function"
"Generate tests using the test-generator skill"
"Help me debug using the debug-helper skill"
"Optimize this code for better performance"
"Integrate with the GitHub API using api-integration"
```

## Creating Custom Skills

To create a custom skill:

1. Create a new markdown file in this directory
2. Follow the skill template structure:
   - Description
   - When to use
   - Implementation details
   - Examples
3. Add clear usage instructions
4. Include code examples and patterns
