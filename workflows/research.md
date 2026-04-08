---
description: Web research workflow to find gaps, blind spots, and new ideas for the AI dev kit
---

# /research Workflow

## Purpose
Continuously improve the AI dev kit by researching what the community is building, identifying gaps in our approach, and incorporating the best ideas from others.

## When to Use
- Periodically (weekly or biweekly)
- When starting a new type of project and unsure if the kit covers it
- When you hit a problem the kit didn't prepare you for
- When the user types `/research`

## Steps

### Phase 1: Scan the Ecosystem
Search the web for recent developments in AI-assisted coding:

1. **GitHub trending:** Search for new repos related to:
   - "AGENTS.md" OR "CLAUDE.md" templates
   - AI coding methodology / workflow
   - Cursor rules / .cursorrules
   - AI codebase ergonomics
   - Claude Code skills / plugins

2. **Key repos to check for updates:**
   - [obra/superpowers](https://github.com/obra/superpowers) — new skills or methodology changes?
   - [agentsmd/agents.md](https://github.com/agentsmd/agents.md) — spec updates?
   - [PatrickJS/awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules) — new patterns?
   - [softaworks/agent-toolkit](https://github.com/softaworks/agent-toolkit) — new skills?
   - [yamadashy/repomix](https://github.com/yamadashy/repomix) — new features?

3. **Thought leadership:** Search for recent articles from:
   - Addy Osmani (AI coding workflows)
   - Martin Fowler (context engineering)
   - Simon Willison (practical LLM tooling)
   - Anthropic / OpenAI / Google engineering blogs
   - Hacker News top posts about AI coding

4. **Research papers:** Search for recent studies on:
   - AI code quality measurement
   - Context engineering effectiveness
   - Agent workflow optimization

### Phase 2: Gap Analysis
Compare findings against what our kit currently covers:

5. For each interesting finding, ask:
   - Does our AGENTS.md template address this?
   - Do we have a workflow for this?
   - Is this a gap we should fill?
   - Is this better than our current approach?

6. Categorize findings:
   - **Already covered** — we handle this (note if our approach is weaker)
   - **Gap** — we don't address this and should
   - **Enhancement** — we address this but could do it better
   - **Not relevant** — interesting but not applicable to our use case

### Phase 3: Update Recommendations
7. For each gap or enhancement, draft a concrete proposal:
   - What to change (specific file and section)
   - What to add (exact content or pattern)
   - Why (what problem does this solve, with source link)

8. Prioritize by impact:
   - **High:** Directly prevents bugs or saves significant time
   - **Medium:** Improves workflow or code quality
   - **Low:** Nice to have, no urgent need

### Phase 4: Apply Updates
9. Update `research/landscape.md` with new findings.
10. Update `research/gaps.md` with any new gaps identified.
11. Update `research/sources.md` with new repos/articles discovered.
12. For high-priority items, apply changes directly to templates/workflows.
13. For medium/low items, add to `research/gaps.md` as future work.

### Phase 5: Report
14. Summarize for the user:
    - What's new in the ecosystem
    - Gaps found in our kit
    - Changes made or proposed
    - Sources consulted

## Tips
- Focus on ideas, not tools. A good pattern in a Cursor rules file works just as well in AGENTS.md.
- Prioritize battle-tested approaches (used in production by real teams) over theoretical ones.
- When in doubt, check if obra/superpowers or similar large projects have solved the same problem.
- Don't add complexity for its own sake. The ETH Zurich study showed that bloated context files hurt performance.
