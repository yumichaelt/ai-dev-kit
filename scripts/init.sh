#!/bin/bash
# AI Dev Kit — Project Bootstrapper
# Usage: ~/ai-dev-kit/scripts/init.sh [stack]
# Example: ~/ai-dev-kit/scripts/init.sh nextjs-supabase
#
# Available stacks: nextjs-supabase, vite-react, python-fastapi
# Default: no stack-specific rules appended

set -e

STACK="${1:-default}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
KIT_DIR="$(dirname "$SCRIPT_DIR")"
PROJECT_DIR="$(pwd)"

echo "AI Dev Kit — Initializing project..."
echo "  Kit:     $KIT_DIR"
echo "  Project: $PROJECT_DIR"
echo "  Stack:   $STACK"
echo ""

# Copy core templates
cp "$KIT_DIR/templates/AGENTS.md" "$PROJECT_DIR/AGENTS.md"
cp "$KIT_DIR/templates/CONVENTIONS.md" "$PROJECT_DIR/CONVENTIONS.md"
echo "  Copied AGENTS.md and CONVENTIONS.md"

# Copy CLAUDE.md only if it doesn't exist (don't overwrite custom config)
if [ ! -f "$PROJECT_DIR/CLAUDE.md" ]; then
  cp "$KIT_DIR/templates/CLAUDE.md" "$PROJECT_DIR/CLAUDE.md"
  echo "  Copied CLAUDE.md"
else
  echo "  Skipped CLAUDE.md (already exists)"
fi

# Copy .claudeignore only if it doesn't exist
if [ ! -f "$PROJECT_DIR/.claudeignore" ]; then
  cp "$KIT_DIR/templates/.claudeignore" "$PROJECT_DIR/.claudeignore"
  echo "  Copied .claudeignore"
else
  echo "  Skipped .claudeignore (already exists)"
fi

# Copy workflows
mkdir -p "$PROJECT_DIR/.agents/workflows"
for workflow in "$KIT_DIR/workflows/"*.md; do
  if [ -f "$workflow" ]; then
    cp "$workflow" "$PROJECT_DIR/.agents/workflows/"
  fi
done
echo "  Copied workflows to .agents/workflows/"

# Append stack-specific rules if they exist
if [ "$STACK" != "default" ] && [ -f "$KIT_DIR/stacks/$STACK.md" ]; then
  echo "" >> "$PROJECT_DIR/AGENTS.md"
  echo "---" >> "$PROJECT_DIR/AGENTS.md"
  echo "" >> "$PROJECT_DIR/AGENTS.md"
  cat "$KIT_DIR/stacks/$STACK.md" >> "$PROJECT_DIR/AGENTS.md"
  echo "  Applied $STACK stack rules to AGENTS.md"
else
  if [ "$STACK" != "default" ]; then
    echo "  Warning: Stack '$STACK' not found in $KIT_DIR/stacks/"
    echo "  Available stacks:"
    ls "$KIT_DIR/stacks/" 2>/dev/null | sed 's/\.md$//' | sed 's/^/    - /'
  fi
fi

# Append accumulated lessons
if [ -f "$KIT_DIR/lessons/lessons-learned.md" ]; then
  echo "" >> "$PROJECT_DIR/AGENTS.md"
  echo "---" >> "$PROJECT_DIR/AGENTS.md"
  echo "" >> "$PROJECT_DIR/AGENTS.md"
  # Append just the lessons section (skip the header/instructions)
  sed -n '/^## Lessons$/,$ p' "$KIT_DIR/lessons/lessons-learned.md" >> "$PROJECT_DIR/AGENTS.md"
  echo "  Loaded accumulated lessons into AGENTS.md"
fi

echo ""
echo "Done! Your project now has:"
echo "  - AGENTS.md      — Architecture + defensive coding rules"
echo "  - CONVENTIONS.md  — Model-agnostic coding conventions"
echo "  - CLAUDE.md       — Claude Code config"
echo "  - .claudeignore   — Context exclusions"
echo "  - .agents/        — Workflow files (critique, research, deploy, devlog)"
echo ""
echo "Next steps:"
echo "  1. Edit the [PROJECT-SPECIFIC] sections in AGENTS.md"
echo "  2. Start coding — the AI reads AGENTS.md on startup"
echo "  3. Run /critique after completing features"
echo "  4. Run /research periodically to check for new ideas"
