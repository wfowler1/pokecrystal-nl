BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> pikte" ; "<PLAYER> picked up"
	line "¥@"
	text_decimal wPayDayMoney, 3, 6
	text " op!" ; "!"
	prompt

WildPokemonAppearedText:
	text "Wilde @" ; "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "verscheen!" ; "appeared!"
	prompt

HookedPokemonAttackedText:
	text "De opgeviste" ; "The hooked"
	line "@"
	text_ram wEnemyMonNickname
	text_start
	cont "viel aan!" ; "attacked!"
	prompt

PokemonFellFromTreeText:
	text_ram wEnemyMonNickname
	text " viel" ; " fell"
	line "uit de boom!" ; "out of the tree!"
	prompt

WildCelebiAppearedText:
	text "Wilde @" ; "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "verscheen!" ; "appeared!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "wil vechten!" ; "wants to battle!"
	prompt

BattleText_WildFled:
	text "Wilde @" ; "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "vluchtte!" ; "fled!"
	prompt

BattleText_EnemyFled:
	text "Vijand @" ; "Enemy @"
	text_ram wEnemyMonNickname
	text_start
	line "vluchtte!" ; "fled!"
	prompt

HurtByPoisonText:
	text "<USER>"
	line "lijdt onder gif!" ; "is hurt by poison!"
	prompt

HurtByBurnText:
	text "<USER>" ; "<USER>'s"
	line "is verbrand!" ; "hurt by its burn!"
	prompt

LeechSeedSapsText:
	text "LEECH SEED zuigt" ; "LEECH SEED saps"
	line "<USER>!"
	prompt

HasANightmareText:
	text "<USER>"
	line "heeft NACHTMERRIE!" ; "has a NIGHTMARE!"
	prompt

HurtByCurseText:
	text "<USER> is" ; "<USER>'s"
	line "lijdt onder vloek!" ; "hurt by the CURSE!"
	prompt

SandstormHitsText:
	text "De ZANDSTORM raakt" ; "The SANDSTORM hits"
	line "<USER>!"
	prompt

PerishCountText:
	text "<USER>'s STERF-"
	line "telling is @" ; "PERISH count is @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

BattleText_TargetRecoveredWithItem:
	text "<TARGET>"
	line "herstelde met" ; "recovered with"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "herstelde PP door" ; "recovered PP using"
	cont "@"
	text_ram wStringBuffer1 ; Item Name MaxLength 12
	text "."
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "werd geraakt door" ; "was hit by FUTURE"
	cont "TOEKOMSTZICHT!" ; "SIGHT!"
	prompt

BattleText_SafeguardFaded:
	text "<USER>'s"
	line "BESCHERMING" ; "SAFEGUARD faded!"
	cont "verdween!"
	prompt

BattleText_MonsLightScreenFell:
	text_ram wStringBuffer1 ; "Je" or "Vijand" MaxLength 6
	text " #MON's"
	line "LICHTSCHERM" ; "LIGHT SCREEN fell!"
	cont "verdween!"
	prompt

BattleText_MonsReflectFaded:
	text_ram wStringBuffer1 ; MaxLength 6
	text " #MON's"
	line "SPIEGEL verdween!" ; "REFLECT faded!"
	prompt

BattleText_RainContinuesToFall:
	text "Regen blijft neer-" ; "Rain continues to"
	line "vallen." ; "fall."
	prompt

BattleText_TheSunlightIsStrong:
	text "De zon schijnt" ; "The sunlight is"
	line "hard." ; "strong."
	prompt

BattleText_TheSandstormRages:
	text "De ZANDSTORM" ; "The SANDSTORM"
	line "woedt." ; "rages."
	prompt

BattleText_TheRainStopped:
	text "De regen stopte." ; "The rain stopped."
	prompt

BattleText_TheSunlightFaded:
	text "Het zonlicht" ; "The sunlight"
	line "verdween." ; "faded."
	prompt

