# Lessons Learned

> Accumulated wisdom from all projects. This file is appended to AGENTS.md by the init script.
> Every project you build makes every future project better.

## How to Add Lessons
When `/critique` finds a recurring pattern (not a one-off bug), append here:
```
- **[YYYY-MM-DD] Issue:** What went wrong -> **Fix:** What to do instead
```

---

## Lessons

- **[2026-04-05] Monolith creep:** Studio page.tsx grew to 1,231 lines because logic, state, and UI were never separated. -> **Fix:** Always extract hooks and components early. Don't let files grow past 300 lines.

- **[2026-04-05] Large reference files in repo:** A 384KB HTML reference file was sitting in the project root, bloating AI context. -> **Fix:** Reference files go in `/docs/reference/` and are listed in `.claudeignore`. Delete after use.

- **[2026-04-04] TypeScript `any` casts:** When SDK types were incomplete, code used blanket `any` casts. -> **Fix:** Create local type declarations (e.g., `types/vendor.d.ts`) instead of `any`.

- **[2026-04-04] Happy-path-only batch processing:** Batch operations didn't handle partial failures in UI. -> **Fix:** Always implement per-item error + retry states in batch operations.

- **[2026-04-07] Over-specified context files:** ETH Zurich research (2026) found that auto-generated context files reduce AI success rates by ~3% and increase costs 20%+. -> **Fix:** Only include non-inferable information in AGENTS.md. Don't restate what the AI can figure out from reading the code.
