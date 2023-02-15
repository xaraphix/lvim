vim.cmd [[set tags=./tags,tags;]]
-- Reference chart of values:
--   Ps = 0  -> blinking block.
--   Ps = 1  -> blinking block (default).
--   Ps = 2  -> steady block.
--   Ps = 3  -> blinking underline.
--   Ps = 4  -> steady underline.
--   Ps = 5  -> blinking bar (xterm).
--   Ps = 6  -> steady bar (xterm).
vim.cmd [[au InsertEnter * hi Cursor guibg=white]]
vim.cmd [[au InsertLeave * hi Cursor guibg=white]]
vim.cmd [[set guicursor=n-v-c-sm:ver25-Cursor-blinkoff0,i-ci-ve:ver25-Cursor-blinkon1,r-cr-o:hor20]]
vim.cmd [[au BufRead,BufNewFile * set laststatus=0]]
vim.cmd [[au BufEnter * set laststatus=0]]
vim.cmd [[au FileType *.* set laststatus=0]]
vim.cmd [[au BufRead,BufNewFile *.* hi vertsplit guifg=fg guibg=bg]]
vim.cmd [[set autoread]]
vim.o.termguicolors = true

vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.showtabline = 0
vim.opt.updatetime = 50

-- Hides command line
vim.cmd [[
set cmdheight=1
]]

-- Hides split styles
vim.cmd [[
:set fillchars+=vert:\ 
:set fillchars+=horiz:\ 
]]


-- Code folding
--
--
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel=99

vim.cmd [[set foldenable]]

-- vim.cmd[[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint"} }]]
require('persistent-breakpoints').setup{
	load_breakpoints_event = { "BufReadPost" }
}
