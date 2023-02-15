vim.keymap.set("n", "<C-q>", function()
    vim.cmd [[q]]
end)

vim.keymap.set("n", "<leader>gs", function()
    vim.cmd [[Git]]
end)

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- this is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- window resize
vim.keymap.set('n', '<leader>v=', "<cmd>vertical resize +5<CR>")
vim.keymap.set('n', '<leader>v-', "<cmd>vertical resize -5<CR>")
vim.keymap.set('n', '<leader>s=', "<cmd>resize +5<CR>")
vim.keymap.set('n', '<leader>s-', "<cmd>resize -5<CR>")
-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<c-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader><leader>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>t', "<cmd>TagbarToggle<CR>")
vim.keymap.set('n', '<leader>lx', "<cmd>TroubleToggle<CR>")
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.cmd [[set laststatus=0]]
vim.keymap.set('n', 'H', function()
    if vim.o.laststatus == 0 then
        vim.o.laststatus = 2
    else
        vim.o.laststatus = 0
    end
end
)
vim.keymap.set('n', '<c-z>', function()
    vim.cmd [[set wrap!]]
end
)

-- LSP
vim.keymap.set('n', '<leader>rr', '<cmd>NiceReference<CR>')
vim.keymap.set('n', '<leader>lo', function()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end)



-- DAP DEBUG
vim.keymap.set('n', ';1', function()
    require("dapui").float_element("scopes", { position = "center", width = 1000, height = 900, enter = true})
end)
vim.keymap.set('n', ';2', function()
    require("dapui").float_element("stacks", { position = "center", width = 1000, height = 900, enter = true})
end)
vim.keymap.set('n', ';3', function()
    require("dapui").float_element("watches", { position = "center", width = 1000, height = 900, enter = true})
end)
vim.keymap.set('n', ';4', function()
    require("dapui").float_element("repl", { position = "center", width = 1000, height = 900, enter = true})
end)
vim.keymap.set('n', ';5', function()
    require("dapui").float_element("breakpoints", { position = "center", width = 1000, height = 900, enter = true})
end)
vim.keymap.set('n', ';6', function()
    require("dapui").float_element("console", { position = "center", width = 1000, height = 900, enter = true})
end)
vim.keymap.set('n', ';d', '<cmd>RustDebuggables<CR>')


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- Save breakpoints to file automatically.
keymap("n", ";b", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", opts)
keymap("n", ";cb", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", opts)
keymap("n", ";ca", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)



-- Telescope
keymap("n", "'f", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "'s", "<cmd>Telescope lsp_document_symbols<CR>", opts)
keymap("n", "'d", "<cmd>Telescope lsp_definitions<CR>", opts)
keymap("n", "'i", "<cmd>Telescope lsp_implementations<CR>", opts)
keymap("n", "'r", "<cmd>Telescope lsp_references<CR>", opts)
keymap("n", "'x", "<cmd>lua require('telescope.builtin').diagnostics({layout_strategy='vertical',layout_config={width=0.9, height=0.9}})<CR>", opts)




