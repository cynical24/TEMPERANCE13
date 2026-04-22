/*
	Combat Mode Music Track Datums
	---
	Currently only used for overriding the default combat music that comes with your job or antagonist.
	As of writing they are never directly applied to mobs themselves, only the name and musicpath are.
	Deleting these datums or renaming subtypes will not break preferences; invalid saves get redirected to /default.
	When adding new songs, add a shortname around ~12 characters for the game preferences menu.
	
	IMPORTANT! Be careful about adding songs to this list that aren't used anywhere else, lest you needlessly inflate the RSC.

	[ TEMPERANCE13 - Combat Music Override Port:
	hi hello. a bulk of this is just going to be shit i Personally decide would be good to pick from, including some role-specific cmode tracks. 
	HOWEVER, zera has made it clear they think role-specific cmode tracks should be Very Picky and not all current or new ones SHOULD be made
	available to pick from. so! these are subject to change.  ]
*/

// Admins: please don't molest my lists. You can't add new types at runtime anyways. Kisses! - Zoktiik
GLOBAL_LIST_EMPTY(cmode_tracks_by_type)
GLOBAL_LIST_EMPTY(cmode_tracks_by_name)

// People make mistakes. This should help catch when that happens.
/proc/cmode_track_to_namelist(var/datum/combat_music/track)
	if(!track)
		return
	if(!track.name)
		LAZYREMOVE(GLOB.cmode_tracks_by_type, track.type)
		CRASH("CMODE MUSIC: type [track.type] has no name!") 
	if(GLOB.cmode_tracks_by_name[track.name])
		LAZYREMOVE(GLOB.cmode_tracks_by_type, track.type)
		CRASH("CMODE MUSIC: type [track.type] has duplicate name \"[track.name]\"!")
	GLOB.cmode_tracks_by_name[track.name] = track
	return

/datum/combat_music
	var/name
	var/desc
	var/shortname
	var/credits
	var/musicpath = list()

// Shit WILL break if you change /default's typepath. Don't do it.
/datum/combat_music/default
	name = "Default"
	desc = "I let my current status sing for itself; its song will change dynamically."
	shortname = "Default"
	musicpath = list()

// Old RTcode cmode tracks, cherrypicked out of the otherwise purged list bc i thought they were either fitting or cool enough
/datum/combat_music/bandit_mage
	name = "Bandit Mage (Hedge Mage)"
	desc = ""
	shortname = "Bandit Mage"
	credits = "Timestopper Tactics - corru.works"
	musicpath = list('sound/music/combat_bandit_mage.ogg')

/datum/combat_music/beggar
	name = "Beggar"
	desc = ""
	shortname = "Beggar"
	credits = "Pathologic (Classic) - Most Combat Theme"
	musicpath = list('sound/music/combat_bum.ogg')

/datum/combat_music/desertrider
	name = "Desert Rider Mercenary"
	desc = ""
	shortname = "Desert Rider"
	credits = "Two Fingers - You Ain't Down"
	musicpath = list('sound/music/combat_desertrider.ogg')

/datum/combat_music/dwarf
	name = "Dwarven Grudgebearer"
	desc = ""
	shortname = "Dwarf"
	musicpath = list('sound/music/combat_dwarf.ogg')

/datum/combat_music/forlorn
	name = "Forlorn Hope Mercenary"
	desc = ""
	shortname = "Forlorn Hope"
	musicpath = list('sound/music/combat_blackstar.ogg')

/datum/combat_music/grenzelhoft
	name = "Grenzelhoft Mercenary"
	desc = ""
	shortname = "Grenzelhoft"
	credits = "Helbrede - Sons of Tyr"
	musicpath = list('sound/music/combat_grenzelhoft.ogg')

/datum/combat_music/iconoclast
	name = "Iconoclast"
	desc = ""
	shortname = "Iconoclast"
	credits = "Valley of Judgement- Lateralis"
	musicpath = list('sound/music/Iconoclast.ogg')

/datum/combat_music/inquisitor
	name = "Inquisitor (Monster Hunter/Spellbreaker)"
	desc = ""
	shortname = "Inquisitor"
	credits = "Hellsing OST RAID Track 15: Survival on the Street of Insincerity"
	musicpath = list('sound/music/inquisitorcombat.ogg')

/datum/combat_music/inquis_ordinator
	name = "Inquisitor - Ordinator"
	desc = ""
	shortname = "Ordinator"
	musicpath = list('sound/music/combat_inqordinator.ogg')

/datum/combat_music/maniac
	name = "Maniac"
	desc = ""
	shortname = "Maniac"
	credits = "Thomas Bangalter - Stress"
	musicpath = list('sound/music/combat_maniac2.ogg')

/datum/combat_music/monastic
	name = "Monastic Zeal"
	desc = ""
	shortname = "Monastic"
	credits = "Jesper Kyd - Light of the Imperium"
	musicpath = list('sound/music/combat_holy.ogg')

// Temperance13 tracks, picked because they're general-use enough to be deemed pickable

/datum/combat_music/armsman
	name = "Armsman"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/combat_armsman.ogg')

/datum/combat_music/auxiliar
	name = "Auxiliar"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/combat_auxiliar.ogg')

/datum/combat_music/backliner
	name = "Backliner"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/combat_backliner.ogg')

/datum/combat_music/debt
	name = "Debt Collector"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/cmode/adventurer/combat_debt.ogg')

/datum/combat_music/foreigner
	name = "Foreigner"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/cmode/adventurer/combat_foreigner.ogg')

/datum/combat_music/gangster
	name = "Gangster"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/cmode/adventurer/combat_gangster.ogg')

/datum/combat_music/gunman
	name = "Gunslinger / Perpetrator / Desperado"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/cmode/adventurer/combat_gunman.ogg')

/datum/combat_music/machinegunner
	name = "Rook / Ammo Squire"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/combat_machinegunner.ogg')

/datum/combat_music/metalface
	name = "Explorer / Provisioner"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/combat_metalface.ogg')

/datum/combat_music/poacher
	name = "Poacher"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/combat_poacher.ogg')

/datum/combat_music/private
	name = "Private Investigator"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/cmode/adventurer/combat_private.ogg')

/datum/combat_music/soldato
	name = "Soldato"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/combat_soldato.ogg')

/datum/combat_music/veterano
	name = "Veterano"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/combat_veterano.ogg')

/datum/combat_music/voltigeur
	name = "Voltigeur"
	desc = ""
	shortname = "REPLACE"
	musicpath = list('sound/music/combat_voltigeur.ogg')
