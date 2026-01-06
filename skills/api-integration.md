# Skill: API Integration

## Description
Handles integration with external APIs, including authentication, request handling, error management, and response processing.

## When to Use
- When adding new API integrations
- When fixing API-related bugs
- When improving error handling
- When implementing retry logic

## API Integration Best Practices

### 1. Authentication Handling

#### Bearer Token
```javascript
class APIClient {
  constructor(token) {
    this.token = token;
    this.baseURL = 'https://api.example.com';
  }

  getHeaders() {
    return {
      'Authorization': `Bearer ${this.token}`,
      'Content-Type': 'application/json',
      'User-Agent': 'MyApp/1.0'
    };
  }

  async request(endpoint, options = {}) {
    const url = `${this.baseURL}${endpoint}`;
    const response = await fetch(url, {
      ...options,
      headers: {
        ...this.getHeaders(),
        ...options.headers
      }
    });
    return this.handleResponse(response);
  }
}
```

#### API Key
```javascript
class APIClient {
  constructor(apiKey) {
    this.apiKey = apiKey;
  }

  getHeaders() {
    return {
      'X-API-Key': this.apiKey,
      'Content-Type': 'application/json'
    };
  }
}
```

#### OAuth2
```javascript
class OAuth2Client {
  constructor(clientId, clientSecret) {
    this.clientId = clientId;
    this.clientSecret = clientSecret;
    this.accessToken = null;
    this.refreshToken = null;
  }

  async authenticate() {
    const response = await fetch('https://auth.example.com/oauth/token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        grant_type: 'client_credentials',
        client_id: this.clientId,
        client_secret: this.clientSecret
      })
    });

    const data = await response.json();
    this.accessToken = data.access_token;
    this.refreshToken = data.refresh_token;
    this.tokenExpiresAt = Date.now() + (data.expires_in * 1000);
  }

  async getAccessToken() {
    if (!this.accessToken || Date.now() >= this.tokenExpiresAt) {
      await this.authenticate();
    }
    return this.accessToken;
  }
}
```

### 2. Error Handling

#### Comprehensive Error Handler
```javascript
class APIError extends Error {
  constructor(message, status, data) {
    super(message);
    this.name = 'APIError';
    this.status = status;
    this.data = data;
  }
}

async function handleResponse(response) {
  const contentType = response.headers.get('content-type');
  const isJSON = contentType?.includes('application/json');

  const data = isJSON ? await response.json() : await response.text();

  if (!response.ok) {
    throw new APIError(
      data.message || response.statusText,
      response.status,
      data
    );
  }

  return data;
}

// Usage
try {
  const result = await apiClient.get('/users');
} catch (error) {
  if (error instanceof APIError) {
    if (error.status === 401) {
      console.error('Authentication failed - refresh token');
    } else if (error.status === 429) {
      console.error('Rate limited - retry later');
    } else if (error.status >= 500) {
      console.error('Server error - try again');
    }
  }
}
```

### 3. Retry Logic

#### Exponential Backoff
```javascript
async function fetchWithRetry(url, options = {}, maxRetries = 3) {
  for (let attempt = 0; attempt < maxRetries; attempt++) {
    try {
      const response = await fetch(url, options);
      const data = await handleResponse(response);
      return data;
    } catch (error) {
      const isLastAttempt = attempt === maxRetries - 1;
      const isRetryable = error.status >= 500 || error.status === 429;

      if (isLastAttempt || !isRetryable) {
        throw error;
      }

      // Exponential backoff: 1s, 2s, 4s
      const delay = Math.pow(2, attempt) * 1000;
      await sleep(delay);
    }
  }
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
```

#### Retry with Jitter
```javascript
async function fetchWithJitter(url, options = {}, maxRetries = 3) {
  for (let attempt = 0; attempt < maxRetries; attempt++) {
    try {
      const response = await fetch(url, options);
      return await handleResponse(response);
    } catch (error) {
      if (attempt === maxRetries - 1) throw error;

      // Exponential backoff with random jitter
      const baseDelay = Math.pow(2, attempt) * 1000;
      const jitter = Math.random() * 1000;
      await sleep(baseDelay + jitter);
    }
  }
}
```

### 4. Rate Limiting

