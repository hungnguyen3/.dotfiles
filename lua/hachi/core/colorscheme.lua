-- Make background transparent
vim.g.nightflyTransparent = true

-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

-- Change the cursor line highlight color
vim.cmd("highlight CursorLine guibg=#4a545e guifg=NONE")
-- Change the cursor line number highlight color
vim.cmd("highlight CursorLineNr guibg=#4a545e guifg=NONE")
-- Change the tabline highlight color
vim.cmd("highlight TabLineSel guibg=#4a545e guifg=NONE")
-- Change the WinBar background and forground to nothing
vim.cmd("highlight WinBar guibg=NONE guifg=NONE")
vim.cmd("highlight WinBarNC guibg=NONE guifg=NONE")
