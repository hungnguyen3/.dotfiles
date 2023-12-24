-- For dark theme (neovim's default)
vim.o.background = "dark"
-- For light theme
-- vim.o.background = "light"

require("catppuccin").setup({
	flavour = "frappe", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "frappe",
	},
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")

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
