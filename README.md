# AI Dev Kit

A portable, self-improving methodology for AI-assisted software development.

Drop these files into any project to give your AI coding assistant (Claude Code, Cursor, Copilot, Gemini CLI, Codex) architectural guardrails, defensive coding habits, and a feedback loop that gets smarter over time.

## Why This Exists

AI coding assistants write "happy path" code by default. They don't proactively split large files, validate edge cases, or follow consistent architecture unless you tell them to. This kit tells them to -- and learns from every project.

**This is not a plugin or extension.** It's a set of markdown files that travel with you across projects and tools.

## What's Inside

```
ai-dev-kit/
├── templates/              # Drop-in files for new projects
│   ├── AGENTS.md           # Core architecture + defensive coding rules
│   ├── CONVENTIONS.md      # Model-agnostic coding conventions
│   ├── CLAUDE.md           # Claude Code project config
│   └── .claudeignore       # Standard context exclusions
├── workflows/              # Reusable AI workflows
│   ├── critique.md         # Adversarial self-review protocol
│   ├── research.md         # Web research for gaps & new ideas
│   ├── deploy.md           # Git push + deploy workflow
│   └── devlog.md           # Session documentation
├── stacks/                 # Stack-specific rule addons
│   ├── nextjs-supabase.md  # Next.js App Router + Supabase
│   ├── vite-react.md       # Vite + React + TypeScript
│   └── python-fastapi.md   # Python FastAPI + SQLAlchemy
├── lessons/                # Accumulated wisdom from all projects
│   └── lessons-learned.md  # Growing list of patterns & fixes
├── research/               # Landscape tracking & gap analysis
│   ├── landscape.md        # State of AI dev tools ecosystem
│   ├── gaps.md             # Known gaps in this kit
│   └── sources.md          # Repos & articles to monitor
└── scripts/
    └── init.sh             # One-command project bootstrapping
```

## Quick Start

### Option A: Init Script (recommended)
```bash
# Clone once
git clone https://github.com/michaelyu/ai-dev-kit.git ~/ai-dev-kit

# Bootstrap any new project
cd my-new-project
~/ai-dev-kit/scripts/init.sh nextjs-supabase
```

### Option B: Manual Copy
```bash
cp ~/ai-dev-kit/templates/AGENTS.md ./AGENTS.md
cp ~/ai-dev-kit/templates/CLAUDE.md ./CLAUDE.md
cp ~/ai-dev-kit/templates/.claudeignore ./.claudeignore
```

## The Self-Improving Loop

```
Start project → AI reads AGENTS.md → Builds code following rules
                                            ↓
                                    Run /critique workflow
                                            ↓
                              Found a recurring pattern issue?
                                    ↓               ↓
                                   YES              NO → Done
                                    ↓
                        Append to lessons-learned.md
                                    ↓
                        Next project inherits the fix
```

Every project you build makes every future project better.

## The Research Loop

Run the `/research` workflow periodically to:
1. Search the web for new AI dev methodology repos, tools, and techniques
2. Compare findings against what this kit already covers
3. Identify gaps and blind spots
4. Propose concrete updates to templates and workflows

This prevents the kit from going stale and ensures you're leveraging the best ideas from the community.

## Philosophy

Informed by research and real-world practice:

- **Minimal context** ([ETH Zurich, 2026](https://arxiv.org/html/2602.11988v1)): Only include what the AI can't figure out from reading the code. Over-specifying hurts more than it helps.
- **Plan before code** ([obra/superpowers](https://github.com/obra/superpowers)): brainstorm -> plan -> execute -> verify. Every serious practitioner has converged on this.
- **Model-agnostic conventions** ([Aider](https://aider.chat)): Rules that work across any AI tool, not locked to one vendor.
- **Scoped activation** ([Cursor .mdc](https://github.com/PatrickJS/awesome-cursorrules)): Load rules based on what you're touching, not everything always.
- **Verification at every step** ([Spotify's Honk](https://engineering.atspotify.com/2025/11/context-engineering-background-coding-agents-part-2)): Tests and lints as feedback loops, not just final checks.

## Standing on Shoulders

This kit draws from and is compatible with:

| Project | Stars | What We Leverage |
|---------|-------|-----------------|
| [obra/superpowers](https://github.com/obra/superpowers) | 140k+ | Workflow methodology (plan, TDD, subagents) |
| [AGENTS.md standard](https://github.com/agentsmd/agents.md) | 20k+ | The open standard for AI agent instructions |
| [awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules) | 39k+ | Scoped rules patterns |
| [repomix](https://github.com/yamadashy/repomix) | 23k+ | Codebase compression techniques |
| [harness-engineering](https://github.com/jrenaldi79/harness-engineering) | — | Context engineering framework |
| [claude-code-starter](https://github.com/lighthouse-strategy/claude-code-starter) | — | Practical skills library |

## License

MIT — use it, fork it, improve it, share it.
