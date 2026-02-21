#!/bin/bash
# postcreate.sh — runs once when the Codespace container is first created

WORKSPACE="${CODESPACE_VSCODE_FOLDER:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

echo ""
echo "┌──────────────────────────────────────┐"
echo "│     Codespace Setup                  │"
echo "└──────────────────────────────────────┘"
echo ""

# Install upterm (terminal sharing)
if command -v upterm &>/dev/null; then
  echo "→ upterm already installed, skipping."
else
  echo "→ Installing upterm..."
  # Run from workspace root since the script uses relative mkdir/cd
  (cd "$WORKSPACE" && bash install_upterm.sh)
  echo "✓ upterm installed."
fi

echo ""

# Install opencode (AI coding assistant)
if command -v opencode &>/dev/null; then
  echo "→ opencode already installed, skipping."
else
  echo "→ Installing opencode..."
  bash "$WORKSPACE/install_opencode.sh"
  echo "✓ opencode installed."
fi

echo ""

# Set up dev server auto-start hook in ~/.bashrc
echo "→ Setting up dev server hook..."
bash "$WORKSPACE/.devcontainer/setup.sh"

echo ""
echo "✓ Codespace setup complete."
echo "  Open a terminal to start the dev server."
echo ""
