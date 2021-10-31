local module = {}

--
-- File specific bindings
--

function apply_per_window_options(win)
		if(win.file.name)
	then
		action = {
			[".tex"] = function()
				vis:command_register("run", function(argv, win)
					vis:command("!mupdf-x11 ${vis_filepath%.*}.pdf 2>/dev/null 2>&1 &")
					return true;
				end, "Run program")

				vis:command_register("compile", function(argv, win)
					vis:command("w")
					vis:command("!cd ${vis_filepath%/*}; xelatex " .. table.concat(argv, " ") .. " $vis_filename && true || read")
					return true;
				end, "Compile file")
			end,
			[".md"] = function()
				vis:command_register("run", function(argv, win)
					vis:command("!mupdf-x11 ${vis_filepath%.*}.pdf 2> /dev/null 2>&1 &")
					return true;
				end, "View document")

				vis:command_register("compile", function(argv, win)
					vis:command("w")
					vis:command("!pandoc $vis_filepath -o ${vis_filepath%.*}.pdf " .. table.concat(argv, " ") .. " && true || read")
					return true;
				end, "Compile document")
			end,
			[".c" or win.file.name:match("^.+(%..+)$") == ".h"] = function()
				vis:command_register("run", function(argv, win)
					vis:command("!${vis_filepath} " .. table.concat(argv, " ") .. "; printf \"Vis: Program closed\"; read")
					return true;
				end, "Run program")

				vis:command_register("compile", function(argv, win)
					vis:command("w")
					vis:command("!gcc $vis_filepath -Wall -o ${vis_filepath%.*} " .. table.concat(argv, " ") .. " && true || read")
					return true;
				end, "Compile file")
			end	,
			[".cpp" or win.file.name:match("^.+(%..+)$") == ".hpp"] = function()
				vis:command_register("run", function(argv, win)
					vis:command("!${vis_filepath} " .. table.concat(argv, " ") .. "; printf \"Vis: Program closed\"; read")
					return true;
				end, "Run program")
				
				vis:command_register("compile-file", function(argv, win)
					vis:command("w")
					vis:command("!g++ $vis_filepath -Wall -o ${vis_filepath%.*} " .. table.concat(argv, " ") .. " && true || read")
					return true;
				end, "Compile file")

			end	,
			[".go"] = function()
				vis:command_register("run", function(argv, win)
					vis:command("!go run ${vis_filepath} " .. table.concat(argv, " ") .. "; printf \"Vis: Program closed\"; read")
					return true;
				end, "Run program")

				vis:command_register("compile-file", function(argv, win)
					vis:command("w")
					vis:command("!go build -o ${vis_filepath%.*} ${vis_filepath} " .. table.concat(argv, " ") .. " && true || read")
					return true;
				end, "Compile file")

				vis:command_register("compile", function(argv, win)
					vis:command("w")
					vis:command("!go build" .. table.concat(argv, " ") .. " && true || read")
					return true;
				end, "Compile project")
			end	,
			[".sh"] = function()
				-- Default "run" command
				vis:command_register("run", function(argv, win)
					vis:command("!${vis_filepath}; printf \"Vis: Program closed\"; read")
					return true;
				end, "Run program")
			end,
		}
		if(action[win.file.name:match("^.+(%..+)$")] ~= nil)
		then
			action[win.file.name:match("^.+(%..+)$")]()
		end
	end
end

vis.events.subscribe(vis.events.WIN_OPEN, apply_per_window_options)
