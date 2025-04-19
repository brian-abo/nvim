# 🧠 Goland to AstroNvim Cheatsheet

> A quick reference for developers transitioning from JetBrains' Goland to an AstroNvim-powered Neovim setup.

---

## 📄 Editor Basics

| Goland Feature            | AstroNvim Equivalent                         |
|---------------------------|-----------------------------------------------|
| Autocomplete              | Built-in with `nvim-cmp`                     |
| Accept Completion         | `<Tab>` or `<CR>` (default `nvim-cmp`)      |
| Trigger Suggestions       | `<C-Space>`                                  |
| Format File               | `<leader>lf` (LSP or formatter)              |
| Rename Symbol             | `<leader>lr`                                 |
| Code Action               | `<leader>ca`                                 |
| Hover Docs (Peek)         | `K`                                          |
| Go to Definition          | `gd`                                         |
| Go to Declaration         | `gD`                                         |
| Go to Implementation      | `gi`                                         |
| Find References           | `gr`                                         |
| Show Diagnostics (Popup)  | `<leader>ld`                                 |
| Show Diagnostics (Panel)  | `<leader>xx` (Trouble or Telescope)          |
| Signature Help            | `gK` or auto-popup on param                  |

---

## 🧪 Testing & Debugging

| Goland Feature            | AstroNvim Equivalent                         |
|---------------------------|-----------------------------------------------|
| Run Nearest Test          | `<leader>Tt` (Neotest)                        |
| Run File Tests            | `<leader>Tf`                                  |
| Toggle Output Panel       | `<leader>To`                                  |
| Toggle Test Summary       | `<leader>Ts`                                  |
| Start Debugger            | `<leader>dc` (DAP)                            |
| Toggle Breakpoint         | `<leader>db`                                  |
| Step Over / Into / Out    | `<leader>do` / `<leader>di` / `<leader>dO`   |
| Pause / Continue          | `<leader>dp` / `<leader>dc`                  |
| Debug Test (if configured)| `<leader>Td`                                  |

---

## 🔭 Navigation & Search

| Goland Feature            | AstroNvim Equivalent                         |
|---------------------------|-----------------------------------------------|
| File Explorer             | `<leader>e` (Neo-tree / NvimTree)            |
| Find Files                | `<leader>ff` (Telescope)                     |
| Find in Files (Ripgrep)   | `<leader>fw`                                 |
| Recent Files              | `<leader>fo`                                 |
| Git Files                 | `<leader>fg`                                 |
| Jump to Symbol            | `<leader>ls` or `<leader>lS` (outline)       |

---

## 🚀 Harpoon Bookmarks

| Goland Feature            | AstroNvim Equivalent                         |
|---------------------------|-----------------------------------------------|
| Add Current File          | `<leader><leader>a`                           |
| Open Harpoon UI           | `<leader><leader>e`                           |
| Open in Telescope         | `<leader><leader>t`                           |
| Jump to File 1–5          | `<leader><leader>1` through `5`              |
| Next/Previous Mark        | `<leader><leader>n` / `<leader><leader>p`    |

---

## 🔧 Git Integration

| Goland Feature            | AstroNvim Equivalent                         |
|---------------------------|-----------------------------------------------|
| Git Status                | `<leader>gt`                                  |
| Git Commits               | `<leader>gc`                                  |
| File History              | `<leader>gC`                                  |
| Branches                  | `<leader>gb`                                  |
| Open in Browser           | `<leader>go`                                  |

---

## 💡 Utilities & Quality of Life

| Goland Feature            | AstroNvim Equivalent                         |
|---------------------------|-----------------------------------------------|
| Toggle Terminal           | `<leader>tf`, `<leader>th`, `<leader>tv`     |
| New File                  | `<leader>n`                                   |
| Save File                 | `<leader>w`                                   |
| Close Buffer              | `<leader>c`, `<leader>bd`, or `bC`            |

