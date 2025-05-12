---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = true,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "go",
          "lua",
        },
      },
      timeout_ms = 1000,
    },
    ---@diagnostic disable: missing-fields
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh({ bufnr = args.buf }) end
          end,
        },
      },
    },
    config = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "Snacks" },
            },
            hint = {
              enable = true,
              arrayIndex = "Disable",
            },
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            analyses = {
              ST1003 = true,
              fieldalignment = false,
              fillreturns = true,
              nilness = true,
              nonewvars = true,
              shadow = true,
              undeclaredname = true,
              unreachable = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            codelenses = {
              generate = true, -- show the `go generate` lens.
              regenerate_cgo = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            -- buildFlags = { "-tags", "integration" },
            completeUnimported = true,
            diagnosticsDelay = "500ms",
            gofumpt = true,
            matcher = "Fuzzy",
            semanticTokens = true,
            staticcheck = true,
            symbolMatcher = "fuzzy",
            usePlaceholders = true,
          },
        },
      },
    },
  },
}