BattleText_TheSandstormSubsided:
	text "De ZANDSTORM" ; "The SANDSTORM"
	line "zakte." ; "subsided."
	prompt

BattleText_EnemyMonFainted:
	text "Vijand @" ; "Enemy @"
	text_ram wEnemyMonNickname
	text_start
	line "viel flauw!" ; "fainted!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER> kreeg" ; "<PLAYER> got ¥@"
	line "¥@"
	text_decimal wBattleReward, 3, 6
	text " voor de" ; text_start
	cont "winst!" ; "for winning!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "was verslagen!" ; "was defeated!"
	prompt

TiedAgainstText:
	text "Gelijkspel tegen" ; "Tied against"
	line "<ENEMY>!"
	prompt

SentSomeToMomText:
	text "<PLAYER> kreeg" ; "<PLAYER> got ¥@"
	line "¥@"
	text_decimal wBattleReward, 3, 6
	text "voor de" ; text_start
	cont "winst!" ; "for winning!"
	cont "Beetje naar MAM!" ; "Sent some to MOM!"
	prompt

SentHalfToMomText:
	text "Helft naar MAM!" ; "Sent half to MOM!"
	prompt

SentAllToMomText:
	text "Alles naar MAM!" ; "Sent all to MOM!"
	prompt

UnusedRivalLossText: ; unreferenced
	text "<RIVAL>: Huh? Ik" ; "<RIVAL>: Huh? I"
	line "had jouw #MON" ; "should've chosen"
	cont "moeten kiezen!" ; "your #MON!"
	prompt

BattleText_MonFainted:
	text_ram wBattleMonNickname
	text_start
	line "viel flauw!" ; "fainted!"
	prompt

BattleText_UseNextMon:
	text "Gebruik volgende" ; "Use next #MON?"
	line "#MON?"
	done

UnusedRivalWinText: ; unreferenced
	text "<RIVAL>: Ja!" ; "<RIVAL>: Yes!"
	line "Zo te zien koos ik" ; "I guess I chose a"
	cont "een goede #MON!" ; "good #MON!"
	prompt

LostAgainstText:
	text "Verloor van" ; "Lost against"
	line "<ENEMY>!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "kiest hierna" ; "is about to use"
	cont "@"
	text_ram wEnemyMonNickname
	text "."

	para "Wisselt <PLAYER>" ; "Will <PLAYER>"
	line "van #MON?" ; "change #MON?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "stuurde" ; "sent out"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "Er is geen wil om" ; "There's no will to"
	line "te vechten!" ; "battle!"
	prompt

BattleText_AnEGGCantBattle:
	text "Een EI kan niet" ; "An EGG can't"
	line "vechten!" ; "battle!"
	prompt

BattleText_CantEscape2:
	text "Kan niet" ; "Can't escape!"
	line "ontsnappen!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle:
	text "Nee! Je kunt niet" ; "No! There's no"
	line "rennen bij een" ; "running from a"
	cont "trainergevecht!" ; "trainer battle!"
	prompt

BattleText_GotAwaySafely:
	text "Veilig gevlucht!" ; "Got away safely!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "vluchtte met een" ; "fled using a"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "!"
	prompt

BattleText_CantEscape:
	text "Kan niet" ; "Can't escape!"
	line "ontsnappen!"
	prompt

BattleText_UserHurtBySpikes: ; TODO: string too long
	text "<USER> is ge-" ; "<USER>'s"
	line "raakt door STEKELS!" ; "hurt by SPIKES!"
	prompt

RecoveredUsingText:
	text "<TARGET>"
	line "herstelde met een" ; "recovered using a"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text_start
	cont "activeerde!" ; "activated!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Voorwerpen kun" ; "Items can't be"
	line "je hier niks mee." ; "used here."
	prompt

BattleText_MonIsAlreadyOut:
	text_ram wBattleMonNickname
	text_start
	line "is al uit de bal." ; "is already out."
	prompt

