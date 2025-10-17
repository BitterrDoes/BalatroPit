return {
	descriptions = {
		Back = {
			b_nyankatro_nyanko = {
				name = "Nyanko",
				text = {
					"Only nyanko cards"
				}
			}
		},
		Blind = {
			bl_nyankatro_motherv = {
				name = "Queen Mother V",
				text = {
					"debuffs last 2",
					"played cards",
				}
			},
			bl_nyankatro_queenb = {
				name = "Queen B",
				text = {
					"must play 3 or",
					"less cards",
				}
			},
			bl_nyankatro_wahwah = {
				name = "King Wahwah",
				text = {
					"After 2 discards",
					"reduce hands and discards",
					"by 1",
				}
			},
			bl_nyankatro_wanwan = {
				name = "Everlord Wanwan",
				text = {
					"After 2 hands played, discard",
					"all cards and set hand",
					"limit to 10-X"
				}
			}
		},
		Joker = {
			j_nyankatro_mohawk_cat = {
				name = 'Mohawk Cat',
				text = {
					"{C:mult}+#1#{} Mult",
				}
			},
			j_nyankatro_eraser_cat = {
				name = 'Eraser Cat',
				text = {
					"{C:chips}+#1#{} Chips",
				}
			},
			j_nyankatro_dark_lazer = {
				name = 'Dark Lazer',
				text = {
					"{C:green}#1# in #2#{} chance to",
					"retrigger {C:attention}all{} played cards",
				}
			},
			j_nyankatro_courier_cat = {
				name = 'Courier Cat',
				text = {
					"Gains {C:mult}+#2#{} Mult",
					"for each {C:attention}red face{}",
					"card held in hand",
					"{C:inactive}(currently {C:mult}+#1#{C:inactive})",
				}
			},
			j_nyankatro_can_can_cat = {
				name = 'Can Can Cat',
				text = {
					"{C:mult}+#1#{} mult if scored",
					"hand is high card",
					"{C:mult}#2#{} mult otherwise",
				}
			},
			j_nyankatro_cyberpunk_cat = {
				name = 'Cyberpunk Cat',
				text = {
					"reduces {C:attention}denominator{} of all",
					"probability checks by {C:green}#1#{}",
				}
			},
			j_nyankatro_kasa_jizo = {
				name = 'Kasa Jizo',
				text = {
					"duplicate jokers may spawn.",
					"gains {X:mult,C:white}x#2#{} mult for each",
					"other Kasa Jizo.",
					"{C:inactive}currently {X:mult,C:white}x#1#{C:inactive} mult",
				}
			},
			j_nyankatro_mizli = {
				name = 'Mizli',
				text = {
					"gives {X:mult,C:white}x#1#{} for each time",
					"poker hand has been played this run",
				}
			},
			j_nyankatro_dark_cat = {
				name = 'Dark Cat',
				text = {
					"{C:attention}+#1#{} hand size",
				}
			},
			j_nyankatro_macho_legs_cat = {
				name = 'Macho Legs Cat',
				text = {
					"{C:blue}+#1#{} hand each round",
				}
			},
			j_nyankatro_bombercat = {
				name = 'Bombercat',
				text = {
					"after {C:attention}first hand{} of round,",
					"if leftmost card held in hand is",
					"{C:clubs}Clubs{} or {C:spades}Spades{}, destroy",
					"it and earn {C:money}+#1#${}",
				}
			},
			j_nyankatro_hermit_cat = {
				name = 'Hermit Cat',
				text = {
					"creates a {C:purple}Hermit{} card",
					"and deducts {C:money}#1#${}",
					"at start of blind",
				}
			},
			j_nyankatro_roe_cat = {
				name = 'Roe Cat',
				text = {
					"{X:mult,C:white}x#1#{} Mult",
					"{X:mult,C:white}-x#2#{} Mult per",
					"round played",
				}
			},
			j_nyankatro_soap_cat = {
				name = 'Soap Cat',
				text = {
					"{C:chips}#1#{} Chips",
					"{C:chips}-#2#{} Chips per",
					"round played",
				}
			},
			j_nyankatro_cats_in_the_cradle = {
				name = 'Cats in the Cradle',
				text = {
					"{X:mult,C:white}x#1#{} Mult",
					"when played hand contains {C:attention}#2#{}",
				}
			},
			j_nyankatro_sodom = {
				name = 'Sodom',
				text = {
					"Each played card gives {X:mult,C:white}x#1#{} Mult",
					"{C:attention}-#2#{} hand size",
				}
			},
			j_nyankatro_lion_cat = {
				name = 'Lion Cat',
				text = {
					"{C:red}+#1#{} discards",
				}
			},
			j_nyankatro_flying_cat = {
				name = 'Flying Cat',
				text = {
					"{C:mult}+#1#{} mult for each",
					"played {C:clubs}Clubs{}",
				}
			},
			j_nyankatro_holy_valkyrie_cat = {
				name = 'Holy Valkyrie Cat',
				text = {
					"{C:mult}+#1#{} mult, {C:mult}+#2#{}",
					"on your last hand",
				}
			},
			j_nyankatro_awakened_bahamut_cat = {
				name = 'Awakened Bahamut Cat',
				text = {
					"{C:chips}+#1#{} chips, self-destroys",
					"if round not cleared in one hand",
				}
			},
			j_nyankatro_stone_cat = {
				name = 'Stone Cat',
				text = {
					"adds {C:attention}Stone{} to last scoring",
					"card of first hand, if",
					"it is a {C:attention}Face Card{}",
				}
			},
			j_nyankatro_green_shell_cat = {
				name = 'Green Shell Cat',
				text = {
					"gives {C:mult}+#1#{} mult",
					"if there are no jokers to its right",
				}
			},
			j_nyankatro_pcat = {
				name = 'pCat',
				text = {
					"gains {X:mult,C:white} x#1# {} Mult",
					"per scoring {C:attention}red enhanced card{},",
					"removes card {C:attention}enhancement",
					"{C:inactive}(Currently {X:mult,C:white} x#2# {C:inactive} Mult)",
				},
			},
			j_nyankatro_bullet_train_cat = {
				name = 'Bullet Train Cat',
				text = {
					"gives {C:money}+#1#${} at end of round,",
					"{C:money}+#2#${} instead if cleared in one hand"
				}
			},
			j_nyankatro_nyan_cat = {
				name = 'Nyan Cat',
				text = {
					"sets chips to chips x mult",
					"mult to {C:mult}#1#{}"
				}
			},
			j_nyankatro_island_cat = {
				name = 'Island Cat',
				text = {
					"{C:mult}+#1#{} mult when",
					"{C:hearts}Hearts{} scored"
				}
			},
			j_nyankatro_king_dragon_cat = {
				name = 'King Dragon Cat',
				text = {
					"{C:mult}+#1#{} mult when",
					"{C:spades}Spades{} scored"
				}
			},
			j_nyankatro_jamiera_cat = {
				name = 'Jamiera Cat',
				text = {
					"{C:mult}+#1#{} mult when",
					"{C:diamonds}Diamonds{} scored"
				}
			},
			j_nyankatro_masked_yulala = {
				name = 'Masked Yulala',
				text = {
					"creates either {C:tarot}The Magician{} or",
					"{C:tarot}The Hierophant{} when blind selected"
				}
			},
			j_nyankatro_awakened_mina = {
				name = 'Awakened Mina',
				text = {
					"gains {C:mult}+#1#{} mult when",
					"{C:attention}Flush{} scored.",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
				}
			},
			j_nyankatro_crystal_cat = {
				name = 'Crystal Cat',
				text = {
					"if only one card scores",
					"convert it into a {C:attention}glass card{}"
				}
			},
			j_nyankatro_mushroom_cat = {
				name = 'Mushroom Cat',
				text = {
					"gains {C:chips}+#2#{} chips for each",
					"black {C:attention}2, 3, or 4{} in hand.",
					"{C:inactive}currently {C:chips}#1#{} chips",
				}
			},
			j_nyankatro_sniper_the_deadeye = {
				name = 'Sniper the Deadeye',
				text = {
					"if you lose with score {C:attention}< 1% of target{},",
					"destroys self and prevents death",
				}
			},
			j_nyankatro_fishman_cat = {
				name = 'Fishman Cat',
				text = {
					"when sold, destroy all face cards",
					"in hand and add 2 discards",
				}
			},
			j_nyankatro_divine_kuu = {
				name = 'Divine Kuu',
				text = {
					"each card gives {X:mult,C:white}x#1#{} mult",
					"on last hand",
				}
			},
			j_nyankatro_almighty_aphrodite = {
				name = 'Almighty Aphrodite',
				text = {
					"gives {X:mult,C:white}x#1#{} mult if score",
					"is between {C:attention}1/#2# and 1/#3#{}",
					"of target at start of hand",
				}
			},
			j_nyankatro_immortal_nobunaga = {
				name = 'Immortal Nobunaga',
				text = {
					"{C:attention}+1 hand{} if all scored cards",
					"are {C:spades}spades{} or {C:clubs}clubs{} and",
					"hand scores {C:attention}< 10%{} of target",
				}
			},
			j_nyankatro_jester_queen_deale = {
				name = 'Jester Queen Deale',
				text = {
					"converts played {C:attention}unenhanced{} cards into {C:chips}bonus{} cards",
					"converts played {C:chips}bonus{} cards into {C:mult}mult{} cards",
					"converts played {C:mult}mult{} cards into {C:attention}unenhanced{} cards",
				}
			},
			j_nyankatro_lumina = {
				name = 'Lumina',
				text = {
					"gives {C:white,X:mult}xMult{} equal to #1# times",
					"the level of scored hand",
					"{C:green}1 in #2#{} chance to upgrade",
					"scored hand",
				}
			},
			j_nyankatro_gaia_the_creator = {
				name = 'Gaia the Creator',
				text = {
					"gives {C:chips}+#1#{} chips, {C:mult}+#2#{} mult",
					"{C:white,X:mult}x#3#{} mult, and {C:money}$#4#{} when",
					"scored hand contains {C:attention}straight flush{}",
				}
			},
		}
	}
}