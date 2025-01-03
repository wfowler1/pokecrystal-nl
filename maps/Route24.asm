	object_const_def
	const ROUTE24_ROCKET

Route24_MapScripts:
	def_scene_scripts

	def_callbacks

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, -1
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special FadeInFromBlack
	playmapmusic
	end

Route24RocketSeenText:
	text "Hé, ettertje!" ; "Hey, kid! Me am a"
	line "Een lid van TEAM" ; "TEAM ROCKET member"
	cont "ROCKET ik ben!" ; "kind of guy!"

	para "Uit ander land," ; "Come from another"
	line "een trainer" ; "country, a trainer"
	cont "nummer één, ik!" ; "number one, me!"

	para "Denken deed ik," ; "Think I did, if"
	line "als stop energie," ; "stop the energy,"

	para "grote paniek hier" ; "be big panic for"
	line "voor mensen!" ; "here people!"

	para "Geheim het is mijn" ; "Secret it is my"
	line "missie, dus vertel" ; "mission, so tell"
	cont "je ik niet!" ; "you I not!"

	para "Maar! Als win je" ; "But! If win you do"
	line "tegen mij, een" ; "versus me, a man I"

	para "man ben ik en mijn" ; "be and mine secret"
	line "geheim vertel." ; "to you I tell."

	para "Hé, snotneus!" ; "Hey, kid! Battle"
	line "Vecht begin!" ; "begin we do!"
	done

Route24RocketBeatenText:
	text "Aiii! Nee, nee," ; "Ayieeeh! No, no,"
	line "nee, geloof ik" ; "no, believe it I"
	cont "kan niet!" ; "can't!"

	para "Sterk heel zijn" ; "Strong very much"
	line "jij! Kans ik" ; "be you! Match I am"
	cont "niet maak jou!" ; "not to you!"
	done

Route24RocketAfterBattleText:
	text "Oké. Vertel ik" ; "OK. Tell you mine"
	line "mijn geheim jou." ; "secret will I."

	para "MACHINEDEEL steel" ; "MACHINE PART steal"
	line "door mij, verstopt" ; "by me, hide it I"

	para "ik in GYM van de" ; "did in GYM of the"
	line "CERULEAN."

	para "In water stopte" ; "Inside water put"
	line "deed ik. Zoek" ; "it I did. Look for"

	para "in water midden" ; "in water center of"
	line "van GYM." ; "GYM at."

	para "Maar mij niet" ; "But you forget me"
	line "vergeten!" ; "not!"

	para "Versla jou zeker" ; "Beat you for sure"
	line "zal TEAM ROCKET." ; "will TEAM ROCKET."

	para "Komen uit JOHTO" ; "Come from JOHTO"
	line "zullen ze, mijn" ; "will they, mine"

	para "vrienden, ja." ; "friends, yes. Will"
	line "Wraak zij nemen." ; "revenge they are."
	done

Route24RocketDisappearsText:
	text "…"

	para "Je zegt wat? TEAM" ; "You say what? TEAM"
	line "ROCKET houdt voor" ; "ROCKET bye-bye a"

	para "gezien? Opgebroken" ; "go-go? Broken it"
	line "zegt jij?" ; "is says you?"

	para "Oh nee! Zal ik" ; "Oh, no! Should I"
	line "doen wat nu vanaf?" ; "do what now on"
	;cont "vanaf?" ; "from, me?"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