BattleText_MonCantBeRecalled:
	text_ram wBattleMonNickname
	text_start
	line "kan niet terug!" ; "can't be recalled!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "Er is geen AP meer" ; "There's no PP left"
	line "voor deze aanval!" ; "for this move!"
	prompt

BattleText_TheMoveIsDisabled:
	text "De aanval is" ; "The move is"
	line "UITGESCHAKELD!" ; "DISABLED!"
	prompt

BattleText_MonHasNoMovesLeft:
	text_ram wBattleMonNickname
	text_start
	line "kan niks meer!" ; "has no moves left!"
	done

BattleText_TargetsEncoreEnded:
	text "<TARGET>'s"
	line "TOEGIFT eindigde!" ; "ENCORE ended!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text " groeide naar" ; " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	text_end

	text_end ; unreferenced

BattleText_WildMonIsEating:
	text "Wilde @" ; "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "is aan het eten!" ; "is eating!"
	prompt

BattleText_WildMonIsAngry:
	text "Wilde @" ; "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "is boos!" ; "is angry!"
	prompt

FastAsleepText:
	text "<USER>"
	line "is diep in slaap!" ; "is fast asleep!"
	prompt

WokeUpText:
	text "<USER>"
	line "werd wakker!" ; "woke up!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "is bevroren!" ; "is frozen solid!"
	prompt

FlinchedText:
	text "<USER>"
	line "deinsde achteruit!" ; "flinched!"
	prompt

MustRechargeText:
	text "<USER>"
	line "moet opladen!" ; "must recharge!"
	prompt

DisabledNoMoreText:
	text "<USER> is niet" ; "<USER>'s"
	line "meer UITGE-" ; "disabled no more!"
	cont "SCHAKELD!"
	prompt

IsConfusedText:
	text "<USER>"
	line "is verward!" ; "is confused!"
	prompt

HurtItselfText:
	text "Deed zichzelf pijn" ; "It hurt itself in"
	line "door verwarring!" ; "its confusion!"
	prompt

ConfusedNoMoreText:
	text "<USER> is" ; "<USER>'s"
	line "niet meer verward!" ; "confused no more!"
	prompt

BecameConfusedText:
	text "<TARGET>"
	line "raakte verward!" ; "became confused!"
	prompt

BattleText_ItemHealedConfusion:
	text "Een @" ; "A @"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text_start
	line "haalde verwarring" ; " rid"
	cont "<TARGET> weg." ; "<TARGET>"
	; cont "of its confusion."
	prompt

AlreadyConfusedText:
	text "<TARGET>" ; "<TARGET>'s"
	line "is al verward!" ; "already confused!"
	prompt

BattleText_UsersHurtByStringBuffer1: ; TODO translate
	text "<USER>'s"
	line "hurt by"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "werd verlost van" ; "was released from"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text "!"
	prompt

UsedBindText:
	text "<USER>" ; "<USER> geb-"
	line "ruikte KOPPEL op" ; "used BIND on"
	cont "<TARGET>!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>"
	line "zit in de val!" ; "was trapped!"
	prompt

FireSpinTrapText:
	text "<TARGET>"
	line "zit in de val!" ; "was trapped!"
	prompt

WrappedByText:
	text "<TARGET>"
	line "is VERWIKKELD door" ; "was WRAPPED by"
	cont "<USER>!"
	prompt

ClampedByText:
	text "<TARGET>"
	line "is GEKLEMD door" ; "was CLAMPED by"
	cont "<USER>!"
	prompt

StoringEnergyText:
	text "<USER>"
	line "bewaart energie!" ; "is storing energy!"
	prompt

UnleashedEnergyText:
	text "<USER>"
	line "liet energie los!" ; "unleashed energy!"
	prompt

