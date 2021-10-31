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

vis:command_register("fzfdb", function(force, win, selection, range)
	fzfdb_path = "~/.config/vis/fzfdb.sh"
	local command = fzfdb_path

	local file = io.popen(command)
	local output = file:read()
	local success, msg, status = file:close()

	if status == 0 then 
		vis:command(string.format("e '%s'", output))
		-- vis:feedkeys(string.format(":e '%s'", output))
	elseif status == 1 then
		vis:info(string.format("fzfdb: No match. Command %s exited with return value %i." , command, status))
	elseif status == 2 then
		vis:info(string.format("fzfdb: Error. Command %s exited with return value %i." , command, status))
	elseif status == 130 then
		vis:info(string.format("fzfdb: Interrupted. Command %s exited with return value %i" , command, status))
	else
		vis:info(string.format("fzfdb: Unknown exit status %i. command %s exited with return value %i" , status, command, status, status))
	end

	vis:feedkeys("<vis-redraw>")

	return true;
end)

return module
