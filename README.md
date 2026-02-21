# BusMgmtBenchmarksApps

A collection of student React + Tailwind apps built in GitHub Codespaces.

## Getting Started in a Codespace

### 1. Dev Server (automatic)

When you open your Codespace and launch a terminal for the first time, you will be prompted to choose which student folder to serve:

```
┌──────────────────────────────────────┐
│   BusMgmtBenchmarksApps Dev Server   │
└──────────────────────────────────────┘

Which folder would you like to serve?

  1) calvinw
  2) vanyaa

Enter number [1-2]:
```

Pick your folder and the dev server starts automatically on port 5173. Check the **Ports** tab in VS Code to open your app in the browser.

To restart or switch folders at any time:

```bash
bash $CODESPACE_VSCODE_FOLDER/start-dev.sh
```

### 2. Install an AI Coding Assistant

After the dev server is running, install whichever AI coding tool you have been assigned:

**Claude Code**
```bash
bash install_claude_code.sh
```

**Opencode**
```bash
bash install_opencode.sh
```

Then follow the authentication steps for the tool you installed.

### 3. Terminal Sharing (upterm)

`upterm` is installed automatically when your Codespace is first created. Your instructor can use it to view or share your terminal session.

---

## Student Folders

Each student has their own folder at the repo root. Your folder is where you build your app — the dev server will serve it on port 5173.

| Student | Folder |
|---------|--------|
| calvinw | `calvinw/` |
| vanyaa  | `vanyaa/` |
