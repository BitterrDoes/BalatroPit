-- variables
local ts_mod = SMODS.current_mod

-- load stuf
-- Fucntions

function ts_mod.Load_file(file) -- basically just SMODS.load_file() but safer, so i can accidentally have somethign break and it be chill
	local chunk = SMODS.load_file(file, "BalatroPit")
	if chunk then
		local ok, func = pcall(chunk)
		if ok then
			return func
		end
	end
	return nil
end

function ts_mod.Load_Dir(directory)
	local files = NFS.getDirectoryItems(ts_mod.path .. "/" .. directory)
	local regular_files = {}

	for _, filename in ipairs(files) do -- iterate over all files in the directory
		local file_path = directory .. "/" .. filename
		if file_path:match(".lua$") then -- check if its lua
			if filename:match("^_") then -- i dont even know
				ts_mod.Load_file(file_path) -- load lua file
			else
				table.insert(regular_files, file_path) -- add non lua to other table
			end
		end
	end

	for _, file_path in ipairs(regular_files) do
		ts_mod.Load_file(file_path) -- load the other things
	end
end

-- okay okay, actually load the objects now
ts_mod.Load_file("Atlases.lua")-- load the atlases, important
ts_mod.Load_file("Hook.lua")

ts_mod.Load_Dir("Objects")