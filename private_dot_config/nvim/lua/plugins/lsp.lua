return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
    },
    opts = {},
    config = function(_, opts)
      require('lspconfig').rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {},
        },
      })
    end,
  },
}