#!/usr/bin/env bash
# github-push.sh — Push current workspace state to GitHub
# Usage: bash scripts/github-push.sh [optional commit message]
# Requires: GITHUB_TOKEN env var, git configured

set -euo pipefail

REPO_URL="https://${GITHUB_TOKEN}@github.com/JBlizzard-sketch/zawadi-gifts.git"
COMMIT_MSG="${1:-"chore: auto-sync $(date -u '+%Y-%m-%d %H:%M UTC')"}"

echo "==> Configuring git identity..."
git config user.email "zawadi-bot@replit.dev" 2>/dev/null || true
git config user.name "Zawadi CI Bot" 2>/dev/null || true

echo "==> Checking remote..."
if git remote get-url origin 2>/dev/null; then
  git remote set-url origin "$REPO_URL"
else
  git remote add origin "$REPO_URL"
fi

echo "==> Staging all changes..."
git add -A

echo "==> Committing..."
if git diff --cached --quiet; then
  echo "Nothing to commit, working tree clean."
else
  git commit -m "$COMMIT_MSG"
fi

echo "==> Pushing to GitHub (main)..."
git push -u origin main 2>&1 | sed "s/${GITHUB_TOKEN}/***REDACTED***/g"

echo "==> Done. Repo: https://github.com/JBlizzard-sketch/zawadi-gifts"
