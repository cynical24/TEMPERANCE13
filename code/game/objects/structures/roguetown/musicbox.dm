#define MUSIC_TAVCAT_OTHERWORLDLY list(\
	"PEACE" = 'sound/music/jukeboxes/otherworld/song1.ogg',\
	"FOR ME" = 'sound/music/jukeboxes/otherworld/song2.ogg',\
	"SPIT" = 'sound/music/jukeboxes/otherworld/song3.ogg',\
	"RESPIRATOR" = 'sound/music/jukeboxes/otherworld/song4.ogg',\
	"DAMAGED" = 'sound/music/jukeboxes/otherworld/song5.ogg',\
)
#define MUSIC_TAVCAT_RADIO list(\
	"Risvonian Talkshow" = 'sound/music/jukeboxes/gen/talkshow.ogg',\
	"Dictate's Simplified Anthem" = 'sound/music/jukeboxes/gen/countdown.ogg',\
)
#define MUSIC_TAVCAT_MACHINE list(\
	"Toxic" = 'sound/music/jukeboxes/machine/machinetoxic.ogg',\
	"Alone" = 'sound/music/jukeboxes/machine/machinealone.ogg',\
	"Class" = 'sound/music/jukeboxes/machine/machineclass.ogg',\
	"Her" = 'sound/music/jukeboxes/machine/machineher.ogg',\
	"Life" = 'sound/music/jukeboxes/machine/machinelife.ogg',\
	"Madness" = 'sound/music/jukeboxes/machine/machinemadness.ogg',\
	"Rain" = 'sound/music/jukeboxes/machine/machinerain.ogg',\
	"Down" = 'sound/music/jukeboxes/machine/machinedown.ogg',\
	"Face" = 'sound/music/jukeboxes/machine/machineface.ogg',\
	"Void" = 'sound/music/jukeboxes/machine/machinevoid.ogg',\
	"Need" = 'sound/music/jukeboxes/machine/machineneed.ogg',\
	"Escape" = 'sound/music/jukeboxes/machine/machineescape.ogg',\
	"Judas" = 'sound/music/jukeboxes/machine/machinejudas.ogg',\
	"Jane" = 'sound/music/jukeboxes/machine/machinejane.ogg',\
	"Juliet" = 'sound/music/jukeboxes/machine/machinejuliet.ogg',\
	"Underground" = 'sound/music/jukeboxes/machine/machineunderground.ogg',\
) // POP MUSIC ONLY FOR THE MACHINE -- NO CHUDMUSIC ALLOWED

/datum/looping_sound/radios
	mid_sounds = list()
	mid_length = 120000 // 20 minutes
	volume = 100
	extra_range = 10
	falloff = 0
	persistent_loop = TRUE
	stress2give = /datum/stressevent/music
	sound_group = null

/datum/looping_sound/radios/New(_parent, start_immediately=FALSE, _direct=FALSE, _channel = 0)
	. = ..(_parent, FALSE, _direct, _channel)
	// Radios can be widespread on the map. Reserve channels only while actively playing.
	if(channel)
		SSsounds.free_datum_channels(src)
		channel = null
	if(start_immediately)
		start()

/datum/looping_sound/radios/start(atom/on_behalf_of, sync_anchor)
	if(sync_anchor)
		starttime = sync_anchor
	if(!channel)
		channel = SSsounds.reserve_sound_channel(src)
		if(!channel)
			var/atom/resolved_parent = parent?.resolve()
			log_game("RADIO: Failed to reserve sound channel for [resolved_parent] - channels may be exhausted (reserve_high=[SSsounds.channel_reserve_high], random_min=[SSsounds.random_channels_min])")
			return FALSE
	..()
	return TRUE

// Thingshearing was previously cleared BEFORE calling ..() which meant
// the parent stop() had nothing to iterate over and silently did nothing.
// We now let the parent run first, THEN clear thingshearing, and THEN free
// the channel. The manual GLOB.clients loop handles clients whose played_loops
// entry may have been missed by the parent.
/datum/looping_sound/radios/stop(null_parent)
	if(channel)
		. = ..(null_parent)  // Parent runs first with thingshearing intact.
		for(var/client/C in GLOB.clients)
			if(!(src in C.played_loops))
				continue
			var/list/L = C.played_loops[src]
			var/sound/SD = L?["SOUND"]
			var/stop_channel = SD?.channel || channel
			if(C.mob)
				C.mob.stop_sound_channel(stop_channel)
			else
				SEND_SOUND(C, sound(null, repeat = 0, wait = 0, channel = stop_channel))
			C.played_loops -= src
		thingshearing = list()  // Clear AFTER parent and client loop are done.
		SSsounds.free_datum_channels(src)
		channel = null
	else
		. = ..(null_parent)

/obj/item/roguemachine/musicbox
	name = "metal radio"
	desc = "Discovered within one of LOVE's catacombs, this funny little piece allows for telecommunications. It can even play some pre-recorded music."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "music0"
	density = FALSE
	anchored = FALSE
	max_integrity = 0
	var/datum/looping_sound/radios/soundloop
	var/list/init_curfile = list('sound/music/jukeboxes/gen/talkshow.ogg') // A list of songs that curfile is set to on init. MUST BE IN ONE OF THE MUSIC_TAVCAT_'s.
	var/curfile // The current track that is playing right now
	var/playing = FALSE // If music is playing or not. playmusic() deals with this don't mess with it.
	var/curvol = 50 // The current volume at which audio is played. MAPPERS MAY TOUCH THIS.
	var/playuponspawn = FALSE // Does the music box start playing music when it first spawns in? MAPPERS MAY TOUCH THIS.