HungOnText:
	text "<TARGET>"
	line "bleef hangen met" ; "hung on with"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "VERDROEG de klap!" ; "ENDURED the hit!"
	prompt

InLoveWithText:
	text "<USER>"
	line "is verliefd op" ; "is in love with"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "<USER> was" ; "<USER>'s"
	line "te verliefd om aan" ; "infatuation kept"
	cont "te vallen!" ; "it from attacking!"
	prompt

DisabledMoveText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text " is"
	cont "UITGESCHAKELD!" ; "DISABLED!"
	prompt

LoafingAroundText:
	text_ram wBattleMonNickname
	text " slentert" ; " is"
	line "wat rond." ; "loafing around."
	prompt

BeganToNapText:
	text_ram wBattleMonNickname
	text " begon" ; " began"
	line "te dutten!" ; "to nap!"
	prompt

WontObeyText:
	text_ram wBattleMonNickname
	text " wil niet" ; " won't"
	line "luisteren!" ; "obey!"
	prompt

TurnedAwayText:
	text_ram wBattleMonNickname
	text " draaide" ; " turned"
	line "zich weg!" ; "away!"
	prompt

IgnoredOrdersText:
	text_ram wBattleMonNickname
	text " negeerde" ; " ignored"
	line "orders!"
	prompt

IgnoredSleepingText:
	text_ram wBattleMonNickname
	text " negeerde" ; " ignored"
	line "orders…en sliep!" ; "orders…sleeping!"
	prompt

NoPPLeftText:
	text "Er is geen AP meer" ; "But no PP is left"
	line "voor de aanval!" ; "for the move!"
	prompt

HasNoPPLeftText:
	text "<USER> heeft" ; "<USER>"
	line "geen AP meer voor" ; "has no PP left for"
	cont "@"
	text_ram wStringBuffer2 ; MaxLength MaxMoveNameLength
	text "!"
	prompt

WentToSleepText:
	text "<USER>"
	line "viel in slaap!" ; "went to sleep!"
	done

RestedText:
	text "<USER>"
	line "viel in slaap en" ; "fell asleep and"
	cont "werd gezond!" ; "became healthy!"
	done

RegainedHealthText:
	text "<USER>"
	line "werd weer gezond!" ; "regained health!"
	prompt

AttackMissedText:
	text "<USER>'s"
	line "aanval mistte!" ; "attack missed!"
	prompt

AttackMissed2Text:
	text "<USER>'s"
	line "aanval mistte!" ; "attack missed!"
	prompt

CrashedText:
	text "<USER>"
	line "ging door en" ; "kept going and"
	cont "botste!" ; "crashed!"
	prompt

UnaffectedText:
	text "<TARGET> is" ; "<TARGET>'s"
	line "onaangetast!" ; "unaffected!"
	prompt

DoesntAffectText:
	text "Heeft geen invloed" ; "It doesn't affect"
	line "op <TARGET>!" ; "<TARGET>!"
	prompt

CriticalHitText:
	text "Een kritieke klap!" ; "A critical hit!"
	prompt

OneHitKOText:
	text "In één klap KO!" ; "It's a one-hit KO!"
	prompt

SuperEffectiveText:
	text "Het is super" ; "It's super-"
	line "effectief!" ; "effective!"
	prompt

NotVeryEffectiveText:
	text "Het is niet heel" ; "It's not very"
	line "effectief…" ; "effective…"
	prompt

TookDownWithItText:
	text "<TARGET>"
	line "nam met zich mee," ; "took down with it,"
	cont "<USER>!"
	prompt

RageBuildingText:
	text "<USER>'s"
	line "WOEDE bouwt op!" ; "RAGE is building!"
	prompt

GotAnEncoreText:
	text "<TARGET>"
	line "kreeg een TOEGIFT!" ; "got an ENCORE!"
	prompt

SharedPainText:
	text "De vechters" ; "The battlers"
	line "deelden pijn!" ; "shared pain!"
	prompt

