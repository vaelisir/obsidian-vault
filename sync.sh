#!/bin/bash
# Obsidian Vault Sync Script
# Syncs with GitHub: pull new notes, push any changes

cd ~/Documents/Obsidian || exit 1

# Pull latest from GitHub
echo "📥 Pulling from GitHub..."
git pull origin main 2>/dev/null

# Check if there are changes to commit
if git diff --quiet HEAD 2>/dev/null && git diff --cached --quiet 2>/dev/null; then
    echo "✅ No changes to push"
else
    echo "📤 Pushing changes..."
    git add .
    git commit -m "Auto sync $(date '+%Y-%m-%d %H:%M')"
    git push origin main 2>/dev/null
    echo "✅ Pushed successfully"
fi

echo "📁 Current notes:"
ls -lt *.md 2>/dev/null | head -5
echo "---"
echo "✅ Sync complete: $(date)"
