-- charms = jokers

--[[

    example    JOKER_NAME (key): Line ### to ### | DESCRIPTION (will be the description in cloverpit not balatro)

    Clover Voucher(Clov-Voucher): Line 25 to 60 | Doesn't take space, +4 tickets 
    Red Pepper(pep_red): Line 62 to 105 | Triggers randomly (20%): Luck+5 for the current spin. Discard after 12 activations. 
    Green Pepper(pep_green): Line 107 to 150 | Triggers randomly (15%): Luck+7 for the current spin. Discard after 9 activations. 
    rotten Pepper(pep_rotten): Line 152 to 187 | Triggers randomly (10%): Luck+0 for the current spin. Whenever 3+ Patterns trigger during a spin, increase this bonus by 3 until the end of the deadline. 
    Clicker(clicker): Line 189 to 221 | +15% chance for the Symbols (lemon, cherry) to have the Repetition Modifier . 
    Cat Food(cfood): Line 223 to 254 | Grants Luck+7 for the last spin of a round. 
    Rotated Hamsa(rham): Line ### to ### | description
    Pentacle(pent): Line 313 to 333 | description
    Horseshoe(horshe): Line 335 to ### | Charms with "Triggers Randomly" activate double more often. 
    empty: Line ### to ### | description
    empty: Line ### to ### | description
    empty: Line ### to ### | description
    empty: Line ### to ### | description
    empty: Line ### to ### | description

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
    blueprint_compat = false,
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
    -- red pepper
SMODS.Joker {
    key = 'pep_red',
	loc_txt = {
		name = 'Red Pepper',
		text = {
			"Triggers randomly (#1#%):",
            "Luck+#2# for the current spin.",
            "Discard after 12 activations. (#3# left)",
		}
	},
    blueprint_compat = true,
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
            if SMODS.pseudorandom_probability(card, 'pep_red', card.ability.extra.Chance, 100, 'identifier') then
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
    -- green pepper
SMODS.Joker {
    key = 'pep_green',
	loc_txt = {
		name = 'Green Pepper',
		text = {
			"Triggers randomly (#1#%):",
            "Luck+#2# for the current spin.",
            "Discard after 12 activations. (#3# left)",
		}
	},
    blueprint_compat = true,
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
            if SMODS.pseudorandom_probability(card, 'pep_green', card.ability.extra.Chance, 100, 'identifier') then
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
    -- rotten pepper
SMODS.Joker {
    key = 'pep_rotten',
	loc_txt = {
		name = 'Rotten Pepper',
		text = {
			"Triggers randomly (#1#%):",
            "Luck+#2# for the current spin.",
            "Whenever 4+ cards used increase +#3# luck, resets from beating boss blind",
		}
	},
    blueprint_compat = true,
	config = { extra = {Chance = 20, Luck = 0, add = 6, Requirement = 0} },
	rarity = 3,
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

            if SMODS.pseudorandom_probability(card, 'pep_green', card.ability.extra.Chance, 100, 'identifier') then return {message = "Failed!"} end

            return {
                mult = card.ability.extra.Luck
            }

        elseif context.end_of_round and G.GAME.blind.boss then
            card.ability.extra.Luck = 0
        end
    end
}
    -- clicker
SMODS.Joker {
    key = 'clicker',
	loc_txt = {
		name = 'Clicker',
		text = {
			"+#1#% chance for drawn fruit cards to have the #2# seal.",
		}
	},
    blueprint_compat = false,
	config = { extra = {Chance = 15, Seal = "Red"} },
	rarity = 2,
	atlas = 'ModdedVanilla',
	pos = { x = 4, y = 0 },
	cost = 6, -- for now tickets = money / 2
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.Chance, card.ability.extra.Seal}}
	end,

    calculate = function(self, card, context)
        if context.hand_drawn and context.hand_drawn then
            print("drawing cards")
            for i, other_card in pairs(context.hand_drawn) do
                if SMODS.pseudorandom_probability(card, 'pep_green', card.ability.extra.Chance, 100, 'identifier') then
                    other_card:set_seal(card.ability.extra.Seal,nil,true)
                    print("adding seal")
                else
                    print("idiot failed")
                end
            end

            
        end
    end
}
    -- cat food
SMODS.Joker {
    key = 'cfood',
	loc_txt = {
		name = 'Cat Food',
		text = {
			"+#1# hands per round.",
		}
	},
    blueprint_compat = true,
	config = { extra = {hands = 2} },
	rarity = 1,
	atlas = 'ModdedVanilla',
	pos = { x = 4, y = 0 },
	cost = 8, -- for now tickets = money / 2
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.hands}}
	end,

    calculate = function(self, card, context)
        if context.setting_blind then -- taken from burglar
              G.E_MANAGER:add_event(Event({
                func = function()
                    ease_hands_played(card.ability.extra.hands)
                    SMODS.calculate_effect(
                        { message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.hands } } },
                        context.blueprint_card or card)
                    return true
                end
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
    end
}
    -- Rotated Hamsa
SMODS.Joker {
    key = 'rham',
	loc_txt = {
		name = 'Rotated Hamsa',
		text = {
			"Grants Luck x#1# when on last hand.",
		}
	},
    blueprint_compat = true,
	config = { extra = {xmult = 2} },
	rarity = 1,
	atlas = 'ModdedVanilla',
	pos = { x = 4, y = 0 },
	cost = 6, -- for now tickets = money / 2
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.xmult}}
	end,

    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left == 0 then -- taken some what from burglar
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}
    -- Pentacle
