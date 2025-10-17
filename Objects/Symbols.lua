-- suits = symbols

SMODS.Atlas { key = 'lc_cards', path = '8BitDeck.png', px = 71, py = 95 }
SMODS.Atlas { key = 'hc_cards', path = '8BitDeck_opt2.png', px = 71, py = 95 }
SMODS.Atlas { key = 'lc_ui', path = 'ui_assets.png', px = 18, py = 18 }
SMODS.Atlas { key = 'hc_ui', path = 'ui_assets_opt2.png', px = 18, py = 18 }
SMODS.Atlas { key = 'modicon', path = 'ui_assets.png', px = 18, py = 18 }

local function allow_suits(self, args)
    if args and args.initial_deck then
        return SMODS.current_mod
    end
    return true
end

-- Suits
SMODS.Suit { -- temp moons
    key = 'Moons',
    card_key = 'MOON',
    loc_txt = {
        singular = "Moon",
        plural = "Moons",
    },

    hc_atlas = 'hc_cards', -- high contrast
    lc_atlas = 'lc_cards', -- low contrast
    hc_ui_atlas = 'hc_ui', -- high contrast but the small ui icons
    lc_ui_atlas = 'lc_ui', -- low contrast but the small ui icons
    hc_colour = HEX('696076'),
    lc_colour = HEX('696076'),

    in_pool = allow_suits,

    pos = { y = 1 }, -- be organised in rows
    ui_pos = { x = 1, y = 0 },
}
SMODS.Suit { -- temp stars
    key = 'Stars',
    card_key = 'STAR',
    loc_txt = {
        singular = "Star",
        plural = "Stars",
    },

    hc_atlas = 'hc_cards',
    lc_atlas = 'lc_cards',
    hc_ui_atlas = 'hc_ui',
    lc_ui_atlas = 'lc_ui',
    hc_colour = HEX('DF509F'),
    lc_colour = HEX('DF509F'),

    in_pool = allow_suits,

    pos = { y = 0 },
    ui_pos = { x = 0, y = 0 },
}