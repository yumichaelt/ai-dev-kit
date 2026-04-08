---
description: Document the current session's decisions and changes in a devlog
---

# /devlog Workflow

## Usage
- `/devlog` — Log the current session
- `/devlog review` — Show recent entries
- `/devlog search <term>` — Find a past decision

## Steps
1. Review what was accomplished in this session (git diff, conversation context).
2. Write a devlog entry with:
   - **Date:** Today's date
   - **Summary:** What was done (1-2 sentences)
   - **Decisions:** Key decisions made and why
   - **Changes:** Files created/modified (brief list)
   - **Issues:** Problems encountered and how they were resolved
   - **Next:** What to work on next
3. Append the entry to `DEVLOG.md` in the project root.
4. If any decision represents a reusable lesson, also add it to AGENTS.md's LESSONS LEARNED section.
