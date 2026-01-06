# Skill: Refactor Code

## Description
Improves code quality, readability, and maintainability while preserving functionality.

## When to Use
- When code is difficult to understand
- When there's code duplication
- When code violates best practices
- When improving performance without changing behavior
- When asked to "clean up" or "improve" code

## Refactoring Principles

1. **Improve Readability**
   - Use meaningful variable and function names
   - Reduce nesting levels
   - Keep functions focused and small
   - Add explanatory comments for complex logic

2. **Reduce Complexity**
   - Extract repeated code into functions
   - Simplify conditional logic
   - Use early returns
   - Break down large functions

3. **Enhance Maintainability**
   - Follow DRY (Don't Repeat Yourself)
   - Apply SOLID principles
   - Improve type safety
   - Separate concerns appropriately

4. **Performance Optimization**
   - Eliminate unnecessary computations
   - Use appropriate data structures
   - Optimize loops and algorithms
   - Reduce memory allocations

## Implementation Steps

1. **Analyze current code**
   - Identify code smells
   - Detect anti-patterns
   - Find duplication
   - Measure complexity metrics

2. **Plan refactoring**
   - List specific improvements
   - Identify potential risks
   - Determine test coverage needs
   - Prioritize changes

3. **Apply refactoring**
   - Make small, incremental changes
   - Run tests after each change
   - Preserve functionality
   - Update documentation

4. **Verify changes**
   - Run existing tests
   - Check behavior matches original
   - Review performance improvements
   - Validate no regressions

## Common Refactorings

### Extract Function
```javascript
// Before
function processUser(user) {
  if (user && user.age >= 18 && user.country === 'US') {
    // complex logic
  }
}

// After
function processUser(user) {
  if (isEligibleUser(user)) {
    // complex logic
  }
}

function isEligibleUser(user) {
  return user && user.age >= 18 && user.country === 'US';
}
```

### Simplify Conditionals
```python
# Before
if x == True:
    return True
else:
    return False

# After
return bool(x)
```

### Reduce Nesting
```javascript
// Before
function process(data) {
  if (data) {
    if (data.items) {
      if (data.items.length > 0) {
        // process items
      }
    }
  }
}

// After
function process(data) {
  if (!data || !data.items || data.items.length === 0) {
    return;
  }
  // process items
}
```

## Safety Checks

- Always ensure tests pass
- Never change functionality
- Commit before refactoring
- Use version control
- Review diff carefully

## Example Usage

User: "Refactor the authenticate function to be more readable"

Claude would:
1. Read the function
2. Identify complexity issues
3. Propose specific improvements
4. Apply refactoring step by step
5. Verify functionality preserved
