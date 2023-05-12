-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine vscode theme
local lualine_vscode = require("lualine.themes.vscode")

-- new colors for theme
local new_colors = {
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

-- change nightlfy theme colors
-- lualine_vscode.normal.a.bg = new_colors.blue
-- lualine_vscode.insert.a.bg = new_colors.green
-- lualine_vscode.visual.a.bg = new_colors.violet

lualine_vscode.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black, -- black
	},
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = lualine_vscode,
	},
	tabline = { -- tabnine config for lualine
		lualine_a = {},
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	sections = { lualine_c = { "lsp_progress" }, lualine_x = { "tabnine" } },
})