TookAimText:
	text "<USER>"
	line "richtte!" ; "took aim!"
	prompt

SketchedText:
	text "<USER>"
	line "SCHETSTE" ; "SKETCHED"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text "!"
	prompt

DestinyBondEffectText:
	text "<USER>" ; "<USER>'s"
	line "probeert de vijand" ; "trying to take its"
	cont "mee te nemen!" ; "opponent with it!"
	prompt

SpiteEffectText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text " werd" ; " was"
	cont "verlaagd met @" ; "reduced by @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

BellChimedText:
	text "Een bel luidde!" ; "A bell chimed!"
	line ""
	prompt

FellAsleepText:
	text "<TARGET>"
	line "viel in slaap!" ; "fell asleep!"
	prompt

AlreadyAsleepText:
	text "<TARGET>" ; "<TARGET>'s"
	line "slaapt al!" ; "already asleep!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "werd vergiftigd!" ; "was poisoned!"
	prompt

BadlyPoisonedText:
	text "<TARGET> werd" ; "<TARGET>'s"
	line "flink vergiftigd!" ; "badly poisoned!"
	prompt

AlreadyPoisonedText:
	text "<TARGET> is" ; "<TARGET>'s"
	line "al vergiftigd!" ; "already poisoned!"
	prompt

SuckedHealthText:
	text "Zoog leven van" ; "Sucked health from"
	line "<TARGET>!"
	prompt

DreamEatenText:
	text "<TARGET>'s"
	line "droom was gegeten!" ; "dream was eaten!"
	prompt

WasBurnedText:
	text "<TARGET>"
	line "werd verbrand!" ; "was burned!"
	prompt

DefrostedOpponentText:
	text "<TARGET>"
	line "werd ontdooid!" ; "was defrosted!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "werd bevroren!" ; "was frozen solid!"
	prompt

WontRiseAnymoreText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxStatNameLength
	text " kan" ; " won't"
	cont "niet hoger!" ; "rise anymore!"
	prompt

WontDropAnymoreText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2 ; MaxLength MaxStatNameLength
	text " kan" ; " won't"
	cont "niet lager!" ; "drop anymore!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "vluchtte!" ; "fled from battle!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "vluchtte in angst!" ; "fled in fear!"
	prompt

BlownAwayText:
	text "<TARGET>"
	line "werd weggeblazen!" ; "was blown away!"
	prompt

PlayerHitTimesText:
	text "Raakte @" ; "Hit @"
	text_decimal wPlayerDamageTaken, 1, 1
	text " keer!" ; " times!"
	prompt

EnemyHitTimesText:
	text "Raakte @" ; "Hit @"
	text_decimal wEnemyDamageTaken, 1, 1
	text " keer!" ; " times!"
	prompt

MistText:
	text "<USER> is" ; "<USER>'s"
	line "omhuld door MIST!" ; "shrouded in MIST!"
	prompt

ProtectedByMistText:
	text "<TARGET> is" ; "<TARGET>'s"
	line "omhuld door MIST." ; "protected by MIST."
	prompt

GettingPumpedText:
	text_pause
	text "<USER>" ; "<USER>'s"
	line "raakt enthousiast!" ; "getting pumped!"
	prompt

RecoilText:
	text "<USER> raakte" ; "<USER>'s"
	line "ook zichzelf!" ; "hit with recoil!"
	prompt

MadeSubstituteText:
	text "<USER> maakte" ; "<USER>"
	line "een VERVANGER!" ; "made a SUBSTITUTE!"
	prompt

HasSubstituteText:
	text "<USER> heeft" ; "<USER>"
	line "een VERVANGER!" ; "has a SUBSTITUTE!"
	prompt

TooWeakSubText:
	text "Te zwak om VER-" ; "Too weak to make"
	line "VANGER te maken!" ; "a SUBSTITUTE!"
	prompt