#### Token Bucket
```javascript
class RateLimiter {
  constructor(rate, period) {
    this.rate = rate; // requests per period
    this.period = period; // milliseconds
    this.tokens = rate;
    this.lastRefill = Date.now();
  }

  async waitForToken() {
    const now = Date.now();
    const elapsed = now - this.lastRefill;

    // Refill tokens
    this.tokens = Math.min(
      this.rate,
      this.tokens + (elapsed / this.period) * this.rate
    );
    this.lastRefill = now;

    if (this.tokens < 1) {
      const waitTime = ((1 - this.tokens) * this.period) / this.rate;
      await sleep(waitTime);
      this.tokens = 0;
    } else {
      this.tokens -= 1;
    }
  }
}

// Usage
const limiter = new RateLimiter(10, 1000); // 10 requests per second

async function rateLimitedRequest(url) {
  await limiter.waitForToken();
  return fetch(url);
}
```

### 5. Request Caching

#### Simple Cache
```javascript
class Cache {
  constructor(ttl = 60000) {
    this.cache = new Map();
    this.ttl = ttl;
  }

  get(key) {
    const item = this.cache.get(key);
    if (!item) return null;

    if (Date.now() > item.expires) {
      this.cache.delete(key);
      return null;
    }

    return item.data;
  }

  set(key, data) {
    this.cache.set(key, {
      data,
      expires: Date.now() + this.ttl
    });
  }
}

class CachedAPIClient {
  constructor(baseURL) {
    this.baseURL = baseURL;
    this.cache = new Cache(60000); // 1 minute cache
  }

  async get(endpoint) {
    const url = `${this.baseURL}${endpoint}`;

    // Check cache first
    const cached = this.cache.get(url);
    if (cached) return cached;

    // Fetch and cache
    const response = await fetch(url);
    const data = await handleResponse(response);
    this.cache.set(url, data);

    return data;
  }
}
```

### 6. Request/Response Validation

#### Schema Validation
```javascript
// Using Zod for validation
import { z } from 'zod';

const UserSchema = z.object({
  id: z.number(),
  name: z.string(),
  email: z.string().email(),
  created_at: z.string().datetime()
});

async function getUser(id) {
  const response = await fetch(`/api/users/${id}`);
  const data = await response.json();

  // Validate response
  const validatedUser = UserSchema.parse(data);
  return validatedUser;
}
```

### 7. Pagination

#### Link Header Pagination
```javascript
async function fetchAllPages(url) {
  const results = [];
  let nextUrl = url;

  while (nextUrl) {
    const response = await fetch(nextUrl);

    if (!response.ok) {
      throw new APIError('Failed to fetch', response.status);
    }

    const data = await response.json();
    results.push(...data);

    // Check for next page
    const linkHeader = response.headers.get('Link');
    nextUrl = parseLinkHeader(linkHeader)?.next;
  }

  return results;
}

function parseLinkHeader(header) {
  if (!header) return {};

  const links = {};
  header.split(',').forEach(link => {
    const match = link.match(/<([^>]+)>; rel="([^"]+)"/);
    if (match) {
      links[match[2]] = match[1];
    }
  });

  return links;
}
```

## Integration Checklist

- [ ] Authentication properly configured?
- [ ] Error handling comprehensive?
- [ ] Retry logic implemented for transient failures?
- [ ] Rate limiting respected?
- [ ] Sensitive data not logged?
- [ ] Responses validated?
- [ ] Timeouts configured?
- [ ] Pagination handled?
- [ ] Webhooks verified (if applicable)?
- [ ] API version specified?

## Security Considerations

1. **Never log sensitive data**
   ```javascript
   console.log('Request:', { ...options, headers: undefined }); // Strip headers
   ```

2. **Validate URLs**
   ```javascript
   function isValidURL(url) {
     try {
       new URL(url);
       return url.startsWith('https:');
     } catch {
       return false;
     }
   }
   ```

3. **Use HTTPS only**
   ```javascript
   if (!url.startsWith('https://')) {
     throw new Error('Only HTTPS URLs are allowed');
   }
   ```

4. **Sanitize error messages**
   ```javascript
   // Don't leak internal details to clients
   throw new APIError('Request failed', 500);
   ```

## Example Usage

User: "Integrate with the GitHub API to fetch user repositories"

API Integration skill would:

1. **Set up authentication**
   - Configure OAuth2 or personal access token
   - Set appropriate headers

2. **Implement error handling**
   - Handle rate limits
   - Handle authentication failures
   - Handle network errors

3. **Add retry logic**
   - Implement exponential backoff
   - Respect Retry-After header

4. **Handle pagination**
   - Process all pages of results
   - Handle Link header

5. **Add caching**
   - Cache responses to reduce API calls
   - Respect cache headers

6. **Write tests**
   - Mock API responses
   - Test error scenarios
   - Validate request format
