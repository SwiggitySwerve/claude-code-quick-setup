# Skill: Test Generator

## Description
Automatically generates comprehensive unit tests for code files, covering various scenarios and edge cases.

## When to Use
- When writing new code that needs tests
- When code lacks test coverage
- When implementing TDD (Test Driven Development)
- When asked to "add tests" or "test this"

## Coverage Goals

1. **Happy Path Tests**
   - Normal operation scenarios
   - Expected inputs producing expected outputs
   - Common use cases

2. **Edge Cases**
   - Boundary values (0, -1, empty strings, null)
   - Min/max values
   - Empty collections
   - Single item collections

3. **Error Conditions**
   - Invalid inputs
   - Missing required parameters
   - Network failures
   - File system errors

4. **Integration Scenarios**
   - Multiple functions working together
   - State changes
   - Side effects

## Test Generation Strategy

### For Functions
1. Identify all possible input combinations
2. Determine expected outputs for each
3. Mock external dependencies
4. Test error handling
5. Verify side effects

### For Classes
1. Test each method independently
2. Test state management
3. Test initialization
4. Test method interactions
5. Test inheritance/overrides

### For APIs
1. Test all endpoints
2. Test authentication/authorization
3. Test request validation
4. Test response formats
5. Test error responses

## Implementation by Language

### JavaScript/TypeScript (Jest)
```javascript
describe('functionName', () => {
  it('should handle normal case', () => {
    const result = functionName('valid input');
    expect(result).toBe('expected output');
  });

  it('should handle edge cases', () => {
    expect(functionName('')).toBe('default');
    expect(functionName(null)).toThrow();
  });

  it('should handle errors', async () => {
    await expect(functionName('invalid')).rejects.toThrow(Error);
  });
});
```

### Python (pytest)
```python
def test_function_normal_case():
    result = function_name("valid input")
    assert result == "expected output"

def test_function_edge_cases():
    assert function_name("") == "default"
    with pytest.raises(ValueError):
        function_name(None)

@pytest.mark.asyncio
async def test_function_async():
    result = await async_function()
    assert result is not None
```

### Go
```go
func TestFunction(t *testing.T) {
    tests := []struct {
        name    string
        input   string
        want    string
        wantErr bool
    }{
        {"normal", "valid", "expected", false},
        {"empty", "", "default", false},
        {"error", "invalid", "", true},
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            got, err := Function(tt.input)
            if (err != nil) != tt.wantErr {
                t.Errorf("error = %v, wantErr %v", err, tt.wantErr)
                return
            }
            if got != tt.want {
                t.Errorf("Function() = %v, want %v", got, tt.want)
            }
        })
    }
}
```

### Rust
```rust
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_normal_case() {
        assert_eq!(function("valid"), "expected");
    }

    #[test]
    fn test_edge_cases() {
        assert_eq!(function(""), "default");
    }

    #[test]
    #[should_panic(expected = "invalid input")]
    fn test_panic() {
        function("invalid");
    }
}
```

## Mocking Strategy

1. **Identify external dependencies**
   - Database calls
   - HTTP requests
   - File system operations
   - Time/date functions

2. **Create mocks/stubs**
   - Return predictable values
   - Simulate error conditions
   - Track invocations

3. **Verify interactions**
   - Check mock was called
   - Verify call parameters
   - Check call count

## Best Practices

1. **Arrange-Act-Assert Pattern**
   ```javascript
   // Arrange
   const input = 'test';
   const expected = 'result';

   // Act
   const result = function(input);

   // Assert
   expect(result).toBe(expected);
   ```

2. **Descriptive Test Names**
   - "should return user when valid ID provided"
   - "should throw error when user not found"

3. **Independent Tests**
   - Each test should work in isolation
   - No dependencies on test execution order
   - Clean up after each test

4. **Fast Tests**
   - Mock slow operations
   - Avoid unnecessary setup
   - Use in-memory databases when possible

## Example Usage

User: "Generate tests for the UserService class"

Claude would:
1. Analyze UserService class
2. Identify all public methods
3. Determine test cases for each method
4. Generate comprehensive test file
5. Include setup/teardown code
6. Add mocks for dependencies
