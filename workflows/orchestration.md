---
description: Opus + Sonnet orchestration pattern for token-efficient AI development
---

# Orchestration Workflow (Opus + Sonnet)

## Purpose
Use Claude Opus 4.6 as the orchestrator (planning, review, intervention) and Claude Sonnet 4.6 as the executor (writing code, running tests). This conserves Opus tokens for high-value reasoning while leveraging Sonnet's speed and lower cost for mechanical work.

## When to Use
- Any non-trivial coding task with the user running Opus 4.6 as primary model
- Implementation plans with multiple discrete steps
- Refactoring across multiple files
- Bug fixes that need investigation + fix + verification

## The Pattern

```
Opus (orchestrator)
   |
   |-- 1. Brainstorm intent with user
   |-- 2. Write a plan (writing-plans skill)
   |-- 3. For each plan step:
   |       |-- Dispatch Sonnet subagent (model: "sonnet")
   |       |-- Subagent executes the step
   |       |-- Subagent reports results
   |-- 4. Verify outputs (verification-before-completion)
   |-- 5. Run /critique on the diff
   |-- 6. Intervene only if Sonnet hit a blocker
```

## Steps

### Phase 1: Planning (Opus)
1. Run the `brainstorming` skill with the user to clarify intent.
2. Run `writing-plans` to produce an executable plan.
3. Identify which steps are mechanical (delegate to Sonnet) vs. judgment-heavy (keep in Opus).

### Phase 2: Dispatching (Opus -> Sonnet)
4. For each mechanical step, dispatch a Sonnet subagent via the `Agent` tool:
   ```
   Agent(
     description: "Implement <task>",
     subagent_type: "general-purpose",
     model: "sonnet",
     prompt: "<detailed task description with file paths, expected outputs, verification commands>"
   )
   ```
5. **Critical:** The prompt must be self-contained. Sonnet won't see the conversation history. Include:
   - Exact file paths to modify
   - Expected behavior (with examples)
   - Verification commands the subagent should run
   - Any constraints or gotchas from AGENTS.md

6. For independent tasks, dispatch multiple Sonnet subagents in parallel (single message, multiple tool calls).

### Phase 3: Review (Opus)
7. When subagents return, Opus reviews their reports.
8. Run `verification-before-completion` skill to confirm everything actually works.
9. Run `/critique` on the cumulative diff.
10. Run `simplify` skill to check for redundancy.

### Phase 4: Intervention (Opus, if needed)
11. If a subagent reports a blocker, Opus investigates directly.
12. If a subagent's output is wrong/incomplete, Opus either:
    - Re-dispatches with clearer instructions, OR
    - Takes over the task directly
13. Never blindly trust subagent reports — always verify against actual file state.

## Decision Matrix: Opus vs. Sonnet

| Task Type | Model | Why |
|-----------|-------|-----|
| Brainstorming requirements | Opus | High-judgment, ambiguous |
| Writing implementation plans | Opus | Strategy + tradeoffs |
| Architecture decisions | Opus | Long-term consequences |
| Writing boilerplate code | Sonnet | Mechanical, well-specified |
| Implementing a planned feature | Sonnet | Clear instructions, verifiable |
| Running tests / fixing lint | Sonnet | Mechanical |
| Refactoring with clear intent | Sonnet | Pattern application |
| Debugging unknown issues | Opus | Investigation, hypothesis |
| Code review / critique | Opus | Judgment, pattern recognition |
| Final verification | Opus | Catch what subagents miss |

## Common Pitfalls

- **Vague subagent prompts:** Sonnet has no context. "Fix the bug" won't work — give exact files, symptoms, expected behavior.
- **Not verifying subagent output:** Subagents can claim success when something is broken. Always run verification commands yourself.
- **Over-dispatching:** Don't dispatch a subagent for a 5-line edit. The dispatch overhead isn't worth it.
- **Sequential when parallel works:** If 3 tasks are independent, dispatch all 3 in one message, not one at a time.

## Token Math (rough)

| Approach | Opus tokens | Sonnet tokens | Cost ratio |
|----------|-------------|---------------|-----------|
| Pure Opus | 100k | 0 | 1.0x |
| Opus orchestrates Sonnet | 30k | 70k | ~0.4x |

(Sonnet is roughly 5x cheaper than Opus per token. Even with the overhead of dispatching, the orchestration pattern typically cuts costs by half or more on long sessions.)
