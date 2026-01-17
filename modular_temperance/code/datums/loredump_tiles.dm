/*
LOREDUMP TILES.

There are the actual tiles that dispense lore unto thee. 
Very handy, eh?
*/

/obj/effect/loretile
	name = "Lore Tile"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x2"
	anchored = TRUE
	layer = HIGH_LANDMARK_LAYER
	invisibility = INVISIBILITY_ABSTRACT
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

	//This is what actually contains the loreblurb it'll dispense upon a man...
	var/datum/loreblurb/lore = null


/obj/effect/loretile/Crossed(AM as mob|obj)
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		if(lore)
			var/datum/loreblurb/lore_instance = new lore
			lore_instance.onEncounter(H)


//Just an example cuz
/obj/effect/loretile/ruinedcity
	name = "Ruined City Lore Tile"
	lore = /datum/loreblurb/ruined_city

/obj/effect/loretile/butchersblock
	name = "Butcher's Block Lore Tile"
	lore = /datum/loreblurb/butchersblock

/obj/effect/loretile/outpostxiphos
	name = "Outpost Xiphos Lore Tile"
	lore = /datum/loreblurb/outpostxiphos
