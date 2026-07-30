local bookmarks = {}
local path_sep = package.config:sub(1, 1)
local home_path = os.getenv("HOME")

table.insert(bookmarks, {
	tag = "Desktop",
	path = home_path .. path_sep .. "Desktop" .. path_sep,
	key = "d",
})

require("yamb"):setup({
	bookmarks = bookmarks,
	jump_notify = true,
	cli = "fzf",
	keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
	path = home_path .. "/.config/yazi/bookmark",
})
