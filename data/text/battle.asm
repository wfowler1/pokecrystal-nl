BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> pikte"
	line "¥ op@"
	text_decimal wPayDayMoney, 3, 6
	text "!"
	prompt

WildPokemonAppearedText:
	text "Wilde @"
	text_ram wEnemyMonNickname
	text_start
	line "verscheen!"
	prompt

HookedPokemonAttackedText:
	text "De opgeviste"
	line "@"
	text_ram wEnemyMonNickname
	text_start
	cont "viel aan!"
	prompt

PokemonFellFromTreeText:
	text_ram wEnemyMonNickname
	text " viel"
	line "uit de boom!"
	prompt

WildCelebiAppearedText:
	text "Wilde @"
	text_ram wEnemyMonNickname
	text_start
	line "verscheen!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "wil vechten!"
	prompt

BattleText_WildFled:
	text "Wilde @"
	text_ram wEnemyMonNickname
	text_start
	line "vluchtte!"
	prompt

BattleText_EnemyFled:
	text "Vijand @"
	text_ram wEnemyMonNickname
	text_start
	line "vluchtte!"
	prompt

HurtByPoisonText:
	text "<USER>"
	line "lijdt onder gif!"
	prompt

HurtByBurnText:
	text "<USER>'s"
	line "is verbrand!"
	prompt

LeechSeedSapsText:
	text "LEECH SEED zuigt"
	line "<USER>!"
	prompt

HasANightmareText:
	text "<USER>"
	line "heeft NACHTMERRIE!"
	prompt

HurtByCurseText:
	text "<USER>'s"
	line "lijdt onder vloek!"
	prompt

SandstormHitsText:
	text "De ZANDSTORM raakt"
	line "<USER>!"
	prompt

PerishCountText:
	text "<USER>'s"
	line "STERF-telling is @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

BattleText_TargetRecoveredWithItem:
	text "<TARGET>"
	line "herstelde met"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "herstelde PP door"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "werd geraakt door"
	cont "TOEKOMSTZICHT!"
	prompt

BattleText_SafeguardFaded:
	text "<USER>'s"
	line "BESCHERMING!"
	cont "verdween!"
	prompt

BattleText_MonsLightScreenFell:
	text_ram wStringBuffer1
	text " #MON's"
	line "LICHTSCHERM!"
	cont "verdween!"
	prompt

BattleText_MonsReflectFaded:
	text_ram wStringBuffer1
	text " #MON's"
	line "SPIEGEL verdween!"
	prompt

BattleText_RainContinuesToFall:
	text "Regen blijft neer-"
	line "vallen."
	prompt

BattleText_TheSunlightIsStrong:
	text "De zon schijnt"
	line "hard."
	prompt

BattleText_TheSandstormRages:
	text "De ZANDSTORM"
	line "woedt."
	prompt

BattleText_TheRainStopped:
	text "De regen stopte."
	prompt

BattleText_TheSunlightFaded:
	text "Het zonlicht"
	line "verdween."
	prompt

BattleText_TheSandstormSubsided:
	text "De ZANDSTORM"
	line "zakte."
	prompt

BattleText_EnemyMonFainted:
	text "Vijand @"
	text_ram wEnemyMonNickname
	text_start
	line "viel flauw!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER> kreeg ¥@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "voor de winst!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "was verslagen!"
	prompt

TiedAgainstText:
	text "Gelijkspel tegen"
	line "<ENEMY>!"
	prompt

SentSomeToMomText:
	text "<PLAYER> kreeg ¥@"
	text_decimal wBattleReward, 3, 6
	text_start
	line "voor de winst!"
	cont "Beetje naar MAM!"
	prompt

SentHalfToMomText:
	text "Helft naar MAM!"
	prompt

SentAllToMomText:
	text "Alles naar MAM!"
	prompt

