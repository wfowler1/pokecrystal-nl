MomPhoneGreetingText:
	text "Hallo?" ; "Hello?"

	para "Oh, hoi <PLAYER>!" ; "Oh, hi, <PLAYER>!"
	line "Hard aan het werk?" ; "Working hard?"
	done

MomPhoneLandmarkText:
	text "Oh, je bent in" ; "Oh, so you're in"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxLandmarkLength
	text "…"

	para "is dat niet waar" ; "Isn't that where"
	line "@"
	text_ram wStringBuffer4 ; MaxLength MaxLandmarkLength
	text_start
	para "is? Heb je een" ; "is? Did you go"
	line "kijkje genomen?" ; "take a look?"
	done

MomPhoneGenericAreaText:
	text "Echt, ben je in" ; "Really, you're in"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxLandmarkLength
	text "?"

	para "IK ben daar nooit" ; "I've never gone"
	line "geweest. Wat" ; "there. That's kind"
	cont "gaaf, <PLAYER>." ; "of neat, <PLAYER>."
	done

MomPhoneNewBarkText:
	text "Wat? Ben je in" ; "What? You're in"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxLandmarkLength
	text "?"

	para "Kom eens bij je" ; "Come see your MOM"
	line "moeder langs!" ; "sometime!"
	done

MomPhoneCherrygroveText:
	text "Je bent in" ; "You're visiting"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxLandmarkLength
	text "?"

	para "Kom anders eens" ; "How about coming"
	line "even naar huis?" ; "home for a bit?"
	done

MomOtherAreaText:
	text "Wauw, ben je in" ; "Wow, you're in"
	line "@"
	text_ram wStringBuffer3 ; MaxLength MaxLandmarkLength
	text "?"

	para "Succes met je" ; "Good luck on your"
	line "#MON-queeste!" ; "#MON quest!"
	done

MomDeterminedText:
	text "Dat klinkt heel" ; "That sounds really"
	line "erg lastig." ; "tough."

	para "Maar, <PLAYER>, ik" ; "But, <PLAYER>, I"
	line "weet dat je vast-" ; "know you're really"

	para "beraden bent. Je" ; "determined. You'll"
	line "redt het wel, OK?" ; "be OK, right?"
	done

MomCheckBalanceText:
	text "Trouwens, je hebt" ; "By the way, you've"
	line "¥@" ; "saved up ¥@"
	text_ram wStringBuffer3 ; MaxLength 6
	text " gespaard." ; "."

	para "Wil je blijven" ; "Do you want to"
	line "sparen?" ; "keep on saving?"
	done

MomImportantToSaveText:
	text "Het is belangrijk" ; "It's important to"
	line "om geld te sparen." ; "save your money."
	done

MomYoureNotSavingText:
	text "Oh, <PLAYER>, je" ; "Oh, <PLAYER>,"
	line "spaart nu geen" ; "you're not saving"

	para "geld. Wil je gaan" ; "any money. Would"
	line "sparen?" ; "you like to save?"
	done

MomYouveSavedText:
	text "Trouwens, je hebt" ; "By the way, you've"
	line "¥@" ; "saved up ¥@"
	text_ram wStringBuffer3 ; MaxLength 6
	text " gespaard." ; "."

	para "Wil je weer gaan" ; "Want to start"
	line "sparen?" ; "saving again?"
	done

MomOKIllSaveText:
	text "OK. Ik spaar geld" ; "OK. I'll save your"
	line "voor je." ; "money."
	done

MomPhoneWontSaveMoneyText:
	text "OK. Ik spaar je" ; "OK. I won't save"
	line "geld niet." ; "your money."
	done

MomPhoneHangUpText:
	text "<PLAYER>, ga zo" ; "<PLAYER>, keep it"
	line "door! Ik geloof in" ; "up! I'm rooting"
	cont "je, lieverd!" ; "for you, baby!"
	done

MomPhoneNoPokemonText:
	text "Hallo?" ; "Hello?"

	para "Oh, hoi, <PLAYER>!" ; "Oh, hi, <PLAYER>!"
	line "Zat PROF.ELM niet" ; "Wasn't PROF.ELM"
	cont "op je te wachten?" ; "waiting for you?"
	done

MomPhoneNoPokedexText:
	text "Hallo?" ; "Hello?"

	para "Oh, hoi, <PLAYER>!" ; "Oh, hi, <PLAYER>!"
	line "Je hebt een grote" ; "You're on a big"

	para "missie van PROF." ; "mission for PROF."
	line "ELM? Doe je best!" ; "ELM? Be good!"
	done

MomPhoneNoGymQuestText:
	text "Hallo?" ; "Hello?"

	para "Hoi, <PLAYER>! Als" ; "Hi, <PLAYER>! If"
	line "je klusje klaar is" ; "you're done with"

	para "kun je naar huis" ; "your errand come"
	line "komen, schat." ; "on home, dear."
	done

MomPhoneLectureText:
	text "Hallo?" ; "Hello?"

	para "…… <PLAYER>?"
	line "PROF.ELM zei dat" ; "I heard from PROF."

	para "je op reis bent" ; "ELM that you went"
	line "gegaan. Ik wou" ; "on a long trip."

	para "dat je mij iets" ; "I wish you would"
	line "had gezegd…" ; "have told me…"

	para "En je geld?" ; "What about money?"
	line "Moet ik sparen?" ; "Should I save it?"
	done
