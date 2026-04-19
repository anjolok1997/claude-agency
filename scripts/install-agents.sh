#!/bin/bash
# Core agent installation - used by both install.sh and plugin postInstall
# Pinned to specific commit for security

set -e

AGENTS_DIR="$HOME/.claude/agents"
REPO_URL="https://github.com/msitarzewski/agency-agents.git"
REPO_COMMIT="783f6a72bfd7f3135700ac273c619d92821b419a"
TEMP_DIR=$(mktemp -d)

cleanup() {
  rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "Installing The Agency agents..."

# Clone at specific commit
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null || {
  echo "Error: Failed to clone agency-agents repo"
  exit 1
}

cd "$TEMP_DIR"
git fetch --depth 1 origin "$REPO_COMMIT" 2>/dev/null && git checkout "$REPO_COMMIT" 2>/dev/null || {
  echo "Warning: Could not checkout pinned commit, using latest"
}
cd - > /dev/null

# Create agents directory
mkdir -p "$AGENTS_DIR"

# Copy all agent .md files (flatten structure for easier access)
count=0
categories="engineering design marketing research product testing support academic specialized game-development sales paid-media project-management spatial-computing"

for category in $categories; do
  if [ -d "$TEMP_DIR/$category" ]; then
    for file in "$TEMP_DIR/$category"/*.md; do
      if [ -f "$file" ]; then
        filename=$(basename "$file")
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

if [ "$count" -eq 0 ]; then
  echo "Error: No agents were installed"
  exit 1
fi

echo "Installed $count agents to $AGENTS_DIR"
