#!/bin/bash
# start-dev.sh — interactive dev server launcher for BusMgmtBenchmarksApps

WORKSPACE="${CODESPACE_VSCODE_FOLDER:-$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)}"
LOG="$HOME/.dev-server.log"

echo ""
echo "┌──────────────────────────────────────┐"
echo "│   BusMgmtBenchmarksApps Dev Server   │"
echo "└──────────────────────────────────────┘"
echo ""

# Find student folders (any dir at repo root with index.html or package.json)
folders=()
for dir in "$WORKSPACE"/*/; do
  [ -d "$dir" ] || continue
  folder=$(basename "$dir")
  [[ "$folder" == .* ]] && continue          # skip hidden dirs
  [[ "$folder" == node_modules ]] && continue # skip node_modules
  if [ -f "$dir/index.html" ] || [ -f "$dir/package.json" ]; then
    folders+=("$folder")
  fi
done

if [ ${#folders[@]} -eq 0 ]; then
  echo "No student folders found in $WORKSPACE"
  return 0 2>/dev/null || exit 0
fi

echo "Which folder would you like to serve?"
echo ""
for i in "${!folders[@]}"; do
  echo "  $((i+1))) ${folders[$i]}"
done
echo ""
read -rp "Enter number [1-${#folders[@]}]: " choice

if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "${#folders[@]}" ]; then
  echo "Invalid choice. Run 'bash start-dev.sh' to try again."
  return 1 2>/dev/null || exit 1
fi

folder="${folders[$((choice-1))]}"
TARGET="$WORKSPACE/$folder"

echo ""
echo "→ Serving: $folder"

# Stop any previously running dev server
if [ -f ~/.dev-server.pid ]; then
  OLD_PID=$(cat ~/.dev-server.pid)
  if kill -0 "$OLD_PID" 2>/dev/null; then
    echo "→ Stopping previous server (PID $OLD_PID)..."
    kill "$OLD_PID" 2>/dev/null
    sleep 1
  fi
  rm -f ~/.dev-server.pid
fi

if [ -f "$TARGET/package.json" ] && grep -q '"dev"' "$TARGET/package.json"; then
  # Vite (or other npm-based) project
  echo "→ Vite project detected — installing dependencies..."
  (cd "$TARGET" && npm install)
  echo "→ Starting Vite dev server on port 5173..."
  nohup bash -c "cd '$TARGET' && npm run dev" > "$LOG" 2>&1 &
else
  # Plain static HTML — use npx serve
  echo "→ Static project detected — starting file server on port 5173..."
  nohup bash -c "npx serve '$TARGET' -p 5173 --no-clipboard" > "$LOG" 2>&1 &
fi

echo $! > ~/.dev-server.pid

echo ""
echo "✓ Dev server started in the background"
echo ""
echo "  Logs:    tail -f $LOG"
echo "  Stop:    kill \$(cat ~/.dev-server.pid)"
echo "  Restart: bash $WORKSPACE/start-dev.sh"
echo ""
echo "  → Check the Ports tab in VS Code to open your app."
echo ""
