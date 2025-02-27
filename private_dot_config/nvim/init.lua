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
require('lazy').setup('plugins')

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
vim.wo.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.hlsearch = true
vim.o.cursorline = true
vim.o.undofile = true
vim.o.scrolloff = 10

vim.cmd.colorscheme "catppuccin"

-- Telescope
vim.keymap.set(
  'n',
  '<leader><space>',
  function()
    require('telescope.builtin').buffers({ sort_lastused = true, sort_mru = true })
  end,
  { desc = '[ ] Find existing buffers' }
)
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '    Find files' })
vim.keymap.set('n', '<C-m>', require('telescope.builtin').live_grep, { desc = '    Live grep' })
-- NeoTree
vim.keymap.set('n', '<C-b>', function()
  require('neo-tree.command').execute({
    toggle = true,
    position = 'float',
    reveal = true,
  })
end)
-- Barbar
vim.keymap.set('n', '<C-h>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<C-l>', '<Cmd>BufferNext<CR>')
-- vim.keymap.set('n', '<C-S-H>', '<Cmd>BufferMovePrevious<CR>')
-- vim.keymap.set('n', '<C-S-L>', '<Cmd>BufferMoveNext<CR>')
-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set({ 'n', 'v' }, 'F', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
    vim.keymap.set('n', '<C-i>', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end
})
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false})
  end
})

-- vim: ts=2 sts=2 sw=2 et
