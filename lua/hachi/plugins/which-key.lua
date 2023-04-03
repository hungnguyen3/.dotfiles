local mappings = {}
local opts = {}

--import which-key safely
local status_wk, wk = pcall(require, "which-key")
if not status_wk then
	return
end

wk.register(mappings, opts)
