# Skill: Debug Helper

## Description
Systematically investigates and resolves bugs, errors, and unexpected behavior in code.

## When to Use
- When encountering errors or exceptions
- When code doesn't behave as expected
- When troubleshooting production issues
- When asked to "debug this" or "fix this bug"

## Debugging Methodology

### 1. Gather Information
```bash
# Check error logs
tail -f /var/log/app.log

# Check recent changes
git log --oneline -10

# Reproduce the issue
# Document steps to reproduce
```

### 2. Analyze the Problem
- Identify error messages and stack traces
- Determine when the issue started occurring
- Find what changed recently
- Check system state and dependencies

### 3. Form Hypothesis
- Based on symptoms, form likely causes
- Check common issues first:
  - Null/undefined values
  - Race conditions
  - Incorrect data types
  - Missing error handling
  - Configuration issues

### 4. Test Hypothesis
```javascript
// Add logging
console.log('Variable value:', variable);
console.log('Type:', typeof variable);

// Use debugger
debugger;

// Add assertions
console.assert(condition, 'Assertion failed');

// Check environment
console.log('Node version:', process.version);
console.log('Env vars:', Object.keys(process.env));
```

### 5. Implement Fix
- Make minimal changes to fix the issue
- Add error handling to prevent future issues
- Write tests to catch regressions
- Document the fix

### 6. Verify Solution
- Reproduce the original issue (should no longer occur)
- Run all tests
- Check for side effects
- Test edge cases

## Common Debugging Patterns

### Pattern 1: Divide and Conquer
```javascript
// When you don't know where the error is
function complexOperation() {
  console.log('Step 1');
  step1();

  console.log('Step 2');
  step2();

  console.log('Step 3');
  step3(); // Error happens here
}
```

### Pattern 2: Binary Search
```javascript
// Comment out half the code to isolate issue
function largeFunction() {
  // First half
  /* ... */

  // Second half - comment out to see if error persists
  // If error stops, issue is in this half
}
```

### Pattern 3: Minimal Reproduction
```javascript
// Strip down to essential case that shows the bug
function minimalReproduction() {
  const input = 'problematic input';
  const result = buggyFunction(input);
  // This consistently reproduces the bug
}
```

## Error Type Analysis

### Null/Undefined Errors
```javascript
// Bad
const user = getUser(id);
console.log(user.name); // Crashes if user is null

// Good
const user = getUser(id);
if (!user) {
  throw new Error(`User not found: ${id}`);
}
console.log(user.name);

// Even better (with TypeScript)
const user = getUser(id);
console.log(user?.name ?? 'Unknown');
```

### Async Errors
```javascript
// Problem: Unhandled promise rejection
async function fetchData() {
  const response = await fetch(url);
  const data = await response.json();
  return data;
}

// Solution: Proper error handling
async function fetchData() {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch data:', error);
    throw error; // Re-throw for caller to handle
  }
}
```

### Race Conditions
```javascript
// Problem: Dependent async operations
function loadUserData(userId) {
  const user = fetchUser(userId);
  const posts = fetchPosts(userId);
  // posts might finish before user!
  displayPosts(posts, user.name);
}

// Solution: Use Promise.all
async function loadUserData(userId) {
  const [user, posts] = await Promise.all([
    fetchUser(userId),
    fetchPosts(userId)
  ]);
  displayPosts(posts, user.name);
}
```

## Debugging Checklist

- [ ] Error message and stack trace understood?
- [ ] Can reproduce the issue consistently?
- [ ] Inputs and outputs documented?
- [ ] Expected vs actual behavior clear?
- [ ] Recent changes considered?
- [ ] Dependencies checked?
- [ ] Environment variables correct?
- [ ] Logs examined?
- [ ] Network requests successful?
- [ ] Database queries working?
- [ ] File permissions correct?
- [ ] Memory/CPU usage normal?

## Tools and Commands

### JavaScript/Node.js
```bash
# Run with debugger
node --inspect app.js

# Check heap dump
node --heap-prof app.js

# Trace warnings
node --trace-warnings app.js
```

### Python
```bash
# Run with debugger
python -m pdb script.py

# Profile code
python -m cProfile script.py

# Trace execution
python -m trace --trace script.py
```

### General
```bash
# Monitor file changes
tail -f file.log

# Check process status
ps aux | grep app-name

# Check open files
lsof -p PID

# Network debugging
netstat -tulpn
tcpdump -i any port 3000
```

## Example Usage

User: "The authenticate function is failing with 'Cannot read property token'"

Debug helper would:

1. **Examine the error**
   - Read the authenticate function
   - Find line causing error
   - Identify what's undefined

2. **Add defensive checks**
   ```javascript
   function authenticate(user) {
     if (!user) {
       throw new Error('User is required');
     }
     if (!user.credentials) {
       throw new Error('User credentials missing');
     }
     const token = user.credentials.token; // Now safe
     // ...
   }
   ```

3. **Add logging for future debugging**
   ```javascript
   console.log('Authenticating user:', user?.id);
   ```

4. **Write test to catch this**
   ```javascript
   test('authenticate throws on null user', () => {
     expect(() => authenticate(null)).toThrow();
   });
   ```

5. **Verify fix works**
   - Run the test
   - Test with valid user
   - Test with missing credentials
