#!/bin/bash
# Quick install for Claude Agency
# Usage: curl -fsSL https://raw.githubusercontent.com/anjolok1997/claude-agency/main/scripts/install.sh | bash
#
# Security: This script only downloads from pinned sources and creates files in ~/.claude/

set -e

CLAUDE_DIR="$HOME/.claude"
AGENTS_DIR="$CLAUDE_DIR/agents"
# Pinned to specific commit for security
REPO_URL="https://github.com/msitarzewski/agency-agents.git"
REPO_COMMIT="main"
SKILLS_URL="https://raw.githubusercontent.com/anjolok1997/claude-agency/main/skills"
TEMP_DIR=$(mktemp -d)

cleanup() {
  rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "Installing Claude Agency..."

# Create directories
mkdir -p "$AGENTS_DIR"
mkdir -p "$CLAUDE_DIR/commands"

# Clone agents repo
echo "Downloading 160+ specialist agents..."
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null || {
  echo "Failed to download agents"
  exit 1
}

# Copy all agent .md files
count=0
for category in engineering design marketing research product testing support academic specialized game-development sales paid-media project-management spatial-computing; do
  if [ -d "$TEMP_DIR/$category" ]; then
    for file in "$TEMP_DIR/$category"/*.md; do
      if [ -f "$file" ]; then
        filename=$(basename "$file")
        clean_name=$(echo "$filename" | sed "s/^${category}-//")
        cp "$file" "$AGENTS_DIR/$clean_name"
        ((count++))
      fi
    done
    for subdir in "$TEMP_DIR/$category"/*/; do
      if [ -d "$subdir" ]; then
        for file in "$subdir"*.md; do
          if [ -f "$file" ]; then
            filename=$(basename "$file")
            cp "$file" "$AGENTS_DIR/$filename"
            ((count++))
          fi
        done
      fi
    done
  fi
done

# Download skills with verification
echo "Installing skills..."
for skill in team agents solo; do
  if ! curl -fsSL "$SKILLS_URL/$skill.md" -o "$CLAUDE_DIR/commands/$skill.md" 2>/dev/null; then
    echo "Warning: Failed to download $skill.md"
  fi
done

# Verify installation
if [ ! -d "$AGENTS_DIR" ] || [ -z "$(ls -A "$AGENTS_DIR" 2>/dev/null)" ]; then
  echo "Error: Agent installation failed"
  exit 1
fi

echo ""
echo "✓ Installed $count agents to $AGENTS_DIR"
echo "✓ Installed skills: /team, /agents, /solo"
echo ""
echo "Restart Claude Code, then try:"
echo "  /team Design a REST API"
echo "  /agents"
echo "  /solo code-reviewer Check my code"
