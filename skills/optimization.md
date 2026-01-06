# Skill: Code Optimization

## Description
Analyzes and optimizes code for better performance, reduced memory usage, and improved efficiency.

## When to Use
- When code is slow or unresponsive
- When memory usage is high
- When scaling to larger datasets
- When asked to "optimize" or "improve performance"

## Optimization Categories

### 1. Algorithmic Optimization

#### Time Complexity
```javascript
// O(n²) - Bad for large datasets
function findDuplicates(arr) {
  const duplicates = [];
  for (let i = 0; i < arr.length; i++) {
    for (let j = i + 1; j < arr.length; j++) {
      if (arr[i] === arr[j]) {
        duplicates.push(arr[i]);
      }
    }
  }
  return duplicates;
}

// O(n) - Much better
function findDuplicates(arr) {
  const seen = new Set();
  const duplicates = new Set();
  for (const item of arr) {
    if (seen.has(item)) {
      duplicates.add(item);
    } else {
      seen.add(item);
    }
  }
  return Array.from(duplicates);
}
```

#### Space Complexity
```javascript
// Unnecessary array creation
function sum(arr) {
  const newArr = arr.map(x => x * 1); // No-op!
  return newArr.reduce((a, b) => a + b, 0);
}

// Direct processing
function sum(arr) {
  return arr.reduce((a, b) => a + b, 0);
}
```

### 2. I/O Optimization

#### Database Queries
```javascript
// N+1 query problem
async function getUsersWithPosts() {
  const users = await db.users.findAll();
  for (const user of users) {
    user.posts = await db.posts.findByUser(user.id);
  }
  return users;
}

// Single query with join
async function getUsersWithPosts() {
  return await db.users.findAll({
    include: ['posts']
  });
}
```

#### File Operations
```javascript
// Multiple file reads - Slow
async function processFiles(files) {
  for (const file of files) {
    const content = await fs.readFile(file);
    // process content
  }
}

// Parallel reads - Faster
async function processFiles(files) {
  await Promise.all(files.map(async file => {
    const content = await fs.readFile(file);
    // process content
  }));
}
```

### 3. Memory Optimization

#### Stream Processing
```javascript
// Loads entire file into memory
function processLargeFile(filePath) {
  const content = fs.readFileSync(filePath); // Can be GBs!
  return content.split('\n').filter(line => line.includes('keyword'));
}

// Streams data - Memory efficient
function processLargeFile(filePath) {
  return fs.createReadStream(filePath)
    .pipe(split())
    .filter(line => line.includes('keyword'));
}
```

#### Object Reuse
```javascript
// Creates new objects every time
function createPoint(x, y) {
  return { x, y };
}

// Reuses objects (when appropriate)
class PointPool {
  constructor() {
    this.pool = [];
  }
  get(x, y) {
    const point = this.pool.pop() || { x: 0, y: 0 };
    point.x = x;
    point.y = y;
    return point;
  }
  release(point) {
    this.pool.push(point);
  }
}
```

### 4. Caching Strategies

#### Memoization
```javascript
// Expensive computation runs every time
function fibonacci(n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// Memoized version
const memo = {};
function fibonacci(n) {
  if (n <= 1) return n;
  if (memo[n]) return memo[n];
  memo[n] = fibonacci(n - 1) + fibonacci(n - 2);
  return memo[n];
}

// Or use a memoization decorator
const memoizedFib = memoize(fibonacci);
```

#### LRU Cache
```javascript
const LRU = require('lru-cache');
const cache = new LRU({ max: 500, ttl: 1000 * 60 * 5 });

async function getUser(id) {
  if (cache.has(id)) {
    return cache.get(id);
  }
  const user = await db.findUser(id);
  cache.set(id, user);
  return user;
}
```

### 5. Concurrency Optimization

#### Parallel Processing
```javascript
// Sequential processing
async function processItems(items) {
  const results = [];
  for (const item of items) {
    const result = await processItem(item);
    results.push(result);
  }
  return results;
}

// Parallel processing with limit
async function processItems(items) {
  const chunks = chunk(items, 10); // Process 10 at a time
  const results = [];
  for (const chunk of chunks) {
    const chunkResults = await Promise.all(
      chunk.map(item => processItem(item))
    );
    results.push(...chunkResults);
  }
  return results.flat();
}
```

#### Worker Threads
```javascript
// CPU-intensive task on main thread
function heavyComputation(data) {
  // Blocks event loop!
  return data.map(/* complex math */);
}

// Offload to worker thread
const { Worker } = require('worker_threads');

function heavyComputation(data) {
  return new Promise((resolve, reject) => {
    const worker = new Worker('./computation-worker.js', {
      workerData: data
    });
    worker.on('message', resolve);
    worker.on('error', reject);
  });
}
```

## Optimization Checklist

### Performance
- [ ] Algorithm time complexity optimal?
- [ ] Unnecessary loops eliminated?
- [ ] Expensive operations cached?
- [ ] I/O operations minimized?
- [ ] Database queries optimized?
- [ ] Indexes properly configured?

### Memory
- [ ] Large datasets streamed?
- [ ] Unnecessary copies eliminated?
- [ ] Objects reused where possible?
- [ ] Memory leaks fixed?
- [ ] Caches bounded in size?
- [ ] Buffers properly sized?

### Concurrency
- [ ] Parallel operations used?
- [ ] Thread pool configured?
- [ ] Connection pooling used?
- [ ] Race conditions handled?
- [ ] Deadlocks avoided?

## Profiling Tools

### JavaScript/Node.js
```bash
# CPU profiling
node --prof app.js
node --prof-process isolate-*.log > profile.txt

# Memory profiling
node --heap-prof app.js

# Clinic.js suite
npm install -g clinic
clinic doctor -- node app.js
clinic flame -- node app.js
```

### Python
```bash
# cProfile
python -m cProfile -o profile.stats script.py
python -m pstats profile.stats

# Memory profiler
pip install memory_profiler
python -m memory_profiler script.py

# Line profiler
pip install line_profiler
kernprof -l -v script.py
```

## Optimization Strategy

1. **Measure first**
   ```bash
   # Before optimization
   time node app.js
   # or
   console.time('operation');
   // code
   console.timeEnd('operation');
   ```

2. **Identify bottlenecks**
   - Use profiling tools
   - Find hot paths
   - Measure before/after

3. **Optimize iteratively**
   - Make one change at a time
   - Measure impact
   - Keep what works

4. **Consider trade-offs**
   - Performance vs readability
   - Memory vs speed
   - Development time vs optimization benefit

5. **Test thoroughly**
   - Ensure correctness maintained
   - Check for regressions
   - Test with realistic data

## Example Usage

User: "Optimize this slow data processing function"

Optimization skill would:

1. **Analyze current code**
   - Identify time complexity
   - Find expensive operations
   - Measure performance

2. **Propose optimizations**
   - Reduce nested loops
   - Add caching
   - Use appropriate data structures
   - Parallelize where possible

3. **Implement changes**
   - Apply optimizations
   - Add benchmarks
   - Document trade-offs

4. **Verify improvement**
   - Compare before/after metrics
   - Test with real data
   - Ensure correctness
