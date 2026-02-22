Run the full test suite, identify any failures, and attempt to fix them automatically.

Steps to follow:

1. Detect the test runner used in this project:
   - Check for `package.json` → `scripts.test` for Node-based projects.
   - Check for `pytest.ini`, `pyproject.toml`, or `setup.cfg` for Python projects.
   - If no test configuration is found, report that no test suite was detected and stop.

2. Run the tests:
   ```
   # Node.js
   npm test

   # Python
   python -m pytest
   ```

3. Parse the output:
   - Identify each failing test by name and file.
   - Note the error message and stack trace for each failure.

4. For each failing test:
   - Read the relevant source file(s) and the test file.
   - Determine whether the fix belongs in the **source code** or in an **outdated/incorrect test**.
   - Apply the fix, preferring source-code fixes unless the test expectation is clearly wrong.
   - Re-run the specific failing test after each fix to confirm it passes before moving on.

5. Once all tests pass, run the full suite one final time to confirm no regressions.

6. Summarise:
   - Total tests run.
   - How many were failing at the start.
   - What was fixed and where.
   - Any tests that could not be fixed (with the reason).
