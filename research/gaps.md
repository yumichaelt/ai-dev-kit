# Known Gaps

> Things this kit doesn't cover well yet. Updated by the /research workflow.

## High Priority

- [ ] **Scoped context activation:** Cursor's `.mdc` files activate rules based on file patterns (e.g., only load React rules when editing `.tsx`). Our AGENTS.md loads everything always. Could reduce token waste significantly.

- [ ] **Testing workflows:** We have defensive coding rules but no TDD workflow. obra/superpowers has a strong red-green-refactor skill. Consider adapting for projects that have tests.

- [ ] **Multi-agent orchestration:** Superpowers' subagent-driven development spawns fresh agents per task. We don't have guidance for when/how to use subagents effectively.

## Medium Priority

- [ ] **Accessibility rules:** Our defensive coding section doesn't mention a11y. Should add basic checklist (semantic HTML, keyboard nav, aria labels, color contrast).

- [ ] **Performance rules:** No guidance on bundle size, lazy loading, image optimization, or Core Web Vitals. These matter for production.

- [ ] **Database migration safety:** The Python stack mentions Alembic but we don't have rules for safe migration practices (backward-compatible changes, zero-downtime deploys).

- [ ] **Observability:** No guidance on error logging services (Sentry), monitoring, or alerting. Listed in the honest assessment but not implemented.

## Low Priority

- [ ] **CI/CD templates:** GitHub Actions / Vercel / Netlify config templates.

- [ ] **More stack addons:** Vue, Svelte, Go, Rust, Ruby on Rails.

- [ ] **Monorepo support:** Rules for Turborepo / Nx style projects.

- [ ] **Mobile stacks:** React Native, Flutter, Swift.
