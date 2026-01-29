local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- MiniFiles mapping for file tree


-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "<C-o>", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<C-o>", "<ESC>", opts)
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Oil --
keymap("n", "<leader>o", "<CMD>Oil<CR>", opts)

-- fzf lua --
-- find files
keymap("n", "<leader>ff", "<CMD>FzfLua files<CR>", opts)
-- live grep
keymap("n", "<leader>fg", "<CMD>FzfLua live_grep<CR>", opts)
-- find buffers
keymap("n", "<leader>fb", "<CMD>FzfLua buffers<CR>", opts)
-- code actions
keymap("n", "<leader>fa", "<CMD>FzfLua lsp_code_actions<CR>", opts)
-- workspace diagnostic
keymap("n", "<leader>fwd", "<CMD>FzfLua lsp_workspace_diagnostics<CR>", opts)
-- document diagnostic
keymap("n", "<leader>fd", "<CMD>FzfLua lsp_workspace_diagnostics<CR>", opts)
-- find lsp document symbols
keymap("n", "<leader>fs", "<CMD>FzfLua lsp_document_symbols<CR>", opts)
-- find lsp workspace symbols
keymap("n", "<leader>fws", "<CMD>FzfLua lsp_workspace_symbols<CR>", opts)
-- find buffers
keymap("n", "<leader>fws", "<CMD>FzfLua buffers<CR>", opts)
-- find implementations
keymap("n", "<leader>fi", "<CMD>FzfLua lsp_implementations<CR>", opts)

-- lsp --
-- hover
keymap("n", "K", vim.lsp.buf.hover, opts)
-- diagnostic
keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
-- go to definition
keymap("n", "gd", vim.lsp.buf.definition, opts)
-- go to implementation
keymap("n", "gi", vim.lsp.buf.implementation, opts)

keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

-- conform --
-- format by key
keymap("n", "<leader>rf", function() require("conform").format({ async = true, lsp_format = "fallback"}) end, opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
