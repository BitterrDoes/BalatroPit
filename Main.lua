-- variables
local ts_mod = SMODS.current_mod

-- we, YES WE, still use 'ts' 🍤🍤

-- add the objects	
-- Fucntions

function ts_mod.Load_file(file) -- totally not me shamelessly stealing code from multiplayer mod (i have no idea what im doing 😭)
	local chunk = SMODS.load_file(file, "BalatroPit") -- "BalatroPit" = mod id
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

	for _, filename in ipairs(files) do
		local file_path = directory .. "/" .. filename
		if file_path:match(".lua$") then
			if filename:match("^_") then
				ts_mod.Load_file(file_path)
			else
				table.insert(regular_files, file_path)
			end
		end
	end

	for _, file_path in ipairs(regular_files) do
		ts_mod.Load_file(file_path)
	end
end

-- okay okay, actually add the objects now
print(ts_mod, ts_mod.path)
ts_mod.Load_Dir("Objects")