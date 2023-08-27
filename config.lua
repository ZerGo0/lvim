--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
lvim.colorscheme = 'ayu-dark'

-- vim options
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.*",
  timeout = 1000,
}
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
lvim.builtin.nvimtree.setup.hijack_netrw = false
-- lvim.builtin.nvimtree.setup.disable_netrw = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
local function map(mode, lhs, rhs, opts)
  if mode == "n" then
    lvim.keys.normal_mode[lhs] = rhs
  elseif mode == "i" then
    lvim.keys.insert_mode[lhs] = rhs
  elseif mode == "v" then
    lvim.keys.visual_mode[lhs] = rhs
  end
end

local function mapn(modes, lhs, rhs, opts)
  for _, mode in ipairs(modes) do
    map(mode, lhs, rhs, opts)
  end
end

lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

map("n", "<F3>", "n", { desc = "Next Search" })
--map("i", "<Tab>", "<nop>")

mapn({ "n", "i" }, "<S-Left>", "<ESC>v<Left>", { desc = "Selection Left" })
mapn({ "n", "i" }, "<S-Right>", "<ESC>v<Right>", { desc = "Selection Right" })
mapn({ "n", "i" }, "<S-Up>", "<ESC>v<Up>", { desc = "Selection Up" })
mapn({ "n", "i" }, "<S-Down>", "<ESC>v<Down>", { desc = "Selection Down" })
mapn({ "n", "i" }, "<C-S-Left>", "<ESC>v<Left>", { desc = "Selection Left" })
mapn({ "n", "i" }, "<C-S-Right>", "<ESC>v<Right>", { desc = "Selection Right" })
mapn({ "n", "i" }, "<C-S-Up>", "<ESC>v<Up>", { desc = "Selection Up" })
mapn({ "n", "i" }, "<C-S-Down>", "<ESC>v<Down>", { desc = "Selection Down" })

map("v", "i", "<ESC>i", { desc = "Insert Mode" })
map("v", "<C-c>", "ygv", { desc = "Copy" })
map("v", "<C-x>", "ygv<Del>", { desc = "Cut" })
map("v", "<S-Left>", "<Left>", { desc = "Selection Left" })
map("v", "<S-Right>", "<Right>", { desc = "Selection Right" })
map("v", "<S-Up>", "<Up>", { desc = "Selection Up" })
map("v", "<S-Down>", "<Down>", { desc = "Selection Down" })

mapn({ "i", "n", "v" }, "<C-q>", "<cmd>BufDel<cr>", { desc = "Close Window" })
mapn({ "i", "n", "v" }, "<F17>", "<cmd>qa<cr>", { desc = "Close All Windows" })
mapn({ "i", "n", "v" }, "<A-Enter>", function()
  vim.lsp.buf.code_action()
end, { desc = "Quick Fix" })
mapn({ "i", "n", "v" }, "<A-Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
mapn({ "i", "n", "v" }, "<A-Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
mapn({ "i", "n", "v" }, "<C-a>", "<ESC>ggVG", { desc = "Select all" })
mapn({ "i", "n", "v" }, "<C-s>", "<cmd>w!<cr>", { desc = "Save" })
mapn({ "i", "n", "v" }, "<C-y>", "<cmd>red<cr>", { desc = "Redo" })
mapn({ "i", "n", "v" }, "<C-z>", "<cmd>u<cr>", { desc = "Undo" })
mapn({ "i", "n", "v" }, "<F2>", function()
  vim.lsp.buf.rename()
end, { desc = "Rename" })
mapn({ "i", "n", "v" }, "<F10>", function()
  vim.diagnostic.goto_prev()
end, { desc = "Go to prev error" })
mapn({ "i", "n", "v" }, "<F11>", function()
  vim.diagnostic.goto_next()
end, { desc = "Go to next error" })
mapn({ "i", "n", "v" }, "<F12>", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition" })
mapn({ "i", "n", "v" }, "<S-F12>", function()
  vim.lsp.buf.references()
end, { desc = "Show usages" })
mapn({ "i", "n", "v" }, "<F13>", function()
  vim.lsp.buf.hover()
end, { desc = "Show LSP hover" })
mapn({ "i", "n", "v" }, "<F14>", "<C-W>w", { desc = "Cursor to other split" })
mapn({ "i", "n", "v" }, "<F15>", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin" })
mapn({ "i", "n", "v" }, "<F22>", function()
  vim.diagnostic.open_float()
end, { desc = "Show diagnostics" })
mapn({ "i", "n", "v" }, "<F23>", function()
  require("telescope.builtin").find_files()
end, { desc = "Search all files" })
mapn({ "i", "n", "v" }, "<F24>", function()
  require("telescope.builtin").live_grep()
end, { desc = "Search words in all files" })


-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.alpha.dashboard.section.buttons.entries = {
  { "r", lvim.icons.ui.History .. "  Recent Sessin", "<CMD>lua require(\"persistence\").load()<CR>" },
  { "f", lvim.icons.ui.FindFile .. "  Find File",    "<CMD>Telescope find_files<CR>" },
  { "n", lvim.icons.ui.NewFile .. "  New File",      "<CMD>ene!<CR>" },
  { "p", lvim.icons.ui.Project .. "  Projects ",     "<CMD>Telescope projects<CR>" },
  { "t", lvim.icons.ui.FindText .. "  Find Text",    "<CMD>Telescope live_grep<CR>" },
  {
    "c",
    lvim.icons.ui.Gear .. "  Configuration",
    "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
  },
  { "q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
}
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false


-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
vim.diagnostic.config({ update_in_insert = true })
-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  --   { command = "stylua" },
  {
    command = "prettier",
    extra_args = { "--single-quote", "--jsx-single-quote" },
  },
  -- }
  -- local linters = require "lvim.lsp.null-ls.linters"
  -- linters.setup {
  --   { command = "flake8", filetypes = { "python" } },
  --   {
  --     command = "shellcheck",
  --     args = { "--severity", "warning" },
  --   },
}

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {
    "Shatur/neovim-ayu"
  },
  {
    "ojroques/nvim-bufdel",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        floating_window = false
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = {
          ["*"] = true,
        },
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    enabled = true,
    config = function()
      require("copilot_cmp").setup({
        method = "getCompletionsCycling",
      })
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  {
    "folke/trouble.nvim",
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      icons = false,
      height = 5,
      fold_open = "v",      -- icon used for open folds
      fold_closed = ">",    -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      mode = "document_diagnostics",
      signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
      },
      auto_open = true,
      use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
    }
  },
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = {
  --     "kevinhwang91/promise-async"
  --   },
  --   config = function()
  --     require('ufo').setup({
  --       provider_selector = function(bufnr, filetype, buftype)
  --         return { 'treesitter', 'indent' }
  --       end
  --     })
  --   end,
  --   init = function()
  --     vim.o.foldcolumn = '1' -- '0' is not bad
  --     vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
  --     vim.o.foldlevelstart = 99
  --     vim.o.foldenable = true
  --   end,
  --   lazy = false
  -- }
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
