-- For dark theme (neovim's default)
vim.o.background = "dark"
-- For light theme
-- vim.o.background = "light"

local c = require("vscode.colors").get_colors()
require("vscode").setup({
	-- Alternatively set style in setup
	-- style = 'light',

	-- Enable transparent background
	transparent = true,

	-- Enable italic comment
	italic_comments = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		vscLineNumber = "#FFFFFF",
	},

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
	},
})
require("vscode").load()

-- Change the cursor line highlight color
vim.cmd("highlight CursorLine guibg=#4a545e guifg=NONE")
-- Change the cursor line number highlight color
vim.cmd("highlight CursorLineNr guibg=#4a545e guifg=NONE")
-- Change the tabline highlight color
vim.cmd("highlight TabLineSel guibg=#4a545e guifg=NONE")
-- Change the tabline highlight color
vim.cmd("highlight BufferLineBackground guibg=NONE")
vim.cmd("highlight BufferLineFill guibg=NONE")
-- Change the WinBar background and forground to nothing
vim.cmd("highlight WinBar guibg=NONE guifg=NONE")
vim.cmd("highlight WinBarNC guibg=NONE guifg=NONE")
-- Change the NvimTreeOpenedFolderName background to nothing
vim.cmd("highlight NvimTreeOpenedFolderName guibg=NONE")
