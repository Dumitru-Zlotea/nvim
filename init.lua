print("Hello there")
require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true

local afhasda = 5
if afhasda > 5 then
    print("yes")
end

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":lua loadstring(vim.fn.getline('.'))()<CR>")
vim.keymap.set("v", "<Leader>x", [[:lua local s,e=unpack(vim.fn.getpos("'<"),2,3),unpack(vim.fn.getpos("'>"),2,3) local l=vim.fn.getline(s,e) loadstring(table.concat(l,"\n"))()<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "gri", vim.lsp.buf.implementation)
vim.keymap.set("n", "grn", ":lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "grr", ":lua vim.lsp.buf.references()<CR>")
-- Copy all lines in file
vim.keymap.set("n", "<C-a>", ":%y+<CR>")

-- Clear search highlight 
vim.keymap.set("n", "<Esc>", function()
    if vim.v.hlsearch == 1 then
	vim.cmd("noh")
	return ""
    end
    return "<Esc>"
end, { expr = true, silent = true })

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"python", "typescript" },
    callback = function() vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc" end,
})

-- :help vim.lsp.buf and map all interesting functions (grr, grn, ...)
