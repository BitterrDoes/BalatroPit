-- decks = memory cards
-- keep red/blue decks
-- rounds end on 0 hands left, extra tokens will be processed to give more hands next round (max idk 7)

-- for testing
SMODS.Atlas {
		key = "NyankoBack",
		path = "NyankoBack.png",
		px = 71,
		py = 95
	}

SMODS.Back {
	key = "nyanko",
	atlas = 'NyankoBack',
	pos = { x = 0, y = 0 },
	unlocked = true,
	loc_vars = function(self, info_queue, back)
		return {}
	end,
	add_to_pool = function(self, prototype_obj, args)
		if (prototype_obj ~= nil and prototype_obj.key ~= nil)
				and (prototype_obj.key:find("^j_") or prototype_obj.key:find("^bl_"))
				and not prototype_obj.key:find('CloverPit') then
			return false
		end
		return true
	end
}