-- this makes me control what can and cant go through pool

local smods_add_to_pool = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, args)
    print("Using add_to_pool from hook")
	if G.GAME.selected_back_key ~= nil and G.GAME.selected_back_key.add_to_pool ~= nil then
		if not G.GAME.selected_back_key:add_to_pool(prototype_obj, args) then
            print("Removing object ", prototype_obj.key)
			return false
		end
	end
    print("Adding object ", prototype_obj.key)
	return smods_add_to_pool(prototype_obj, args)
end