// completely unorganized outside of "hey this comes from t-13." posters are in walldeco.dm

//computers (non-functional)
/obj/structure/fluff/walldeco/computer
	density = TRUE
	icon_state = "small"

/obj/structure/fluff/walldeco/computer/cameras
	icon_state = "cameras"

/obj/structure/fluff/walldeco/computer/request
	icon_state = "request"

/obj/structure/fluff/walldeco/computer/shuttle
	icon_state = "shuttle"

/obj/structure/fluff/walldeco/computer/operating
	icon_state = "operating"

/obj/structure/fluff/walldeco/computer/smallb
	icon_state = "smallb"

/obj/structure/fluff/walldeco/computer/requestb
	icon_state = "requestb"

/obj/structure/fluff/walldeco/computer/largeb
	icon_state = "largeb"

/obj/structure/fluff/walldeco/computer/overwatchb
	icon_state = "overwatchb"

/obj/structure/fluff/walldeco/computer/overwatch_mainb
	icon_state = "overwatch_mainb"

/obj/structure/fluff/walldeco/computer/tvoff
	icon_state = "tvoff"

/obj/structure/fluff/walldeco/computer/smalloff
	icon_state = "smalloff"

/obj/structure/fluff/walldeco/computer/largeoff
	icon_state = "largeoff"

/obj/structure/fluff/walldeco/computer/shuttleoff
	icon_state = "shuttleoff"

/obj/structure/fluff/walldeco/computer/overwatchoff
	icon_state = "overwatchoff"

/obj/structure/fluff/walldeco/computer/overwatch_mainoff
	icon_state = "overwatch_mainoff"

/obj/structure/fluff/walldeco/computer/captainoff
	icon_state = "captainoff"

// dead bodies
// please understand that im not weird, the default remains just suck
/obj/effect/decal/remains/corpse
	name = ""
	desc = ""
	gender = NEUTER
	icon = 'icons/roguetown/misc/decoration.dmi'

/obj/effect/decal/remains/corpse/oldbody
	name = "old body"
	desc = "It's been chained for a while. It doesn't smell nice."
	icon_state = "oldbody"

/obj/effect/decal/remains/corpse/body
	name = "corpse"
	desc = "It's hard to make out who this was. The skin's gone blue."
	icon_state = "body1"

/obj/effect/decal/remains/corpse/body/body2
	icon_state = "body2"

/obj/effect/decal/remains/corpse/body/body3
	icon_state = "body3"


/obj/effect/decal/remains/corpse/charred
	name = "charred"
	desc = "Everything's gone black, like it happened in a flash."
	icon_state = "1"

/obj/effect/decal/remains/corpse/charred/charred2
	name = "charred"
	desc = "Alone."
	icon_state = "2"

/obj/effect/decal/remains/corpse/charred/charred3
	name = "charred"
	desc = "Curled into a ball."
	icon_state = "3"

/obj/effect/decal/remains/corpse/charred/charred4
	name = "charred"
	desc = "Like they were on a bed."
	icon_state = "4"

/obj/effect/decal/remains/corpse/charred/charred5
	name = "charred"
	desc = "It hurts."
	icon_state = "5"

/obj/effect/decal/remains/corpse/charred/charred6
	name = "charred"
	desc = "Together."
	icon_state = "6"

/obj/effect/decal/remains/corpse/charred/charred7
	name = "charred"
	desc = "Shot in the head."
	icon_state = "7"

/obj/effect/decal/bodies
	name = "charcoal"
	desc = "Fuck. Get - get me out of here."
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "bodies" //multidirectional

/obj/effect/decal/bodiesflipped
	name = "charcoal"
	desc = "Fuck. Get - get me out of here."
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "bodiesflipped"

//misc
// as a side note, i just realized these should've been fluff structures instead of decals. sorry!
/obj/effect/decal/crashed 
	name = "cyclops"
	desc = "51 61 132 15 41 121. The inside of the glass has a dried, blue fluid."
	density = TRUE
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "crashed"

/obj/effect/decal/loader
	name = "strange machine"
	desc = "There's a seat inside of it. Doesn't turn on."
	density = TRUE
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "loader" //multidirectional

/obj/effect/decal/sink
	name = "basin"
	desc = "Turning the handles doesn't do anything."
	plane = GAME_PLANE_LOWER
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "sink" //multidirectional

/obj/effect/decal/ob
	name = "strange machine"
	desc = "I don't know what this is."
	density = TRUE
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "ob0"

/obj/effect/decal/mailbox
	name = "strange machine"
	desc = "It's slightly glowing."
	density = TRUE
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "mailbox1"

/obj/structure/fluff/walldeco/traumacon
	name = "strange machine"
	desc = "It's confusing."
	icon_state = "traumacon"
	layer = ABOVE_MOB_LAYER

/obj/effect/decal/trades
	name = "strange machine"
	desc = "Tapping on the glass doesn't do anything."
	density = TRUE
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "trades1"

/obj/effect/decal/synth
	name = "strange machine"
	desc = "I can't get it to open."
	density = TRUE
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "synth1"

/obj/effect/decal/cutting
	name = "strange machine"
	desc = "There's a sharp blade underneath the roller."
	density = TRUE
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "cutting0"

/obj/effect/decal/polishing
	name = "strange machine"
	desc = "It won't budge."
	density = TRUE
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "polishing0"

/obj/effect/decal/skibidi
	name = "porcelain throne"
	desc = "Stinks."
	density = TRUE
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "toilet1"

/obj/effect/decal/skibidi/Initialize()
	. = ..()
	icon_state = "toilet[rand(1,2)]"

/obj/effect/decal/oldrobot
	name = "automaton"
	desc = "This doesn't look like a STRANGER."
	density = TRUE
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "oldrobot"

/obj/structure/fluff/medcurtain
	name = "curtain"
	desc = "A weird, transparent curtain."
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "curtain"

/obj/structure/fluff/medstand
	name = "tank"
	desc = "An empty metal tube hangs from the contraption."
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "medical_stand"
	density = FALSE

/obj/structure/fluff/ivdrip
	name = "drip"
	desc = "The blood's long since coagulated."
	icon = 'icons/roguetown/misc/decoration.dmi'
	icon_state = "iv_drip"
