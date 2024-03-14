return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        config = function() 
          require('telescope').setup {}
          pcall(require('telescope').load_extension, 'fzf')
        end
      }
    },
    opts = {},
  }
}