UnusedRivalLossText: ; unreferenced
	text "<RIVAL>: Huh? Ik"
	line "had jouw #MON"
	cont "moeten kiezen!"
	prompt

BattleText_MonFainted:
	text_ram wBattleMonNickname
	text_start
	line "viel flauw!"
	prompt

BattleText_UseNextMon:
	text "Gebruik volgende"
	line "#MON?"
	done

UnusedRivalWinText: ; unreferenced
	text "<RIVAL>: Ja!"
	line "Zo te zien koos ik"
	cont "een goede #MON!"
	prompt

LostAgainstText:
	text "Verloor van"
	line "<ENEMY>!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "kiest hierna"
	cont "@"
	text_ram wEnemyMonNickname
	text "."

	para "Wisselt <PLAYER>"
	line "van #MON?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "stuurde"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "Er is geen wil om"
	line "te vechten!"
	prompt

BattleText_AnEGGCantBattle:
	text "Een EI kan niet"
	line "vechten!"
	prompt

BattleText_CantEscape2:
	text "Kan niet"
	line "ontsnappen!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle:
	text "Nee! Je kunt niet"
	line "rennen bij een"
	cont "trainergevecht!"
	prompt

BattleText_GotAwaySafely:
	text "Veilig gevlucht!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "vluchtte met een"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_CantEscape:
	text "Kan niet"
	line "ontsnappen!"
	prompt

BattleText_UserHurtBySpikes:
	text "<USER> is ge-"
	line "raakt door STEKELS!"
	prompt

RecoveredUsingText:
	text "<TARGET>"
	line "herstelde met een"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "activeerde!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Voorwerpen kun"
	line "je hier niks mee."
	prompt

BattleText_MonIsAlreadyOut:
	text_ram wBattleMonNickname
	text_start
	line "is al uit de bal."
	prompt

BattleText_MonCantBeRecalled:
	text_ram wBattleMonNickname
	text_start
	line "kan niet terug!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "Er is geen PP meer"
	line "voor deze aanval!"
	prompt

BattleText_TheMoveIsDisabled:
	text "De aanval is"
	line "UITGESCHAKELD!"
	prompt

BattleText_MonHasNoMovesLeft:
	text_ram wBattleMonNickname
	text_start
	line "kan niks meer!"
	done

BattleText_TargetsEncoreEnded:
	text "<TARGET>'s"
	line "TOEGIFT eindigde!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	text " groeide naar"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	text_end

	text_end ; unreferenced

BattleText_WildMonIsEating:
	text "Wilde @"
	text_ram wEnemyMonNickname
	text_start
	line "is aan het eten!"
	prompt

BattleText_WildMonIsAngry:
	text "Wilde @"
	text_ram wEnemyMonNickname
	text_start
	line "is boos!"
	prompt

FastAsleepText:
	text "<USER>"
	line "is diep in slaap!"
	prompt

WokeUpText:
	text "<USER>"
	line "werd wakker!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "is bevroren!"
	prompt

FlinchedText:
	text "<USER>"
	line "deinsde achteruit!"
	prompt

MustRechargeText:
	text "<USER>"
	line "moet opladen!"
	prompt

DisabledNoMoreText:
	text "<USER> is niet"
	line "meer UITGE-"
	cont "SCHAKELD!"
	prompt

IsConfusedText:
	text "<USER>"
	line "is verward!"
	prompt

HurtItselfText:
	text "Deed zichzelf pijn"
	line "door verwarring!"
	prompt

ConfusedNoMoreText:
	text "<USER> is"
	line "niet meer verward!"
	prompt

BecameConfusedText:
	text "<TARGET>"
	line "raakte verward!"
	prompt

BattleText_ItemHealedConfusion:
	text "Een @"
	text_ram wStringBuffer1
	text "haalde verwarring"
	line "<TARGET>"
	cont "weg."
	prompt

