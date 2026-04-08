---
description: Adversarial self-review of recent changes before declaring a task done
---

# /critique Workflow

## When to Use
- At the end of every feature implementation
- When the user types `/critique`
- After fixing a bug (check for similar issues elsewhere)

## Steps

### Phase 1: Identify Changes
1. Run `git diff --stat` to see modified files.
2. Note each file path and approximate change size.

### Phase 2: Structure Check
For each modified file:
3. Check line count. Flag anything over 300 lines — propose a split.
4. Check if page files contain state or fetch calls (they shouldn't).
5. Check if components call APIs directly (use hooks instead).
6. Look for duplicated patterns across files.
7. Flag `any` TypeScript casts that should have proper types.

### Phase 3: Failure Mode Audit
For each new/modified async operation or user input handler:
8. **Network failure** — Is there error handling with user-visible feedback?
9. **Loading state** — Does the UI show a loading indicator?
10. **Error state** — Is there an error message with retry option?
11. **Empty state** — What shows when there's no data?
12. **Input validation** — Validated on client? Validated again on server?
13. **Race condition** — Can the user trigger this twice? Is the button disabled?
14. **File size** — If handling uploads, are type and size limits enforced?

### Phase 4: Security Quick Scan
15. No API keys or secrets in client-side code.
16. API routes check authentication.
17. User inputs sanitized before rendering or storage.

### Phase 5: Report
18. Summarize findings:
    - **Passes:** Correctly handled items
    - **Warnings:** Non-critical improvements
    - **Blockers:** Must fix before task is complete
19. Fix all blockers immediately.
20. Note warnings for follow-up.

### Phase 6: Learn
21. If any issue is a **recurring pattern** (not a one-off), append to AGENTS.md `LESSONS LEARNED`:
    ```
    - **[date] Issue:** Description -> **Fix:** What to do instead
    ```
