-- Move between windows
--
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Buffer splits
--
vim.keymap.set("n", "sh", ":leftabove vsplit<cr>")
vim.keymap.set("n", "sl", ":rightbelow vsplit<cr>")
vim.keymap.set("n", "sj", ":rightbelow split<cr>")
vim.keymap.set("n", "sk", ":leftabove split<cr>")
vim.keymap.set("n", "s<Left>", ":leftabove vsplit<cr>")
vim.keymap.set("n", "s<Right>", ":rightbelow vsplit<cr>")
vim.keymap.set("n", "s<Down>", ":rightbelow split<cr>")
vim.keymap.set("n", "s<Up>", ":leftabove split<cr>")

-- Terminal splits
--
vim.keymap.set("n", "th", ":leftabove vsplit | term<cr>")
vim.keymap.set("n", "tl", ":rightbelow vsplit | term<cr>")
vim.keymap.set("n", "tj", ":rightbelow split | term<cr>")
vim.keymap.set("n", "tk", ":leftabove split | term<cr>")
vim.keymap.set("n", "t<Left>", ":leftabove vsplit | term<cr>")
vim.keymap.set("n", "t<Right>", ":rightbelow vsplit | term<cr>")
vim.keymap.set("n", "t<Down>", ":rightbelow split | term<cr>")
vim.keymap.set("n", "t<Up>", ":leftabove split | term<cr>")

-- Tabs
--
vim.keymap.set("n", "<C-p>", ":tabprevious<cr>")
vim.keymap.set("n", "<C-n>", ":tabnext<cr>")
vim.keymap.set("i", "<C-p>", "<esc>:tabprevious<cr>")
vim.keymap.set("i", "<C-n>", "<esc>:tabnext<cr>")
vim.keymap.set("t", "<C-p>", [[<C-\><C-n>:tabprevious<cr>]])
vim.keymap.set("t", "<C-n>", [[<C-\><C-n>:tabnext<cr>]])

-- Wait
--
-- vim.keymap.set("n", "ma", "@")
vim.keymap.set("n", ",,f", ":Neotree reveal filesystem right<cr>")

-- Jupynium
--
vim.keymap.set("n", ";f", "]j", { noremap = true, silent = true })
vim.keymap.set("n", ";k", "[j")

-- LSP
--
vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<cr>")
vim.keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<cr>")
vim.keymap.set("n", "gr", ":lua vim.lsp.buf.rename()<cr>")


-- Luasnip
--
vim.keymap.set("i", "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr>')
