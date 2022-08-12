local module = {}

-- Completion with Ctrl+Space
vis:map(vis.modes.INSERT, "<C- >", "<C-n>")

-- Set syntax binding
vis:map(vis.modes.NORMAL, " s", ":set syntax ")

-- Binding to ':x/'
vis:map(vis.modes.NORMAL, " x", ":x/")
vis:map(vis.modes.VISUAL, " x", ":x/")

-- <Space>-z to save
local save_action = vis:action_register("save_action", function()
	vis:command("w")
	vis:info("The file has been saved!")
end, "Save file")
vis:map(vis.modes.VISUAL, " z", save_action)
vis:map(vis.modes.NORMAL, " z", save_action)

-- fzf binding
vis:map(vis.modes.NORMAL, " o", function()
		vis:command("fzf")
end, "\"fzf\" command binding")

-- Misc completion
vis:map(vis.modes.INSERT, "(", "<C-v>u0028)<Left>")
vis:map(vis.modes.INSERT, "'", "<C-v>u0027<C-v>u0027<Left>")
vis:map(vis.modes.INSERT, "\"", "<C-v>u0022<C-v>u0022<Left>")
vis:map(vis.modes.INSERT, "[", "<C-v>u005b]<Left>")