AlreadyConfusedText:
	text "<TARGET>'s"
	line "is al verward!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text "<USER>'s"
	line "hurt by"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "werd verlost van"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UsedBindText:
	text "<USER>"
	line "gebruikte BIND op"
	cont "<TARGET>!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>"
	line "zit in de val!"
	prompt

FireSpinTrapText:
	text "<TARGET>"
	line "zit in de val!"
	prompt

WrappedByText:
	text "<TARGET>"
	line "is VERWIKKELD door"
	cont "<USER>!"
	prompt

ClampedByText:
	text "<TARGET>"
	line "is GEKLEMD door"
	cont "<USER>!"
	prompt

StoringEnergyText:
	text "<USER>"
	line "bewaart energie!"
	prompt

UnleashedEnergyText:
	text "<USER>"
	line "liet energie los!"
	prompt

HungOnText:
	text "<TARGET>"
	line "bleef hangen met"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "VERDROEG de klap!"
	prompt

InLoveWithText:
	text "<USER>"
	line "is verliefd op"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "<USER> was"
	line "te verliefd om aan"
	cont "te vallen!"
	prompt

DisabledMoveText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer1
	text " is"
	cont "UITGESCHAKELD!"
	prompt

LoafingAroundText:
	text_ram wBattleMonNickname
	text " slentert"
	line "wat rond."
	prompt

BeganToNapText:
	text_ram wBattleMonNickname
	text " begon"
	line "te dutten!"
	prompt

WontObeyText:
	text_ram wBattleMonNickname
	text " wil niet"
	line "luisteren!"
	prompt

TurnedAwayText:
	text_ram wBattleMonNickname
	text " draaide"
	line "zich weg!"
	prompt

IgnoredOrdersText:
	text_ram wBattleMonNickname
	text " negeerde"
	line "orders!"
	prompt

IgnoredSleepingText:
	text_ram wBattleMonNickname
	text " negeerde"
	line "orders…en sliep!"
	prompt

NoPPLeftText:
	text "Er is geen PP meer"
	line "voor de aanval!"
	prompt

HasNoPPLeftText:
	text "<USER>"
	line "heeft geen PP meer"
	cont "voor @"
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "<USER>"
	line "viel in slaap!"
	done

RestedText:
	text "<USER>"
	line "viel in slaap en"
	cont "werd gezond!"
	done

RegainedHealthText:
	text "<USER>"
	line "werd weer gezond!"
	prompt

AttackMissedText:
	text "<USER>'s"
	line "aanval mistte!"
	prompt

AttackMissed2Text:
	text "<USER>'s"
	line "aanval mistte!"
	prompt

CrashedText:
	text "<USER>"
	line "ging door en"
	cont "botste!"
	prompt

UnaffectedText:
	text "<TARGET> is"
	line "onaangetast!"
	prompt

DoesntAffectText:
	text "Heeft geen invloed"
	line "op <TARGET>!"
	prompt

CriticalHitText:
	text "Een kritieke klap!"
	prompt

OneHitKOText:
	text "In één klap KO!"
	prompt

SuperEffectiveText:
	text "Het is super"
	line "effectief!"
	prompt

NotVeryEffectiveText:
	text "Het is niet heel"
	line "effectief…"
	prompt

TookDownWithItText:
	text "<TARGET>"
	line "nam met zich mee,"
	cont "<USER>!"
	prompt

RageBuildingText:
	text "<USER>'s"
	line "WOEDE bouwt op!"
	prompt

GotAnEncoreText:
	text "<TARGET>"
	line "kreeg een TOEGIFT!"
	prompt

SharedPainText:
	text "De vechters"
	line "deelden pijn!"
	prompt

TookAimText:
	text "<USER>"
	line "richtte!"
	prompt

SketchedText:
	text "<USER>"
	line "SCHETSTE"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "<USER>"
	line "probeert de vijand"
	cont "mee te nemen!"
	prompt

SpiteEffectText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1
	text " werd"
	cont "verlaagd met @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

