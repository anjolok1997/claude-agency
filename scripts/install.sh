#!/bin/bash
# Full install for Claude Agency (agents + skills)
# Usage: curl -fsSL https://raw.githubusercontent.com/anjolok1997/claude-agency/main/scripts/install.sh | bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
SKILLS_URL="https://raw.githubusercontent.com/anjolok1997/claude-agency/main/skills"

echo "Installing Claude Agency..."
echo ""

# Install agents (use local script if available, otherwise download)
if [ -f "$SCRIPT_DIR/install-agents.sh" ]; then
  bash "$SCRIPT_DIR/install-agents.sh"
else
  # Running via curl pipe - download and run install-agents.sh
  TEMP_SCRIPT=$(mktemp)
  curl -fsSL "https://raw.githubusercontent.com/anjolok1997/claude-agency/main/scripts/install-agents.sh" -o "$TEMP_SCRIPT" || {
    echo "Error: Failed to download install-agents.sh"
    exit 1
  }
  bash "$TEMP_SCRIPT"
  rm -f "$TEMP_SCRIPT"
fi

# Install skills
echo ""
echo "Installing skills..."
mkdir -p "$CLAUDE_DIR/commands"

for skill in team agents solo; do
  if curl -fsSL "$SKILLS_URL/$skill.md" -o "$CLAUDE_DIR/commands/$skill.md" 2>/dev/null; then
    echo "  ✓ /$skill"
  else
    echo "  ✗ /$skill (failed)"
  fi
done

# Verify installation
if [ ! -d "$CLAUDE_DIR/agents" ] || [ -z "$(ls -A "$CLAUDE_DIR/agents" 2>/dev/null)" ]; then
  echo ""
  echo "Error: Installation incomplete - no agents found"
  exit 1
fi

echo ""
echo "✓ Claude Agency installed successfully!"
echo ""
echo "Restart Claude Code, then try:"
echo "  /team Design a REST API"
echo "  /agents"
echo "  /solo code-reviewer Review my code"
