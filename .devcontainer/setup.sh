#!/bin/bash
# Appends dev-server auto-start hook to ~/.bashrc (only once per container creation)

if ! grep -qF 'start-dev.sh' ~/.bashrc; then
  cat >> ~/.bashrc << 'BASHRC'

# Auto-start dev server on first terminal open
if ! ss -tln 2>/dev/null | grep -q ':5173 ' && \
   [ -f "${CODESPACE_VSCODE_FOLDER}/start-dev.sh" ]; then
  bash "${CODESPACE_VSCODE_FOLDER}/start-dev.sh"
fi
BASHRC
  echo "Dev server hook added to ~/.bashrc"
fi