SMODS.Joker {
    key = 'pent',
	loc_txt = {
		name = 'Pentacle',
		text = {
			"luck x#1#. multiplier grows by #3# Whenever 5 cards played.",
		}
	},
    blueprint_compat = true,
	config = { extra = {xmult = 1.1, Requirement = 5, add = 0.15} },
	rarity = 2,
	atlas = 'ModdedVanilla',
	pos = { x = 4, y = 0 },
	cost = 6, -- for now tickets = money / 2
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.xmult, card.ability.extra.Requirement, card.ability.extra.add}}
	end,

    calculate = function(self, card, context)
        if context.joker_main then -- taken from burglar
            if #G.play.cards >= card.ability.extra.Requirement then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.add
            end
        
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}
    -- Dear Diary
SMODS.Joker {
    key = 'diary',
	loc_txt = {
		name = 'Dear Diary',
		text = {
			"+1 Options at the telephone.",
		}
	},
    blueprint_compat = false,
	config = { extra = {limit = 4} },
	rarity = 2,
	atlas = 'ModdedVanilla',
	pos = { x = 4, y = 0 },
	cost = 6, -- for now tickets = money / 2
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.limit}}
	end,

    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            SMODS.change_voucher_limit(1) -- prolly a rly bad way to do this
        end
    end
}
    -- Horseshoe
SMODS.Joker {
    key = 'horshe',
	loc_txt = {
		name = 'Horseshoe',
		text = {
			"Charms that randomly activate, activate 2x often",
		}
	},
	config = { extra = {} },
    blueprint_compat = false,
	rarity = 1,
	atlas = 'ModdedVanilla',
	pos = { x = 4, y = 0 },
	cost = 6, -- for now tickets = money / 2
	loc_vars = function(self, info_queue, card)
		return { vars = {}}
	end,

    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator * 2
            }
        end
    end,
}
    -- Property Certificate
SMODS.Joker {
    key = 'propCert',
	loc_txt = {
		name = 'Property Certificate',
		text = {
			"Makes space for 2 more Lucky Charms.",
		}
	},
	config = { extra = {space = 2} },
    blueprint_compat = false,
	rarity = 2,
	atlas = 'ModdedVanilla',
	pos = { x = 4, y = 0 },
	cost = 4, -- for now tickets = money / 2
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.space}}
	end,

    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            
        end
    end,
}