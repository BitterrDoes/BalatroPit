-- this makes me control what can and cant go through pool

local smods_add_to_pool = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, args)
	if G.GAME.selected_back_key ~= nil and G.GAME.selected_back_key.add_to_pool ~= nil then
		if not G.GAME.selected_back_key:add_to_pool(prototype_obj, args) then
			return false
		end
	end
	return smods_add_to_pool(prototype_obj, args)
end

local Game_start_run = G.GAME.start_run
-- G.GAME.start_run = function()
	
-- 	print("testing1")

-- 	return Game_start_run
-- end

function SMODS.current_mod.reset_game_globals(init)
	if init then
		print('1')
		SMODS.change_voucher_limit(2)
	end
	print("2")
end