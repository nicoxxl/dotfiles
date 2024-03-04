vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'lewis6991/gitsigns.nvim'
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl"
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
    }
  },
}, {})

vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true

require("catppuccin").setup {
  flavour = "mocha",
}
vim.cmd.colorscheme "catppuccin"

require('telescope').setup {}
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files)

require("lualine").setup {}
require('gitsigns').setup()
require('ibl').setup()
require('lspconfig').rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {}
  }
}


-- vim: ts=2 sts=2 sw=2 et
