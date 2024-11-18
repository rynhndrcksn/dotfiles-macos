return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      -- list can be found here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      ensure_installed = {
        "bashls",
        "cssls",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "phpactor",
        "tailwindcss",
        "ts_ls",
        "yamlls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    -- list can be found here: https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    mason_tool_installer.setup({
      ensure_installed = {
        -- "bash-language-server", -- self explanatory
        "golangci-lint",     -- go linter
        "markdownlint-cli2", -- markdown linter
        "phpstan",           -- php linter
        "prettier",          -- prettier formatter
        "shellcheck",        -- sh linter
        "stylua",            -- lua formatter
      },
    })
  end,
}