/obj/item/roguemachine/musicbox/Initialize()
	. = ..()
	curfile = pick(init_curfile)
	soundloop = new(src, FALSE)
	if(playuponspawn)
		start_playing()

/obj/item/roguemachine/musicbox/Destroy()
	. = ..()
	qdel(soundloop) //jesus fuck who is using hard dels in this day and age

/obj/item/roguemachine/musicbox/update_icon()
	icon_state = "music[playing]"

/obj/item/roguemachine/musicbox/attack_self(mob/user)
	. = ..()
	if(.)
		return
	open_controls(user)

/obj/item/roguemachine/musicbox/Click(location, control, params)
	. = ..()

	if(params && findtext(params, "right=1"))
		open_controls(usr)
		return

/obj/item/roguemachine/musicbox/proc/toggle_music()
	if(!playing)
		start_playing()
	else
		stop_playing()

/obj/item/roguemachine/musicbox/proc/start_playing()
	playing = TRUE
	soundloop.mid_sounds = list(curfile)
	soundloop.cursound = null
	soundloop.volume = curvol
	soundloop.start()
	testing("Music: V[soundloop.volume] C[soundloop.cursound] T[soundloop.thingshearing]")
	update_icon()

/obj/item/roguemachine/musicbox/proc/stop_playing()
	playing = FALSE
	soundloop.stop()
	update_icon()

/obj/item/roguemachine/musicbox/proc/open_controls(mob/user)
	if(!user)
		return

	user.changeNext_move(CLICK_CD_INTENTCAP)

	var/button_selection = input(user, "What button do I press?", "\The [src]") as null | anything in list("Stop/Start","Change Song","Change Volume")
	if(!Adjacent(user))
		return
	if(!button_selection)
		to_chat(user, span_info("I change my mind..."))
		return
	user.visible_message(span_info("[user] presses a button on \the [src]."),span_info("I press a button on \the [src]."))
	playsound(loc, pick('sound/misc/keyboard_select (1).ogg','sound/misc/keyboard_select (2).ogg','sound/misc/keyboard_select (3).ogg','sound/misc/keyboard_select (4).ogg'), 100, FALSE, -1)

	if(button_selection=="Stop/Start")
		toggle_music()

	if(button_selection=="Change Song")
		var/songlists_selection = input(user, "Which song list?", "\The [src]") as null | anything in list("RECORDED MUSIC"=MUSIC_TAVCAT_OTHERWORLDLY, "RADIO STATION"=MUSIC_TAVCAT_RADIO, "MACHINE TRANSMISSION"=MUSIC_TAVCAT_MACHINE)
		playsound(loc, pick('sound/misc/keyboard_select (1).ogg','sound/misc/keyboard_select (2).ogg','sound/misc/keyboard_select (3).ogg','sound/misc/keyboard_select (4).ogg'), 100, FALSE, -1)
		user.visible_message(span_info("[user] presses a button on \the [src]."),span_info("I press a button on \the [src]."))
		var/chosen_songlists_selection = null
		if(songlists_selection=="RECORDED MUSIC")
			chosen_songlists_selection = MUSIC_TAVCAT_OTHERWORLDLY
		if(songlists_selection=="RADIO STATION")
			chosen_songlists_selection = MUSIC_TAVCAT_RADIO
		if(songlists_selection=="MACHINE TRANSMISSION")
			chosen_songlists_selection = MUSIC_TAVCAT_MACHINE
		var/song_selection = input(user, "Which song do I play?", "\The [src]") as null | anything in chosen_songlists_selection
		if(!Adjacent(user))
			return
		if(!song_selection)
			to_chat(user, span_info("I change my mind..."))
			return
		playsound(loc, pick('sound/misc/keyboard_select (1).ogg','sound/misc/keyboard_select (2).ogg','sound/misc/keyboard_select (3).ogg','sound/misc/keyboard_select (4).ogg'), 100, FALSE, -1)
		user.visible_message(span_info("[user] presses a button on \the [src]."),span_info("I press a button on \the [src]."))
		curfile = chosen_songlists_selection[song_selection]
		stop_playing()
		start_playing()

	if(button_selection=="Change Volume")
		var/volume_selection = input(user, "How loud do you wish me to be?", "\The [src] (Volume Currently : [curvol]/[100])") as num|null
		if(!Adjacent(user))
			return
		if(!volume_selection)
			to_chat(user, span_info("I change my mind..."))
			return
		if(volume_selection == curvol)
			to_chat(user, span_info("The dial is already set to that volume!"))
			return
		playsound(loc, pick('sound/misc/keyboard_select (1).ogg','sound/misc/keyboard_select (2).ogg','sound/misc/keyboard_select (3).ogg','sound/misc/keyboard_select (4).ogg'), 100, FALSE, -1)
		user.visible_message(span_info("[user] presses a button on \the [src]."),span_info("I press a button on \the [src]."))
		volume_selection = clamp(volume_selection, 1, 100)
		if(curvol<volume_selection)
			to_chat(user, span_info("I make \the [src] get louder."))
		else
			to_chat(user, span_info("I make \the [src] get quieter."))
		curvol = volume_selection
		stop_playing()
		start_playing()

/obj/item/roguemachine/musicbox/tavern
	init_curfile = list(\
		'sound/music/jukeboxes/gen/talkshow.ogg',\
		'sound/music/jukeboxes/gen/countdown.ogg',\
		'sound/music/jukeboxes/otherworld/song1.ogg',
		'sound/music/jukeboxes/otherworld/song2.ogg',\
		'sound/music/jukeboxes/otherworld/song3.ogg',\
	)
	curvol = 65
	playuponspawn = TRUE
/* The fuck is this
/obj/item/roguemachine/musicbox/Initialize()
	. = ..()
	soundloop.extra_range = 12
	soundloop.falloff = 6
*/
