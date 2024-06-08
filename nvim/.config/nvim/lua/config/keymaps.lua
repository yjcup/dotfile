local map = vim.keymap -- for conciseness
map.set("v", "y", '"+y', { desc = "change" })

-- Move to window using the <ctrl> hjkl keys
map.set("n", "<c-h>", "<c-w>h", { desc = "movewindow" })
map.set("n", "<c-j>", "<c-w>j", { desc = "movewindow" })
map.set("n", "<c-k>", "<c-w>k", { desc = "movewindow" })
map.set("n", "<c-l>", "<c-w>l", { desc = "movewindow" })

map.set({ "n", "v" }, "J", "5j", { desc = "5j" })
map.set({ "n", "v" }, "K", "5k", { desc = "5j" })
