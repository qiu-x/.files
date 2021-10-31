-- Plugins
require('vis') -- Load standard vis module, providing parts of the Lua API
require('plugins/title') -- Change terminal title to file path
require('plugins/cursors') -- Save cursor location on exit
require('plugins/vis-commentary') -- Bindings to comment out lines in different langs
require('plugins/fzf-open') -- Open file using fzf
require('plugins/fzf-db') -- fzf based directory browser
require('plugins/fzf-mru') -- fzf - most recently used files
require('plugins/fzf-grep') -- fzf - grep current dir
require('plugins/surround') -- Like vim-surround
require('plugins/goto-file') -- gf command support
require('plugins/sneak') -- Like vim-sneak

-- My custom settings
dofile('/home/qiu/.config/vis/cfg/perfile.lua') -- Per file stuff
dofile('/home/qiu/.config/vis/cfg/cmds.lua') -- Key bindings
dofile('/home/qiu/.config/vis/cfg/bindings.lua') -- Key bindings
dofile('/home/qiu/.config/vis/cfg/status.lua') -- Key bindings

term = "st"

vis.events.subscribe(vis.events.INIT, function()
	-- Global configuration options
	vis:command('set theme gruvbox')
	vis.modes.NORMAL = 'NORMAL'
	vis.modes.OPERATOR_PENDING = 'OPERATOR PENDING'
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Per window configuration options
	vis:command('set relativenumber')
	vis:command('set colorcolumn 80')
	vis:command('set escdelay 0')
	vis:command('set ai on')
	vis:command('set cul on')
	vis:command('set tw 5')
	vis:command('set savemethod inplace')
end)