SubTookDamageText:
	text "VERVANGER ving" ; "The SUBSTITUTE"
	line "schade op voor" ; "took damage for"
	cont "<TARGET>!"
	prompt

SubFadedText:
	text "<TARGET>'s"
	line "VERVANGER verging!" ; "SUBSTITUTE faded!"
	prompt

MimicLearnedMoveText:
	text "<USER>"
	line "leerde" ; "learned"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text "!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "werd bezaaid!" ; "was seeded!"
	prompt

EvadedText:
	text "<TARGET>"
	line "vermeed de aanval!" ; "evaded the attack!"
	prompt

WasDisabledText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text " werd" ; " was"
	cont "UITGESCHAKELD!" ; "DISABLED!"
	prompt

CoinsScatteredText:
	text "Munten overal" ; "Coins scattered"
	line "neergeworpen!" ; "everywhere!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "transformeerde in" ; "transformed into"
	cont "de @" ; "the @"
	text_ram wStringBuffer1 ; MaxLength MaxTypeNameLength
	text "-type!"
	prompt

EliminatedStatsText:
	text "Alle wijzigingen" ; "All stat changes"
	line "in statistieken" ; "were eliminated!"
	cont "verdwenen!"
	prompt

TransformedText:
	text "<USER>"
	line "TRANSFORMEERDE in" ; "TRANSFORMED into"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "!"
	prompt

LightScreenEffectText:
	text "<USER>'s"
	line "SPCL.DEF omhoog!" ; "SPCL.DEF rose!"
	prompt

ReflectEffectText:
	text "<USER>'s"
	line "DEFENSE omhoog!" ; "DEFENSE rose!"
	prompt

NothingHappenedText:
	text "Maar er gebeurde" ; "But nothing"
	line "niks." ; "happened."
	prompt

ButItFailedText:
	text "Maar het mislukte!" ; "But it failed!"
	prompt

ItFailedText:
	text "Het mislukte!" ; "It failed!"
	prompt

DidntAffect1Text:
	text "Het deed niks bij" ; "It didn't affect"
	line "<TARGET>!"
	prompt

DidntAffect2Text:
	text "Het deed niks bij" ; "It didn't affect"
	line "<TARGET>!"
	prompt

HPIsFullText:
	text "<USER>'s"
	line "LP zit vol!" ; "HP is full!"
	prompt

DraggedOutText: ; TODO: string too long. <USER> can be up to 10 characters
	text "<USER> werd naar" ; "<USER>"
	line "buiten gesleept!" ; "was dragged out!"
	prompt

ParalyzedText:
	text "<TARGET> is" ; "<TARGET>'s"
	line "verlamd! Misschien" ; "paralyzed! Maybe"
	cont "kan hij niks!" ; "it can't attack!"
	prompt

FullyParalyzedText:
	text "<USER> is" ; "<USER>'s"
	line "volledig verlamd!" ; "fully paralyzed!"
	prompt

AlreadyParalyzedText:
	text "<TARGET> is" ; "<TARGET>'s"
	line "al verlamd!" ; "already paralyzed!"
	prompt

ProtectedByText:
	text "<TARGET> is" ; "<TARGET>'s"
	line "beschermd door" ; "protected by"
	cont "@"
	text_ram wStringBuffer1 ; MaxLength MaxMoveNameLength
	text "!"
	prompt

MirrorMoveFailedText:
	text "De SPIEGELAANVAL" ; "The MIRROR MOVE"
	next "mislukte!" ; "failed!"
	prompt

StoleText:
	text "<USER>"
	line "stal @" ; "stole @"
	text_ram wStringBuffer1 ; MaxLength MaxItemNameLength
	text_start
	cont "van tegenstander!" ; "from its foe!"
	prompt

CantEscapeNowText: ; TODO string too long, <TARGET> can be up to 10 characters
	text "<TARGET> kan nu" ; "<TARGET>"
	line "niet ontsnappen!" ; "can't escape now!"
	prompt

