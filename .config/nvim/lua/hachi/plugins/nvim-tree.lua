-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 2

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- link NvimTreeNormal highlight group to Normal group for transparency
vim.cmd("highlight! link NvimTreeNormal Normal")

-- set cursor line color in nvim-tree
vim.cmd("highlight NvimTreeCursorLine guibg=#4a545e guifg=NONE")

-- configure nvim-tree
nvimtree.setup({
	view = {
		side = "right",
		width = "500",
	},
	-- change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false,
			},
			resize_window = false,
		},
	},
	update_focused_file = {
		enable = true,
	},
})

-- open nvim-tree on setup

local function open_nvim_tree(data)
	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
