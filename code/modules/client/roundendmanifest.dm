/client/proc/view_rogue_manifest()
	var/dat
	dat += "<h3>Round ID: [GLOB.rogue_round_id]</h1>"
	for(var/X in GLOB.character_list)
		dat += "[GLOB.character_list[X]]"

	var/datum/browser/popup = new(src, "actors", "<center>Victims of Temperance</center>", 387, 420)
	popup.set_content(dat)
	popup.open(FALSE)

/client/proc/view_actors_manifest()
	var/list/actors_list = get_sorted_actors_list()
	var/list/categories_used = list()
	var/dat
	var/list/categories = list(
		"Perserdun" = GLOB.perserdun_positions,
		"Risvon" = GLOB.risvon_positions,
		"King's Row" = GLOB.kingsrow_positions,
		"Nobody" = GLOB.nonaffiliated_positions,
	)

	for(var/mob_id in actors_list)
		var/list/actor_data = actors_list[mob_id]
		var/category = actor_data["category"] //Gets the actor's cateogry and puts it in 'category' for us

		if(!(category in categories_used))
			var/cat_color = COLOR_WHITE
			if(length(categories_used))
				dat += "<br>"
			if(category in categories)
				var/current_category = categories[category]
				cat_color = SSjob.name_occupations[current_category[1]].selection_color
			dat += "<center><h1 style='padding-top: 0; bold; color: [cat_color]'>-- [category] --</h1></center>"
			categories_used += category
		var/list/character_data = actor_data["data"]
		dat += "<b>[character_data["name"]]</b> as <b>[character_data["rank"]]</b><br>"

	var/datum/browser/popup = new(src, "actors", "<center>This Battle's Victims</center>", 387, 420)
	popup.set_content(dat)
	popup.open(FALSE)

/client/proc/view_roleplay_ads()
	var/dat
	for(var/X in GLOB.roleplay_ads)
		dat += "[GLOB.roleplay_ads[X]]"

	var/datum/browser/popup = new(src, "actors", "<center>Roleplay Ads</center>", 500, 600)
	popup.set_content(dat)
	popup.open(FALSE)
