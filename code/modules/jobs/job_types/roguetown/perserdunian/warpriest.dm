/datum/job/roguetown/warpriest
	title = "War Priest"
	flag = WARPRIEST
	department_flag = PERSERDUN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_TEMPERANCE_NO_BM
	allowed_patrons = list(/datum/patron/godless/perserdun)
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)

	tutorial = "You're the right hand man of the Grandmaster. Essentially a combative Lieutenant. \
				Your main goal is to act as a force multiplier for the Perserdunians.\
				You do this by bringing up the rear in charges & dealing with stragglers. \
				Typically, Grand Knights are selected from the few pre-machine noble lineages that remain within the Empire. \
				Grand Knights are unique in that they are a symbolic representation of the pre-machine Empire's strength." 

	outfit = /datum/outfit/job/roguetown/warpriest
	display_order = JDO_WARPRIEST
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null

	cmode_music = 'sound/music/cmode/church/combat_astrata.ogg'

/datum/job/roguetown/warpriest/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.wear_ring, /obj/item/roguekey/perserdun))
			var/obj/item/clothing/S = H.wear_ring
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = " [index]'s dogtag"

/datum/outfit/job/roguetown/warpriest
	allowed_patrons = list(/datum/patron/godless/perserdun)

/datum/outfit/job/roguetown/warpriest/pre_equip(mob/living/carbon/human/H)
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	beltl = /obj/item/flashlight/flare/torch/lantern
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/warpriest
	cloak = /obj/item/clothing/cloak/perserduntabard
	pants = /obj/item/clothing/under/roguetown/tights/black
	head = /obj/item/clothing/head/roguetown/priestmask
	mask = /obj/item/clothing/mask/rogue/gasmask/perserdunmask
	neck = /obj/item/clothing/neck/roguetown/psicross/astrata
	belt = /obj/item/storage/belt/rogue/leather/black/soldier
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/grenade/gas/poison
	wrists = /obj/item/scomstone/garrison
	id = /obj/item/roguekey/perserdun
	backr = /obj/item/storage/backpack/rogue/backpack/perserdun
	backpack_contents = list(
		/obj/item/storage/belt/rogue/pouch/coins/rich,
		/obj/item/grenade/gas/poison,
		/obj/item/bomb/dynamite,
	)
	H.adjust_skillrank(/datum/skill/craft/alchemy, 3, TRUE)
	H.adjust_skillrank(/datum/skill/magic/blood, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
	H.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.change_stat("strength", -1)
	H.change_stat("constitution", -1)
	H.change_stat("endurance", 2)
	H.change_stat("perception", 2)
	H.change_stat("intelligence", 4)
	H.change_stat("speed", -1)

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/blood)
		// H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/blood_heal)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/bloodneedle)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/blood_link)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/piercing_blood)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodsiphon)
		// H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/bloodcrawl)
	ADD_TRAIT(H, TRAIT_RABCHOSEN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
