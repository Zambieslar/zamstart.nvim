-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.keymap.set('n', '=', [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set('n', '-', [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set('n', '+', [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set('n', '_', [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

vim.keymap.set('n', 'mcr', [[<cmd>Cargo run<cr>]])
vim.keymap.set('n', 'mca', [[<cmd>Cargo add<cr>]])
vim.keymap.set('n', '<C-]>', [[<cmd>bNext<cr>]])
vim.keymap.set(
  'n',
  '<C-[>',
  [[<cmd>brewind<cr>])
vim.keymap.set('n', '<Space>tn', [[<cmd>tabnew<cr>]]
)
vim.keymap.set('n', '<Space>op', [[<cmd>Neotree toggle<cr>]])
vim.keymap.set('n', '<Space>bd', [[<cmd>bdelete<cr>]])

vim.o.guifont = 'Iosevka Medium Extended'
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_refresh_rate = 60
vim.g.neovide_scale_factor = 0.7
vim.g.neovide_transparency = 0.3
vim.g.neovide_fullscreen = false

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    enabled = true,
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('neo-tree').setup {}
    end,
  },
  {
    'rust-lang/rust.vim',
    enabled = true,
    ft = 'rust',
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    'simrat39/rust-tools.nvim',
    enabled = true,
    ft = 'rust',
    opts = function()
      require 'custom.configs.rust-tools'
    end,
  },
  {
    'windwp/nvim-autopairs',
    enabled = true,
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    'elkowar/yuck.vim',
    enabled = true,
    ft = 'yuck',
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'coffebar/neovim-project',
    opts = {
      projects = { -- define project roots
        '~/projects/*',
        '~/.config/*',
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append 'globals' -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
      { 'Shatur/neovim-session-manager' },
    },
    lazy = false,
    priority = 100,
  },
}