BellChimedText:
	text "Een bel luidde!"
	line ""
	prompt

FellAsleepText:
	text "<TARGET>"
	line "viel in slaap!"
	prompt

AlreadyAsleepText:
	text "<TARGET>"
	line "slaapt al!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "werd vergiftigd!"
	prompt

BadlyPoisonedText:
	text "<TARGET> werd"
	line "flink vergiftigd!"
	prompt

AlreadyPoisonedText:
	text "<TARGET> is"
	line "al vergiftigd!"
	prompt

SuckedHealthText:
	text "Zoog leven van"
	line "<TARGET>!"
	prompt

DreamEatenText:
	text "<TARGET>'s"
	line "droom was gegeten!"
	prompt

WasBurnedText:
	text "<TARGET>"
	line "werd verbrand!"
	prompt

DefrostedOpponentText:
	text "<TARGET>"
	line "werd ontdooid!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "werd bevroren!"
	prompt

WontRiseAnymoreText:
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text " kan"
	cont "niet hoger!"
	prompt

WontDropAnymoreText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text " kan"
	cont "niet lager!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "vluchtte!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "vluchtte in angst!"
	prompt

BlownAwayText:
	text "<TARGET>"
	line "werd weggeblazen!"
	prompt

PlayerHitTimesText:
	text "Raakte @"
	text_decimal wPlayerDamageTaken, 1, 1
	text " keer!"
	prompt

EnemyHitTimesText:
	text "Raakte @"
	text_decimal wEnemyDamageTaken, 1, 1
	text " keer!"
	prompt

MistText:
	text "<USER> is"
	line "omhuld door MIST!"
	prompt

ProtectedByMistText:
	text "<TARGET> is"
	line "omhuld door MIST."
	prompt

GettingPumpedText:
	text_pause
	text "<USER>"
	line "raakt enthousiast!"
	prompt

RecoilText:
	text "<USER> raakte"
	line "ook zichzelf!"
	prompt

MadeSubstituteText:
	text "<USER> maakte"
	line "een VERVANGER!"
	prompt

HasSubstituteText:
	text "<USER> heeft"
	line "een VERVANGER!"
	prompt

TooWeakSubText:
	text "Te zwak om VER-"
	line "VANGER te maken!"
	prompt

SubTookDamageText:
	text "VERVANGER ving"
	line "schade op voor"
	cont "<TARGET>!"
	prompt

SubFadedText:
	text "<TARGET>'s"
	line "VERVANGER verging!"
	prompt

MimicLearnedMoveText:
	text "<USER>"
	line "leerde"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "werd bezaaid!"
	prompt

EvadedText:
	text "<TARGET>"
	line "vermeed de aanval!"
	prompt

WasDisabledText:
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer1
	text " werd"
	cont "UITGESCHAKELD!"
	prompt

CoinsScatteredText:
	text "Munten overal"
	line "neergeworpen!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "transformeerde in"
	cont "de @"
	text_ram wStringBuffer1
	text "-type!"
	prompt

EliminatedStatsText:
	text "Alle wijzigingen"
	line "in statistieken"
	cont "verdwenen!"
	prompt

TransformedText:
	text "<USER>"
	line "TRANSFORMEERDE in"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

LightScreenEffectText:
	text "<USER>'s"
	line "SPCL.DEF omhoog!"
	prompt

ReflectEffectText:
	text "<USER>'s"
	line "DEFENSE omhoog!"
	prompt

NothingHappenedText:
	text "Maar er gebeurde"
	line "niks."
	prompt

ButItFailedText:
	text "Maar het mislukte!"
	prompt

ItFailedText:
	text "Het mislukte!"
	prompt

DidntAffect1Text:
	text "Het deed niks bij"
	line "<TARGET>!"
	prompt

DidntAffect2Text:
	text "Het deed niks bij"
	line "<TARGET>!"
	prompt

