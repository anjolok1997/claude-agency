#!/bin/bash
# Install agency-agents to ~/.claude/agents/

set -e

AGENTS_DIR="$HOME/.claude/agents"
REPO_URL="https://github.com/msitarzewski/agency-agents.git"
TEMP_DIR=$(mktemp -d)

echo "Installing The Agency agents..."

# Clone the repo
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null || {
  echo "Failed to clone agency-agents repo"
  exit 1
}

# Create agents directory
mkdir -p "$AGENTS_DIR"

# Copy all agent .md files (flatten structure for easier access)
count=0
for category in engineering design marketing research product testing support academic specialized game-development sales paid-media project-management spatial-computing; do
  if [ -d "$TEMP_DIR/$category" ]; then
    for file in "$TEMP_DIR/$category"/*.md; do
      if [ -f "$file" ]; then
        # Extract just the agent name from the filename
        filename=$(basename "$file")
        # Remove category prefix if present (e.g., engineering-backend-architect.md -> backend-architect.md)
        clean_name=$(echo "$filename" | sed "s/^${category}-//")
        cp "$file" "$AGENTS_DIR/$clean_name"
        ((count++))
      fi
    done
    # Handle subdirectories (e.g., game-development/unity/)
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

# Cleanup
rm -rf "$TEMP_DIR"

echo "Installed $count agents to $AGENTS_DIR"
echo ""
echo "Usage:"
echo "  /team <goal>           # Assemble a team for any task"
echo "  /agents                # Browse available agents"
echo "  /solo <agent> <task>   # Run a single specialist"
