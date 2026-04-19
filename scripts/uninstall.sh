#!/bin/bash
# Uninstall Claude Agency
# Usage: curl -fsSL https://raw.githubusercontent.com/anjolok1997/claude-agency/main/scripts/uninstall.sh | bash

set -e

CLAUDE_DIR="$HOME/.claude"
AGENTS_DIR="$CLAUDE_DIR/agents"
COMMANDS_DIR="$CLAUDE_DIR/commands"

echo "Uninstalling Claude Agency..."
echo ""

# Remove agents
if [ -d "$AGENTS_DIR" ]; then
  count=$(ls -1 "$AGENTS_DIR"/*.md 2>/dev/null | wc -l | tr -d ' ')
  rm -rf "$AGENTS_DIR"
  echo "✓ Removed $count agents from $AGENTS_DIR"
else
  echo "- No agents directory found"
fi

# Remove skills
removed_skills=0
for skill in team agents solo; do
  if [ -f "$COMMANDS_DIR/$skill.md" ]; then
    rm -f "$COMMANDS_DIR/$skill.md"
    echo "✓ Removed /$skill skill"
    ((removed_skills++))
  fi
done

if [ "$removed_skills" -eq 0 ]; then
  echo "- No skills found"
fi

echo ""
echo "✓ Claude Agency uninstalled"
echo ""
echo "Restart Claude Code to complete removal."
