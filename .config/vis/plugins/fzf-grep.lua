-- Copyright (C) 2017  Qiu
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

module = {}

vis:command_register("fzfgrep", function(argv, force, win, selection, range)
	grep_cmd = "grep -r -n 2>/dev/null"
	pipe_cmd = "| fzf --height 40% | grep -o '^.*:[0-9]*:' | sed 's/:/./; s/://g'"
	local command = grep_cmd .. " " .. table.concat(argv, " ") .. " " .. pipe_cmd

	local file = io.popen(command)
	local output = file:read()
	local success, msg, status = file:close()

	if output == nil then
		vis:info(string.format("fzf-grep: No match. Command %s exited with return value %i." , command, status))
		vis:feedkeys("<vis-redraw>")
		return true
	end

	if status == 0 then 
		ln = output:match("^.+(%..+)$"):sub(2, output:match("^.+(%..+)$"):len())
		fn = output:match(".*[.]"):sub(1, output:match(".*[.]"):len()-1)
		vis:command(string.format("e '%s'", fn))
		if vis.win.file.name == fn then
			vis:command(string.format("%s", ln))
		end
	elseif status == 1 then
		vis:info(string.format("fzf-grep: No match" , command, status))
	elseif status == 2 then
		vis:info(string.format("fzf-grep: Error" , command, status))
	elseif status == 130 then
		vis:info(string.format("fzf-grep: Interrupted" , command, status))
	else
		vis:info(string.format("fzf-grep: Unknown exit status %i" , status, command, status, status))
	end

	vis:feedkeys("<vis-redraw>")

	return true;
end)

return 