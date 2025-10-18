-- charms = jokers

--[[

    example    JOKER_NAME: Line ### to ### | DESCRIPTION

    Clover Voucher: Line 15 to 48 | Doesn't take space, +4 tickets 
    Red Pepper: Line 53 to 94 | Triggers randomly (20%): Luck+5 for the current spin. Discard after 12 activations. 
    Green Pepper: Line 51 to 94 | Triggers randomly (15%): Luck+7 for the current spin. Discard after 9 activations. 
    Red Pepper: Line 51 to 94 | Triggers randomly (10%): LLuck+0 for the current spin. Whenever 3+ Patterns trigger during a spin, increase this bonus by 3 until the end of the deadline. 

--]]

--Clover Voucher
SMODS.Joker {
    key = 'Clov-Voucher',
	loc_txt = {
		name = 'Clover Voucher',
		text = {
			"+4 Tickets after closing shop",
			"Destroyed after use.",
		}
	},
	config = { extra = {Tickets = 4} },
	rarity = 1,
	atlas = 'ModdedVanilla',
	pos = { x = 4, y = 0 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.Tickets}}
	end,

    calculate = function(self, card, context)
        if context.ending_shop then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = "0.35",
                        func = function()
                            SMODS.destroy_cards(card) -- idk which one works please dm me it 😭😭😭😭
                            return true
                        end
                    }))
                end,
                dollars = card.ability.extra.Tickets * 2
            }
        end 
    end
}

-- peppers
SMODS.Joker {
    key = 'Pepper_Red',
	loc_txt = {
		name = 'Red Pepper',
		text = {
			"Triggers randomly (#1#%):",
            "Luck+#2# for the current spin.",
            "Discard after 12 activations. (#3# left)",
		}
	},
	config = { extra = {Chance = 40, Luck = 10, uses = 12} },
	rarity = 1,
	atlas = 'ModdedVanilla',
	pos = { x = 4, y = 0 },
	cost = 2, -- for now tickets = money / 2
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.Chance, card.ability.extra.Luck, card.ability.extra.uses}}
	end,

    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.uses = card.ability.extra.uses - 1
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                       delay = "0.1",
                    func = function()
                        if card.ability.extra.uses <= 0 then
                            SMODS.destroy_cards(card)
                        end
                        return true
                    end
                }))
            if math.random() <= card.ability.extra.Chance / 100 then
                return {
                    mult = card.ability.extra.Luck
                }
            else
                return {
                    message = "Failed!"
                }
            end
        end 
    end
}

SMODS.Joker {
    key = 'Pepper_Green',
	loc_txt = {
		name = 'Green Pepper',
		text = {
			"Triggers randomly (#1#%):",
            "Luck+#2# for the current spin.",
            "Discard after 12 activations. (#3# left)",
		}
	},
	config = { extra = {Chance = 30, Luck = 14, uses = 9} },
	rarity = 1,
	atlas = 'ModdedVanilla',
	pos = { x = 4, y = 0 },
	cost = 4, -- for now tickets = money / 2
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.Chance, card.ability.extra.Luck, card.ability.extra.uses}}
	end,

    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.uses = card.ability.extra.uses - 1
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                       delay = "0.1",
                    func = function()
                        if card.ability.extra.uses <= 0 then
                            SMODS.destroy_cards(card)
                        end
                        return true
                    end
                }))
            if math.random() <= card.ability.extra.Chance / 100 then
                return {
                    mult = card.ability.extra.Luck
                }
            else
                return {
                    message = "Failed!"
                }
            end
        end 
    end
}

SMODS.Joker {
    key = 'Pepper_Rotten',
	loc_txt = {
		name = 'Rotten Pepper',
		text = {
			"Triggers randomly (#1#%):",
            "Luck+#2# for the current spin.",
            "Whenever 4+ cards used increase +#3# luck, resets from beating big blind",
		}
	},
	config = { extra = {Chance = 20, Luck = 0, add = 6, Requirement = 0} },
	rarity = 2,
	atlas = 'ModdedVanilla',
	pos = { x = 4, y = 0 },
	cost = 4, -- for now tickets = money / 2
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.Chance, card.ability.extra.Luck, card.ability.extra.add, card.ability.extra.Requirement}}
	end,

    calculate = function(self, card, context)
        if context.joker_main then
            if #G.play.cards > card.ability.extra.Requirement then
                card.ability.extra.Luck = card.ability.extra.Luck + card.ability.extra.add
            end

            if  math.random() > card.ability.extra.Chance / 100 then return {message = "Failed!"} end

            return {
                mult = card.ability.extra.Luck
            }

        elseif context.end_of_round and G.GAME.blind.boss then
            card.ability.extra.Luck = 0
        end
    end
}