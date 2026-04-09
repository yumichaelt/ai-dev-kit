# AI Dev Tools Landscape

> Last updated: 2026-04-07

## Tier 1: Established Standards & Frameworks

| Project | Stars | What It Does | Our Take |
|---------|-------|-------------|----------|
| **Claude Code `/model opusplan`** | native | Built-in mode: Opus plans, Sonnet executes. | Use this instead of building custom orchestration. Free, instant. |
| [wshobson/agents](https://github.com/wshobson/agents) | 33k+ | 182 prebuilt agents in 77 plugins. Model-tier optimized (Opus/Sonnet/Haiku). | Recommended companion. Install 5 plugins for production-quality review. |
| [obra/superpowers](https://github.com/obra/superpowers) | 140k+ | Complete agentic skills framework. Plan -> build -> test -> review. | Gold standard for workflow. We adopt the plan-first philosophy. |
| [AGENTS.md standard](https://github.com/agentsmd/agents.md) | 20k+ | Open standard for AI agent instructions. Adopted by 60k+ repos. | We follow this standard for our template. |
| [awesome-cursorrules](https://github.com/PatrickJS/awesome-cursorrules) | 39k+ | Largest collection of AI coding rules by stack. | Great source for stack-specific patterns. |
| [repomix](https://github.com/yamadashy/repomix) | 23k+ | Packs codebase into AI-friendly format. 70% token reduction. | Complementary tool. Recommend for large projects. |

## Tier 2: Practical Tools & Templates

| Project | Stars | What It Does | Our Take |
|---------|-------|-------------|----------|
| [softaworks/agent-toolkit](https://github.com/softaworks/agent-toolkit) | 1.4k | Curated skills for AI coding agents. | Good source for workflow ideas. |
| [harness-engineering](https://github.com/jrenaldi79/harness-engineering) | 54 | Context engineering framework with CLAUDE.md templates. | Interesting mechanical enforcement approach. |
| [claude-code-starter](https://github.com/lighthouse-strategy/claude-code-starter) | 26 | Starter kit with 36 practical skills. | Good reference for skill patterns. |
| [buildingopen/claude-setup](https://github.com/buildingopen/claude-setup) | — | Production config with 12 safety hooks, 60+ skills, memory. | Advanced setup, worth studying. |
| [claude-md-templates](https://github.com/abhishekray07/claude-md-templates) | 130 | Best-practices CLAUDE.md templates. | Reference for template structure. |

## Tier 3: Ecosystem & Research

| Source | What It Covers |
|--------|---------------|
| [Aider conventions](https://aider.chat/docs/usage/conventions.html) | Model-agnostic CONVENTIONS.md approach. |
| [Spotify's Honk](https://engineering.atspotify.com/2025/11/context-engineering-background-coding-agents-part-2) | Enterprise agent (1,500+ merged PRs). Constrained tools > full access. |
| [ETH Zurich study](https://arxiv.org/html/2602.11988v1) | Auto-generated context files hurt performance. Human-curated = marginal gain. |
| [Martin Fowler on context engineering](https://martinfowler.com/articles/exploring-gen-ai/context-engineering-coding-agents.html) | Context > prompt. Write/Select/Compress/Isolate strategies. |
| [Addy Osmani's workflow](https://addyosmani.com/blog/ai-coding-workflow/) | Specs as cornerstone. Iterative chunks. AI as pair programmer. |
| [GitHub Blog on agents.md](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/) | Lessons from 2,500+ repos. |

## Key Takeaways

1. **Plan-first is universal.** Every serious practitioner converges on brainstorm -> plan -> execute -> verify.
2. **Less context is more.** Only include what the AI can't figure out from code.
3. **Skills are composable markdown.** The standard is emerging: small, focused workflow files.
4. **Verification loops matter.** Tests/lints as feedback, not just final checks.
5. **Model-agnostic wins.** Rules that work across tools are more durable.
