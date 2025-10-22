-- variables
cloverpit = SMODS.current_mod
cloverpit.StoredChips = 0
cloverpit.ModsUsing = #NFS.getDirectoryItems(string.reverse(string.sub(string.reverse(cloverpit.path), 9, -1))) -- i dunno how to get name of mod folder so ig this is enough
-- Fucntions

function cloverpit.Load_file(file) -- basically just SMODS.load_file() but safer, so i can accidentally have somethign break and it be chill
	local chunk = SMODS.load_file(file, "BalatroPit")
	if chunk then
		local ok, func = pcall(chunk)
		if ok then
			return func
		end
	end
	return nil
end

function cloverpit.Load_Dir(directory)
	local files = NFS.getDirectoryItems(cloverpit.path .. "/" .. directory)
	local regular_files = {}

	for _, filename in ipairs(files) do -- iterate over all files in the directory
		local file_path = directory .. "/" .. filename
		if file_path:match(".lua$") then -- check if its lua
			if filename:match("^_") then -- i dont even know
				cloverpit.Load_file(file_path) -- load lua file
			else
				table.insert(regular_files, file_path) -- add non lua to other table
			end
		end
	end

	for _, file_path in ipairs(regular_files) do
		cloverpit.Load_file(file_path) -- load the other things
	end
end

-- okay okay, actually load the objects now
cloverpit.Load_file("Atlases.lua")
cloverpit.Load_Dir("Scripts")
cloverpit.Load_Dir("Scripts/Objects")
cloverpit.Load_Dir("Scripts/JokeObjects")

--  mod related things??
cloverpit.calculate = function(self, context)
	if context.buying_card and context.card.ability.set == "Voucher" then
		-- delete the other ones
		SMODS.destroy_cards(G.shop_vouchers.cards)
		for i, _ in pairs(G.GAME.current_round.voucher.spawn) do -- v = Boolean, determines if it spawns or not
			G.GAME.current_round.voucher.spawn[i] = false -- because fuck me i guess, and ignore me, HOLY SHIT IT DIDNT IGNORE ME!!
		end
	elseif context.setting_blind then
		G.E_MANAGER:add_event(Event({	--| Will set chips to the amount earned (FIRST TRY BTW LETS GOOO)
			trigger = "ease",
			delay = 2,
			ref_table = G.GAME,
			ref_value = "chips",
			ease_to = cloverpit.StoredChips,
		}))
	elseif context.end_of_round then
		cloverpit.StoredChips = G.GAME.chips -- set stored
	end
end
---- WAHHHHH I CANT DO THE UI