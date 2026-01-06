# Skill: Document Code

## Description
Automatically generates comprehensive documentation for code files including function descriptions, parameter details, and usage examples.

## When to Use
- When adding new functions or classes
- When documentation is missing or outdated
- Before committing code changes
- When requested to "document this code"

## Parameters
- `target_file`: The file to document (optional, defaults to current context)
- `style`: Documentation style (javadoc, jsdoc, pydoc, etc.)

## Implementation

When this skill is invoked:

1. **Analyze the code structure**
   - Identify all functions, classes, and methods
   - Extract parameter names and types
   - Determine return types
   - Identify side effects

2. **Generate documentation**
   - Add descriptive comments for each function
   - Document all parameters with types and descriptions
   - Document return values
   - Add usage examples where appropriate
   - Include error conditions and edge cases

3. **Apply the appropriate style**
   - **JSDoc** (JavaScript/TypeScript):
     ```javascript
     /**
      * Brief description
      * @param {Type} param - Description
      * @returns {Type} Description
      */
     ```

   - **PyDoc** (Python):
     ```python
     """
     Brief description.

     Args:
         param (type): Description

     Returns:
         type: Description

     Raises:
         ErrorType: Description
     """
     ```

   - **JavaDoc** (Java):
     ```java
     /**
      * Brief description.
      *
      * @param param Description
      * @return Description
      * @throws ErrorType Description
      */
     ```

4. **Review and validate**
   - Ensure all public APIs are documented
   - Check for consistency in style
   - Verify accuracy of type information
   - Add examples for complex functions

## Example Usage

User: "Use document-code skill on src/utils.js"

Claude would:
1. Read src/utils.js
2. Identify all functions
3. Add JSDoc comments to each function
4. Provide a summary of changes made

## Notes
- Preserves existing code structure
- Only adds comments, doesn't change logic
- Follows existing documentation style if present
- Respects any @internal or @private markers
