return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Only LSPs in the list:
          -- https://mason-registry.dev/registry
          "ansible-language-server",
          "bash-language-server",
          "css-lsp",
          -- "docker-compose-language-service",
          "docker-language-server",
          "gopls",
          "helm-ls",
          "html-lsp",
          -- "htmx-lsp",
          "lua-language-server",
          "python-lsp-server",
          "sqlls",
          "terraformls",
          -- "tsserver", -- Typescript
          -- "ventur-vls", -- Vue
          "yaml-language-server",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Global Language Server Setup
      local lspconfig = require("lspconfig")

      -- Language Specific Setup
      --- Bash
      lspconfig.bashls.setup({})

      --- Go
      lspconfig.gopls.setup({})

      --- Lua
      lspconfig.lua_ls.setup({})

      --- TypeScript
      lspconfig.tsserver.setup({})





      -- Keymaps
      --- On Startup
      vim.keymap.set("n", "<leader>q", vim.diagnostic.open_float, {})

      --- Only create keybinds when needed, aka on LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings(:h vim.lsp.*)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gf", vim.lsp.buf.format, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end
  }
}