HPIsFullText:
	text "<USER>'s"
	line "HP zit vol!"
	prompt

DraggedOutText:
	text "<USER> werd naar"
	line "buiten gesleept!"
	prompt

ParalyzedText:
	text "<TARGET> is"
	line "verlamd! Misschien"
	cont "kan hij niks!"
	prompt

FullyParalyzedText:
	text "<USER> is"
	line "volledig verlamd!"
	prompt

AlreadyParalyzedText:
	text "<TARGET> is"
	line "al verlamd!"
	prompt

ProtectedByText:
	text "<TARGET> is"
	line "beschermd door"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

MirrorMoveFailedText:
	text "De SPIEGELAANVAL"
	next "mislukte!"
	prompt

StoleText:
	text "<USER>"
	line "stal @"
	text_ram wStringBuffer1
	text_start
	cont "van tegenstander!"
	prompt

CantEscapeNowText:
	text "<TARGET> kan nu"
	line "niet ontsnappen!"
	prompt

StartedNightmareText:
	text "<TARGET>"
	line "begon een NACHT-"
	cont "MERRIE te krijgen!"
	prompt

WasDefrostedText:
	text "<USER>"
	line "werd ontdooid!"
	prompt

PutACurseText:
	text "<USER>"
	line "halveerde eigen HP"

	para "en vervloekte"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "<USER>"
	line "BEHOEDDE zichzelf!"
	prompt

ProtectingItselfText:
	text "<TARGET>"
	line "BEHOEDT zichzelf!"
	done

SpikesText:
	text "STEKELS uitge-"
	line "strooid rond"
	cont "<TARGET>!"
	prompt

IdentifiedText:
	text "<USER>"
	line "identificeerde"
	cont "<TARGET>!"
	prompt

StartPerishText:
	text "Beide vallen in 3"
	line "beurten flauw!"
	prompt

SandstormBrewedText:
	text "Een SANDSTORM"
	line "woedt!"
	prompt

BracedItselfText:
	text "<USER>"
	line "zette zich schrap!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "werd verliefd!"
	prompt

CoveredByVeilText:
	text "<USER> is"
	line "bedekt door een"
	cont "sluier!"
	prompt

SafeguardProtectText:
	text "<TARGET>"
	line "wordt beschermd"
	cont "door BESCHERMING!"
	prompt

MagnitudeText:
	text "Magnitude @"
	text_decimal wTextDecimalByte, 1, 1
	text "!"
	prompt

ReleasedByText:
	text "<USER>"
	line "werd vrijgelaten"
	cont "door <TARGET>!"
	prompt

ShedLeechSeedText:
	text "<USER> schudde"
	line "LEECH SEED af!"
	prompt

BlewSpikesText:
	text "<USER>"
	line "blies STEKELS weg!"
	prompt

DownpourText:
	text "Een stortbui"
	line "is begonnen!"
	prompt

SunGotBrightText:
	text "Het zonlicht is"
	line "fel geworden!"
	prompt

BellyDrumText:
	text "<USER> verlaag-"
	line "de eigen HP voor"
	cont "maximale AANVAL!"
	prompt

CopiedStatsText:
	text "<USER>"
	line "kopieerde de stat-"

	para "verandering van"
	line "<TARGET>!"
	prompt

ForesawAttackText:
	text "<USER> voorzag"
	line "een aanval!"
	prompt

BeatUpAttackText:
	text_ram wStringBuffer1
	text "'s"
	line "aanval!"
	done

PresentFailedText:
	text "<TARGET>"
	line "weigerde 't cadeau!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "negeerde orders!"
	prompt

BattleText_LinkErrorBattleCanceled:
	text "Linkfout…"

	para "Het gevecht is"
	line "geannuleerd…"
	prompt

BattleText_NoTimeLeftToday: ; unreferenced
	text "Er is vandaag geen"
	line "tijd meer!"
	done
