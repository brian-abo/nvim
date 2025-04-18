<p align="center">
  <img src="https://raw.githubusercontent.com/AstroNvim/AstroNvim/main/assets/logo.svg" height="80"/>
</p>

# Neovim Config

<p align="center"><i>My AstroNvim config, streamlined for Go development, testing, session management, and fast file access.</i></p>

---

## ✨ Features

- 🧠 **AstroNvim** base with first-class Lua ergonomics and plugin structure
- 🦫 **Go development**: `gopls`, `goimports`, `gofumpt`, debugging via DAP with `delve`
- ✅ **Neotest** for a clean, integrated test runner
- 📁 **Harpoon v2** with Telescope support for quick file jumping
- 💾 **resession.nvim** for project-aware session management
- 🌌 **TokyoNight** theme with full plugin integration
- 🔎 Telescope fuzzy finding for everything
- 🔑 Keymaps auto-exported to [keymaps.md](./keymaps.md)

---

## 🔌 Notable Plugins

| Plugin                             | Purpose                                  |
|------------------------------------|------------------------------------------|
| [`neotest`](https://github.com/nvim-neotest/neotest) | Test runner with output panel and summary |
| [`harpoon@harpoon2`](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) | Fast, persistent file access list         |
| [`resession.nvim`](https://github.com/stevearc/resession.nvim) | Project-based session management          |
| [`tokyonight.nvim`](https://github.com/folke/tokyonight.nvim) | Beautiful dark color scheme               |
| Built-in DAP + `nvim-dap-ui`       | Debugging support                         |

---

## 🛠 Setup

Clone AstroNvim:

```bash
git clone https://github.com/brian-abo/nvim ~/.config/nvim

