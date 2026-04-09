# Project Architecture Rules

> Drop this file into any project root. Customize the [PROJECT-SPECIFIC] sections.
> Delete sections that don't apply to your stack.

## [PROJECT-SPECIFIC] Overview
<!-- Replace with your project's one-liner -->
- **What:** [Brief description of what this app does]
- **Stack:** [e.g., Next.js App Router + Supabase + Vercel]
- **Styling:** [e.g., CSS Modules / Tailwind / styled-components]

## [PROJECT-SPECIFIC] Key Files
<!-- List the 5-10 most important files so the AI doesn't have to discover them -->
<!-- - `src/app/studio/page.tsx` — Main workspace -->
<!-- - `src/app/api/generate/route.ts` — Generation endpoint -->

## [PROJECT-SPECIFIC] Commands
- Dev: `npm run dev`
- Build: `npm run build`
- Test: `npm test`
- Lint: `npm run lint`

---

# Skill Usage (when superpowers is installed)

If the following skills are available in this environment, use them automatically:

## Always invoke before starting work
- **`brainstorming`** — Use BEFORE any creative work (new features, components, behavior changes). Explores intent and requirements before code is written.
- **`writing-plans`** — Use AFTER brainstorming when the task is multi-step. Produces an executable plan with verification checkpoints.

## Invoke during execution
- **`test-driven-development`** — Use when implementing any feature or bugfix. Red -> green -> refactor.
- **`systematic-debugging`** — Use whenever you hit a bug, test failure, or unexpected behavior. Do this BEFORE proposing fixes.
- **`subagent-driven-development`** — Use when executing a plan with independent tasks in the current session.
- **`dispatching-parallel-agents`** — Use when 2+ tasks are independent and can run in parallel.
- **`using-git-worktrees`** — Use when starting feature work that needs isolation from the current workspace.

## Invoke before declaring done
- **`verification-before-completion`** — Use BEFORE claiming work is complete, fixed, or passing. Run actual verification commands and confirm output. Evidence before assertions, always.
- **`requesting-code-review`** — Use when completing tasks or before merging. Verify work meets requirements.
- **`simplify`** — Use after implementation to review for reuse, quality, and efficiency. Fix issues found.

## Recommended plugins (wshobson/agents)
For production-quality review and auditing, use these Claude Code plugins (install once, available in all projects):
- **`comprehensive-review`** — Bundles `code-reviewer` + `security-auditor` + `architect-reviewer` (Opus tier). Use after completing any feature.
- **`security-scanning`** — OWASP-aware security audit. Use before deploying anything that touches user data.
- **`accessibility-compliance`** — WCAG checks. Use for any user-facing UI.
- **`unit-testing`** — Test scaffolding and coverage analysis.
- **`observability-monitoring`** — SLI/SLO, tracing, incident response. Use once you're live in production.

Install:
```
/plugin marketplace add wshobson/agents
/plugin install comprehensive-review@claude-code-workflows
```

## Custom workflows in this kit
- **`/research`** — Web research for new ideas and gaps in the kit itself (see `.agents/workflows/research.md`)
- **`/devlog`** — Document the session (see `.agents/workflows/devlog.md`)
- **`/deploy`** — Commit and push (see `.agents/workflows/deploy.md`)

> Note: A custom `/critique` workflow used to live here but was removed because `comprehensive-review` from wshobson/agents covers the same ground better.

## Model orchestration
Use Claude Code's native **`/model opusplan`** mode. This automatically uses Opus for plan mode (high-judgment work) and Sonnet for execution (writing code). Zero config required.

For finer control, define Claude Code subagents with `model: sonnet` in their frontmatter to delegate specific task types to Sonnet while the main Opus session handles planning and review. Anthropic's published research showed this pattern beats solo Opus by 90% on complex tasks.

---

# Structure Rules

## File Size Discipline
- Page/route files: Orchestration only. Target <150 lines.
- Components: One job per file. Target <250 lines.
- Hooks/composables: State + logic. Target <150 lines.
- API routes: Target <200 lines. Extract shared logic to lib/.
- Style files: Target <200 lines per file.
- **Approaching 300 lines? Split proactively. Don't wait.**
- **Prefer creating new files over extending existing ones.**

## Separation of Concerns
- **Pages/routes** — layout composition only. No state, no fetch.
- **Components** — render UI from props. No direct API calls.
- **Hooks** — manage state, call APIs, return data + handlers.
- **Lib** — pure functions. No framework imports. Easily testable.
- **Types** — shared interfaces. One source of truth, not duplicated.

## When Creating New Features
1. Define types first
2. Create the hook/service (logic)
3. Create components (UI)
4. Wire up in the page/route (composition)
5. Add styles if needed

---

# Defensive Coding Rules

## Error Handling (mandatory for every feature)
- Every async call MUST have error handling with user-visible feedback.
- Every async operation needs THREE UI states: loading, success, error.
- API routes MUST validate inputs before processing. Return 400 for bad input.
- Never swallow errors silently. Minimum: console.error() + user message.
- Failed operations should offer retry where possible.

## Input Validation
- File uploads: validate type AND size on both client AND server.
- API bodies: check all required fields exist and have correct types.
- User text: sanitize before rendering (prevent XSS).
- URL params: validate before using in queries.

## Resilience
- External API calls: set timeouts (30s default, 120s max for long operations).
- Network failures: show actionable message, not blank screen.
- Rate limiting: debounce rapid clicks. Disable buttons during async ops.
- Batch operations: don't fail everything if one item fails.

## Security
- Never expose API keys in client-side code.
- API routes must verify authentication before processing.
- Never trust client-sent data for authorization decisions.
- Sanitize all user input before database writes or rendering.

---

# Self-Critique Protocol

## Before declaring any task "done":

### Failure Mode Pass
1. **Network failure** — What happens if this API call times out or returns 500?
2. **Bad input** — What if the user sends empty strings, nulls, or a huge file?
3. **Race condition** — What if the user triggers this twice quickly?
4. **Empty state** — What does the UI show with no data?
5. **Partial failure** — In a batch, what if some items fail?

### Code Quality Pass
1. **File size** — Is any file approaching 300 lines?
2. **Duplication** — Am I copying code that exists elsewhere?
3. **Mixed concerns** — Does this component do more than one job?
4. **Types** — Am I using `any` instead of a proper type?
5. **Magic values** — Should these be constants?

### If You Find Issues
- Fix them now. Don't defer.
- If it's a recurring pattern, add it to LESSONS LEARNED below.

---

# Lessons Learned
<!-- Append new lessons when you discover recurring issues -->
<!-- Format: - **[date] Issue:** What went wrong -> **Fix:** What to do instead -->
<!-- This section grows over time. Read it at the start of every session. -->
