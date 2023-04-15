--import harpoon safely
local status_harpoon, harpoon = pcall(require, "harpoon")
if not status_harpoon then
	return
end

-- import harpoon mark safely
local status, mark = pcall(require, "harpoon.mark")
if not status then
	return
end

-- import harpoon ui safely
local status_ui, ui = pcall(require, "harpoon.ui")
if not status_ui then
	return
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-b>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-g>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<C-y>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<C-i>", function()
	ui.nav_file(4)
end)

harpoon.setup()
