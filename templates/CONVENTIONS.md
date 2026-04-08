# Coding Conventions

> Model-agnostic conventions that work with any AI coding assistant.
> This file is read-only context — it tells the AI how your team writes code.
> Customize for your project. Delete what doesn't apply.

## General

- Prefer explicit over clever. Code is read more than written.
- Don't add features, refactor, or "improve" beyond what was asked.
- Don't add error handling for scenarios that can't happen.
- Don't create abstractions for one-time operations.
- Three similar lines > premature abstraction.
- Fix the actual problem, not symptoms around it.

## File Organization

- One purpose per file. If a file does two things, split it.
- Name files for what they contain, not what uses them.
- Group by feature, not by type, when the project grows past ~20 files.
- Keep test files next to the code they test (or in a parallel test/ tree).

## Functions

- Functions do one thing. If you need "and" to describe it, split it.
- Max ~50 lines per function. Extract helpers if longer.
- Name functions for what they do, not how they do it.
- Pure functions where possible. Side effects at the edges.

## Error Handling

- Handle errors at the boundary where you can do something about them.
- Don't catch errors just to re-throw them.
- Error messages should tell the user what to do, not what went wrong internally.
- Log errors with enough context to debug (what operation, what input, what failed).

## Comments

- Don't comment what the code does — make the code clear.
- Do comment why non-obvious decisions were made.
- Don't leave commented-out code. Delete it (git has history).
- TODO comments must include context: who, why, when.

## Git

- Commit messages: imperative mood, explain why not what.
- One logical change per commit.
- Don't commit generated files, secrets, or large binaries.
