return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 100,
    opts = {
      flavor = "mocha",
      integrations = {
        gitsigns = true,
        neotree = true,
        telescope = true,
        treesitter = true,
      }
    }
  },
}
