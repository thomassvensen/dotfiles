.config/nvim/init.lua
-- NOTE! Need to install yaml-language-server separately via "npm install -g ..."
-- Enable the yaml-language-server config from nvim-lspconfig
vim.lsp.enable("yamlls")

-- Configure yamlls-specific settings
vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*"
      },
      validate = true,
      completion = true,
      hover = true,
      format = { enable = true },
    }
  }
})

-- Example using lazy.nvim (or adapt for your plugin manager)
return {
  -- LSP configurations
  { "neovim/nvim-lspconfig" },

  -- Optional: manage LSP installation
  { "mason-org/mason.nvim", opts = {} },
  { "mason-org/mason-lspconfig.nvim", opts = { ensure_installed = { "yamlls" } } },

  -- Autocompletion
  { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp" } },

  -- Indentation visuals (optional)
  { "lukas-reineke/indent-blankline.nvim", opts = {} },

  -- Treesitter for syntax highlight
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}