StartedNightmareText:
	text "<TARGET>"
	line "begon een NACHT-" ; "started to have a"
	cont "MERRIE te krijgen!" ; "NIGHTMARE!"
	prompt

WasDefrostedText:
	text "<USER>"
	line "werd ontdooid!" ; "was defrosted!"
	prompt

PutACurseText:
	text "<USER>"
	line "halveerde eigen LP" ; "cut its own HP and"

	para "en vervloekte" ; "put a CURSE on"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "<USER>"
	line "BEHOEDDE zichzelf!" ; "PROTECTED itself!"
	prompt

ProtectingItselfText:
	text "<TARGET>" ; "<TARGET>'s"
	line "BEHOEDT zichzelf!" ; "PROTECTING itself!"
	done

SpikesText:
	text "STEKELS uitge-" ; "SPIKES scattered"
	line "strooid rond" ; "all around"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "<USER>"
	line "identificeerde" ; "identified"
	cont "<TARGET>!"
	prompt

StartPerishText:
	text "Beide vallen in 3" ; "Both #MON will"
	line "beurten flauw!" ; "faint in 3 turns!"
	prompt

SandstormBrewedText:
	text "Een ZANDSTORM" ; "A SANDSTORM"
	line "woedt!" ; "brewed!"
	prompt

BracedItselfText:
	text "<USER>"
	line "zette zich schrap!" ; "braced itself!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "werd verliefd!" ; "fell in love!"
	prompt

CoveredByVeilText:
	text "<USER> is" ; "<USER>'s"
	line "bedekt door een" ; "covered by a veil!"
	cont "sluier!"
	prompt

SafeguardProtectText:
	text "<TARGET>"
	line "wordt beschermd" ; "is protected by"
	cont "door BEVEILIGING!" ; "SAFEGUARD!"
	prompt

MagnitudeText:
	text "Magnitude @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

ReleasedByText:
	text "<USER>"
	line "werd vrijgelaten" ; "was released by"
	cont "door <TARGET>!" ; "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "<USER> schudde" ; "<USER>"
	line "ZUIGEN ZAAD af!" ; "shed LEECH SEED!"
	prompt

BlewSpikesText:
	text "<USER>"
	line "blies STEKELS weg!" ; "blew away SPIKES!"
	prompt

DownpourText:
	text "Een stortbui" ; "A downpour"
	line "is begonnen!" ; "started!"
	prompt

SunGotBrightText:
	text "Het zonlicht is" ; "The sunlight got"
	line "fel geworden!" ; "bright!"
	prompt

BellyDrumText: ; TODO string too long, <USER> can be 10 chars
	text "<USER> verlaag-"
	line "de eigen LP voor" ; "cut its HP and"
	cont "maximale AANVAL!" ; "maximized ATTACK!"
	prompt

CopiedStatsText:
	text "<USER>"
	line "kopieerde de stat-" ; "copied the stat"

	para "verandering van" ; "changes of"
	line "<TARGET>!"
	prompt

ForesawAttackText:
	text "<USER> voorzag" ; "<USER>"
	line "een aanval!" ; "foresaw an attack!"
	prompt

BeatUpAttackText:
	text_ram wStringBuffer1 ; MaxLength MaxPokemonNameLength
	text "'s"
	line "aanval!" ; "attack!"
	done

PresentFailedText:
	text "<TARGET>"
	line "weigerde 't cadeau!" ; "refused the gift!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "negeerde orders!" ; "ignored orders!"
	prompt

BattleText_LinkErrorBattleCanceled:
	text "Linkfout…" ; "Link error…"

	para "Het gevecht is" ; "The battle has"
	line "geannuleerd…" ; "been canceled…"
	prompt

BattleText_NoTimeLeftToday: ; unreferenced
	text "Er is vandaag geen" ; "There is no time"
	line "tijd meer!" ; "left today!"
	done
