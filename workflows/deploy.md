---
description: Commit changes and push to remote (triggers CI/CD if configured)
---

# /deploy Workflow

## Steps
1. Run `git status` to review all changes.
2. Run `git diff` to review what changed and why.
3. Stage relevant files (avoid secrets, large binaries, generated files).
4. Write a descriptive commit message (imperative mood, explain why).
5. Commit the changes.
6. Push to the remote branch.
7. Confirm success and note any CI/CD pipeline triggered.
