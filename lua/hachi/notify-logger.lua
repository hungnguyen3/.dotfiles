local log_path = vim.fn.stdpath("cache") .. "/vim_notify.log"

local original_notify = vim.notify

vim.notify = function(msg, log_level, opts)
	original_notify(msg, log_level, opts)

	local log_file = io.open(log_path, "a")
	log_file:write(os.date("%Y-%m-%d %H:%M:%S") .. " - " .. msg .. "\n")
	log_file:close()
end
