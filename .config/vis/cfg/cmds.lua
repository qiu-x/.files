local module = {}

-- Make command
vis:command_register("make", function(argv, force, win, selection, range)
	local command = "!cd $(printf $PWD | sed s/src.*//); make " .. table.concat(argv, " ") .. " && true || read"
	vis:command(command)
	return true;
end, "Make")

-- Corutine test
vis:command_register("test", function(argv, force, win, selection, range)
	while( true )
	do
	end
	return true;
end, "Test")

-- sel command
vis:command_register("sel", function(argv, force, win, selection, range)
	local object = table.concat(argv, " ")
	action = {
		["c_func"] = "?^\\w.*\\(.*\\)?,/^\\}/"
	}
	vis:command(action[object])
	return true;
end, "Select")
