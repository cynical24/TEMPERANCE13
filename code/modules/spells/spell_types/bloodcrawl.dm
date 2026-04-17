/obj/effect/proc_holder/spell/invoked/bloodcrawl
	name = "Blood Crawl"
	desc = ""
	recharge_time = 30 SECONDS
	clothes_req = FALSE
	//If you couldn't cast this while phased, you'd have a problem
	phase_allowed = TRUE
	selection_type = "range"
	chargetime = 10 SECONDS
	chargedrain = 1
	releasedrain = 50
	range = 1
	overlay_state = "bloodcrawl"
	// sound = null
	invocation_type = "none"
	associated_skill = /datum/skill/magic/blood
	antimagic_allowed = TRUE
	chargedloop = /datum/looping_sound/invokeascendant // need to find bubbling sound somewhere or something
	charging_slowdown = 3
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	glow_color = GLOW_COLOR_VAMPIRIC
	glow_intensity = GLOW_INTENSITY_HIGH
	var/phased = FALSE

/obj/effect/proc_holder/spell/invoked/bloodcrawl/perform(list/targets, recharge = 1, mob/living/user = usr)
	var/turf/T = get_turf(user)
	for(var/obj/effect/decal/cleanable/target in T)
		if(target.can_bloodcrawl_in())
			if(phased)
				if(user.phasein(target))
					phased = FALSE
			else
				if(user.phaseout(target))
					phased = TRUE
			start_recharge()
			return
	revert_cast()
	to_chat(user, span_warning("There's no blood to phase into!"))
