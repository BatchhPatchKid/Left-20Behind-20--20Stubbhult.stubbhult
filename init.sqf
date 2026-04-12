// ====================================================================
// Function compiles -> missionNamespace
// ====================================================================

/* AISpawners \ factionSpawnerFunctions */
missionNamespace setVariable ["FN_ambientVeh", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_ambientVeh.sqf"];
missionNamespace setVariable ["FN_changeGroupSide", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_changeGroupSide.sqf"];
missionNamespace setVariable ["FN_createAIUnit", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_createAIUnit.sqf"];
missionNamespace setVariable ["FN_createWaypoints", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_createWaypoints.sqf"];
missionNamespace setVariable ["FN_equipAI", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_equipAI.sqf"];
missionNamespace setVariable ["FN_factionSelector", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_factionSelector.sqf"];
missionNamespace setVariable ["FN_findSafePosition", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_findSafePosition.sqf"];
missionNamespace setVariable ["FN_getFactionSkills", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_getFactionSkills.sqf"];
missionNamespace setVariable ["FN_meleeChance", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_meleeChance.sqf"];
missionNamespace setVariable ["FN_renegadeSpawner", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_renegadeSpawner.sqf"];
missionNamespace setVariable ["FN_selectFaction", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_selectFaction.sqf"];
missionNamespace setVariable ["FN_setUnitSkills", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_setUnitSkills.sqf"];
missionNamespace setVariable ["FN_spawnAI", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_spawnAI.sqf"];
missionNamespace setVariable ["FN_spawnHuntingFaction", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_spawnHuntingFaction.sqf"];
missionNamespace setVariable ["FN_spawnWanderingFaction", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_spawnWanderingFaction.sqf"];
missionNamespace setVariable ["FN_mapMarkerLocationMain", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\FN_mapMarkerLocationMain.sqf"];
missionNamespace setVariable ["FN_magicAIInit", compileFinal preprocessFileLineNumbers "AISpawners\magicUserAI\FN_magicAIInit.sqf"];
missionNamespace setVariable ["FN_magicAIBrain", compileFinal preprocessFileLineNumbers "AISpawners\magicUserAI\FN_magicAIBrain.sqf"];
missionNamespace setVariable ["FN_equipAIMagicUser", compileFinal preprocessFileLineNumbers "AISpawners\magicUserAI\FN_equipAIMagicUser.sqf"];
missionNamespace setVariable ["FN_spawnPriests", compileFinal preprocessFileLineNumbers "AISpawners\magicUserAI\FN_spawnPriests.sqf"];

/* AISpawners \ factionSpawnerFunctions \ campFortificationsScripts */
missionNamespace setVariable ["FN_createObject_Fortifications", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\campFortificationsScripts\FN_createObject_Fortifications.sqf"];
missionNamespace setVariable ["FN_fortificationsAux", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\campFortificationsScripts\FN_fortificationsAux.sqf"];
missionNamespace setVariable ["FN_fortificationsMain", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\campFortificationsScripts\FN_fortificationsMain.sqf"];
missionNamespace setVariable ["FN_spawnAI_Fortifications", compileFinal preprocessFileLineNumbers "AISpawners\factionSpawnerFunctions\campFortificationsScripts\FN_spawnAI_Fortifications.sqf"];

/* AISpawners \ mutantSpawners */
missionNamespace setVariable ["411Spawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\411Spawner.sqf"];
missionNamespace setVariable ["AbominationSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\AbominationSpawner.sqf"];
missionNamespace setVariable ["GoliathSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\GoliathSpawner.sqf"];
missionNamespace setVariable ["HellspawnSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\HellspawnSpawner.sqf"];
missionNamespace setVariable ["MindflayerSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\MindflayerSpawner.sqf"];
missionNamespace setVariable ["RakeSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\RakeSpawner.sqf"];
missionNamespace setVariable ["ShadowmenSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\ShadowmenSpawner.sqf"];
missionNamespace setVariable ["SkullsSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\SkullsSpawner.sqf"];
missionNamespace setVariable ["SnatcherSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\SnatcherSpawner.sqf"];
missionNamespace setVariable ["StatueSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\StatueSpawner.sqf"];
missionNamespace setVariable ["TankSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\TankSpawner.sqf"];
missionNamespace setVariable ["VampireSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\VampireSpawner.sqf"];
missionNamespace setVariable ["VariousMutantSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\VariousMutantSpawner.sqf"];
missionNamespace setVariable ["WendigoSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\WendigoSpawner.sqf"];
missionNamespace setVariable ["FN_spawnZom", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\FN_spawnZom.sqf"];
missionNamespace setVariable ["FN_ZTriggerSpawner", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\FN_ZTriggerSpawner.sqf"];
missionNamespace setVariable ["FN_spawnMutantType", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\FN_spawnMutantType.sqf"];
missionNamespace setVariable ["FN_spawnMutantCommon", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\FN_spawnMutantCommon.sqf"];
missionNamespace setVariable ["FN_mutantEffects", compileFinal preprocessFileLineNumbers "AISpawners\mutantSpawners\mutantEffects.sqf"];

/* AISpawners (root) */
missionNamespace setVariable ["FN_factionSpawnerMain", compileFinal preprocessFileLineNumbers "AISpawners\FN_factionSpawnerMain.sqf"];

/* Ambient */
missionNamespace setVariable ["FN_cookMeat", compileFinal preprocessFileLineNumbers "Ambient\FN_cookMeat.sqf"];
missionNamespace setVariable ["FN_createFire", compileFinal preprocessFileLineNumbers "Ambient\FN_createFire.sqf"];
missionNamespace setVariable ["FN_defecate", compileFinal preprocessFileLineNumbers "Ambient\FN_defecate.sqf"];
missionNamespace setVariable ["FN_drinkWater", compileFinal preprocessFileLineNumbers "Ambient\FN_drinkWater.sqf"];
missionNamespace setVariable ["FN_eatFood", compileFinal preprocessFileLineNumbers "Ambient\FN_eatFood.sqf"];
missionNamespace setVariable ["FN_factionArea", compileFinal preprocessFileLineNumbers "Ambient\FN_factionArea.sqf"];
missionNamespace setVariable ["FN_poopSystem", compileFinal preprocessFileLineNumbers "Ambient\FN_poopSystem.sqf"];
missionNamespace setVariable ["FN_purifyWater", compileFinal preprocessFileLineNumbers "Ambient\FN_purifyWater.sqf"];
missionNamespace setVariable ["FN_refillCanteen", compileFinal preprocessFileLineNumbers "Ambient\FN_refillCanteen.sqf"];
missionNamespace setVariable ["FN_drinkWaterFromWaterBody", compileFinal preprocessFileLineNumbers "Ambient\FN_drinkWaterFromWaterBody.sqf"];
missionNamespace setVariable ["FN_fillContainerFromWaterBody", compileFinal preprocessFileLineNumbers "Ambient\FN_fillContainerFromWaterBody.sqf"];
missionNamespace setVariable ["FN_sanitySystem", compileFinal preprocessFileLineNumbers "Ambient\FN_sanitySystem.sqf"];
missionNamespace setVariable ["FN_skinAnimal", compileFinal preprocessFileLineNumbers "Ambient\FN_skinAnimal.sqf"];
missionNamespace setVariable ["FN_specialVehicleSpawns", compileFinal preprocessFileLineNumbers "Ambient\FN_specialVehicleSpawns.sqf"];
missionNamespace setVariable ["FN_theRuns", compileFinal preprocessFileLineNumbers "Ambient\FN_theRuns.sqf"];
missionNamespace setVariable ["FN_updateDrinkActions", compileFinal preprocessFileLineNumbers "Ambient\FN_updateDrinkActions.sqf"];
missionNamespace setVariable ["FN_updateEatActions", compile preprocessFileLineNumbers "Ambient\FN_updateEatActions.sqf"];
missionNamespace setVariable ["hydrationNutritionSystem", compileFinal preprocessFileLineNumbers "Ambient\hydrationNutritionSystem.sqf"];
missionNamespace setVariable ["inclimateWeather", compileFinal preprocessFileLineNumbers "Ambient\inclimateWeather.sqf"];
missionNamespace setVariable ["radSystem", compileFinal preprocessFileLineNumbers "Ambient\radSystem.sqf"];
missionNamespace setVariable ["randomEncounters", compileFinal preprocessFileLineNumbers "Ambient\randomEncounters.sqf"];
missionNamespace setVariable ["temperature", compileFinal preprocessFileLineNumbers "Ambient\temperature.sqf"];
missionNamespace setVariable ["fn_megaRadiationZone", compileFinal preprocessFileLineNumbers "Ambient\fn_megaRadiationZone.sqf"];

/* Economy System (root) */
missionNamespace setVariable ["FN_Conversations", compileFinal preprocessFileLineNumbers "Economy System\Conversations.sqf"];
missionNamespace setVariable ["FN_economySystem", compileFinal preprocessFileLineNumbers "Economy System\economySystem.sqf"];
missionNamespace setVariable ["FN_economySystemCrate", compileFinal preprocessFileLineNumbers "Economy System\economySystemCrate.sqf"];
missionNamespace setVariable ["FN_spawnStaticTrader", compileFinal preprocessFileLineNumbers "Economy System\spawnStaticTrader.sqf"];
missionNamespace setVariable ["FN_traderTasks", compileFinal preprocessFileLineNumbers "Economy System\traderTasks.sqf"];

/* Economy System \ functions */
missionNamespace setVariable ["FN_PurchaseItem", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_PurchaseItem.sqf"];
missionNamespace setVariable ["FN_PurchaseMag", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_PurchaseMag.sqf"];
missionNamespace setVariable ["FN_SellAction", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_SellAction.sqf"];
missionNamespace setVariable ["FN_addItemToAmmoBox", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_addItemToAmmoBox.sqf"];
missionNamespace setVariable ["FN_ammoBoxCheck", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_ammoBoxCheck.sqf"];
missionNamespace setVariable ["FN_getPlayerFactionTag", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_getPlayerFactionTag.sqf"];
missionNamespace setVariable ["FN_isFactionHostileToTrader", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_isFactionHostileToTrader.sqf"];
missionNamespace setVariable ["FN_removeTraderActionsLocal", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_removeTraderActionsLocal.sqf"];
missionNamespace setVariable ["FN_refreshTraderAccessForPlayer", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_refreshTraderAccessForPlayer.sqf"];
missionNamespace setVariable ["FN_canDisbandPermanentAllianceAtCrate", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_canDisbandPermanentAllianceAtCrate.sqf"];
missionNamespace setVariable ["FN_disbandPermanentAllianceAtCrate", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_disbandPermanentAllianceAtCrate.sqf"];
missionNamespace setVariable ["FN_canPurchasePermanentAllianceAtCrate", compileFinal preprocessFileLineNumbers "Economy System\functions\FN_canPurchasePermanentAllianceAtCrate.sqf"];

/* Economy System \ functions \ actionFunctions */
missionNamespace setVariable ["FN_BINO", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_BINO.sqf"];
missionNamespace setVariable ["FN_EXPLOSIVE", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_EXPLOSIVE.sqf"];
missionNamespace setVariable ["FN_GRENADES", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_GRENADES.sqf"];
missionNamespace setVariable ["FN_MISC", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_MISC.sqf"];
missionNamespace setVariable ["FN_NVG", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_NVG.sqf"];
missionNamespace setVariable ["FN_ResetMenu", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_ResetMenu.sqf"];
missionNamespace setVariable ["FN_UNDERRAIL", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_UNDERRAIL.sqf"];
missionNamespace setVariable ["FN_backPack", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_backPack.sqf"];
missionNamespace setVariable ["FN_chestRig", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_chestRig.sqf"];
missionNamespace setVariable ["FN_clothing", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_clothing.sqf"];
missionNamespace setVariable ["FN_launchers", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_launchers.sqf"];
missionNamespace setVariable ["FN_mags", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_mags.sqf"];
missionNamespace setVariable ["FN_muzzle", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_muzzle.sqf"];
missionNamespace setVariable ["FN_optics", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_optics.sqf"];
missionNamespace setVariable ["FN_primary", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_primary.sqf"];
missionNamespace setVariable ["FN_rail", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_rail.sqf"];
missionNamespace setVariable ["FN_sidearms", compileFinal preprocessFileLineNumbers "Economy System\functions\actionFunctions\FN_sidearms.sqf"];

/* Economy System \ functions \ taskFunctions */
missionNamespace setVariable ["FN_deleteCurrentTask", compileFinal preprocessFileLineNumbers "Economy System\functions\taskFunctions\FN_deleteCurrentTask.sqf"];
missionNamespace setVariable ["FN_killTaskGroup", compileFinal preprocessFileLineNumbers "Economy System\functions\taskFunctions\FN_killTaskGroup.sqf"];
missionNamespace setVariable ["FN_killTaskGroupStationary", compileFinal preprocessFileLineNumbers "Economy System\functions\taskFunctions\FN_killTaskGroupStationary.sqf"];
missionNamespace setVariable ["FN_killTaskLeapers", compileFinal preprocessFileLineNumbers "Economy System\functions\taskFunctions\FN_killTaskLeapers.sqf"];
missionNamespace setVariable ["FN_killTaskPlayer", compileFinal preprocessFileLineNumbers "Economy System\functions\taskFunctions\FN_killTaskPlayer.sqf"];
missionNamespace setVariable ["FN_killTaskSniper", compileFinal preprocessFileLineNumbers "Economy System\functions\taskFunctions\FN_killTaskSniper.sqf"];
missionNamespace setVariable ["FN_killTaskGivenPriest", compileFinal preprocessFileLineNumbers "Economy System\functions\taskFunctions\FN_killTaskGivenPriest.sqf"];

/* LootSystem */
missionNamespace setVariable ["FN_attachAceLoot", compileFinal preprocessFileLineNumbers "LootSystem\FN_attachAceLoot.sqf"];
missionNamespace setVariable ["FN_fillLootCrate", compileFinal preprocessFileLineNumbers "LootSystem\FN_fillLootCrate.sqf"];
missionNamespace setVariable ["FN_lootSpawner", compileFinal preprocessFileLineNumbers "LootSystem\FN_lootSpawner.sqf"];
missionNamespace setVariable ["FN_spawnLootCrate", compileFinal preprocessFileLineNumbers "LootSystem\FN_spawnLootCrate.sqf"];
missionNamespace setVariable ["FN_spawnLootGround", compileFinal preprocessFileLineNumbers "LootSystem\FN_spawnLootGround.sqf"];

/* Server Ran Scripts */
missionNamespace setVariable ["FN_convertWeightedArray", compileFinal preprocessFileLineNumbers "Server Ran Scripts\convertWeightedArray.sqf"];
missionNamespace setVariable ["FN_lootGarbageSystem", compileFinal preprocessFileLineNumbers "Server Ran Scripts\FN_lootGarbageSystem.sqf"];
missionNamespace setVariable ["garbageCollection", compileFinal preprocessFileLineNumbers "Server Ran Scripts\garbageCollection.sqf"];
missionNamespace setVariable ["sleepTime", compileFinal preprocessFileLineNumbers "Server Ran Scripts\sleepTime.sqf"];

/* Root / Misc */
missionNamespace setVariable ["FN_arrayReturn", compileFinal preprocessFileLineNumbers "ArrayDatabase.sqf"];
missionNamespace setVariable ["FN_checkFaction", compileFinal preprocessFileLineNumbers "FN_checkFaction.sqf"];
missionNamespace setVariable ["FN_factionClothingCheck", compileFinal preprocessFileLineNumbers "FN_factionClothingCheck.sqf"];
missionNamespace setVariable ["FN_setDownBaseCache", compileFinal preprocessFileLineNumbers "FN_setDownBaseCache.sqf"];
missionNamespace setVariable ["FN_sleep", compileFinal preprocessFileLineNumbers "FN_sleep.sqf"];
missionNamespace setVariable ["FN_ExitingTrigger", compileFinal preprocessFileLineNumbers "ExitingTrigger.sqf"];
missionNamespace setVariable ["onPlayerKilled", compileFinal preprocessFileLineNumbers "onPlayerKilled.sqf"];
missionNamespace setVariable ["onPlayerRespawn", compileFinal preprocessFileLineNumbers "onPlayerRespawn.sqf"];
missionNamespace setVariable ["teleporter", compileFinal preprocessFileLineNumbers "teleporter.sqf"];
missionNamespace setVariable ["PF_init", compileFinal preprocessFileLineNumbers "PF\init.sqf"];

//Conversations system
missionNamespace setVariable ["LB_Chatter", compileFinal preprocessFileLineNumbers "Conversations\LB_Chatter.sqf"];
missionNamespace setVariable ["LB_Conversations", compileFinal preprocessFileLineNumbers "Conversations\LB_Conversations.sqf"];

/* Ritual system */
missionNamespace setVariable ["FN_updateRitualActions", compileFinal preprocessFileLineNumbers "ritualPowers\FN_updateRitualActions.sqf"];
missionNamespace setVariable ["FN_pray", compileFinal preprocessFileLineNumbers "ritualPowers\FN_pray.sqf"];

//Wanderer Rituals
missionNamespace setVariable ["FN_killGoliathShard", compileFinal preprocessFileLineNumbers "ritualPowers\Wanderer\FN_killGoliathShard.sqf"];
missionNamespace setVariable ["FN_killGoliathShardEnemy", compileFinal preprocessFileLineNumbers "ritualPowers\Wanderer\FN_killGoliathShardEnemy.sqf"];
missionNamespace setVariable ["FN_killGoliathShardALL", compileFinal preprocessFileLineNumbers "ritualPowers\Wanderer\FN_killGoliathShardALL.sqf"];
missionNamespace setVariable ["FN_summonMutants", compileFinal preprocessFileLineNumbers "ritualPowers\Wanderer\FN_summonMutants.sqf"];
missionNamespace setVariable ["FN_summonTank", compileFinal preprocessFileLineNumbers "ritualPowers\Wanderer\FN_summonTank.sqf"];
missionNamespace setVariable ["FN_banishUnit", compileFinal preprocessFileLineNumbers "ritualPowers\Wanderer\FN_banishUnit.sqf"];
missionNamespace setVariable ["FN_darknessCursor", compileFinal preprocessFileLineNumbers "ritualPowers\Wanderer\FN_darknessCursor.sqf"];

//Zeus Rituals
missionNamespace setVariable ["FN_zeusBolt", compileFinal preprocessFileLineNumbers "ritualPowers\Greek\FN_zeusBolt.sqf"];
missionNamespace setVariable ["FN_zeusStorm", compileFinal preprocessFileLineNumbers "ritualPowers\Greek\FN_zeusStorm.sqf"];
missionNamespace setVariable ["FN_zeusRain", compileFinal preprocessFileLineNumbers "ritualPowers\Greek\FN_zeusRain.sqf"];

//Hypnos Rituals
missionNamespace setVariable ["FN_hypnosBrainwashSingle", compileFinal preprocessFileLineNumbers "ritualPowers\Greek\FN_hypnosBrainwashSingle.sqf"];
missionNamespace setVariable ["FN_hypnosBrainwash", compileFinal preprocessFileLineNumbers "ritualPowers\Greek\FN_hypnosBrainwash.sqf"];

//Hermes Ritual 
missionNamespace setVariable ["FN_teleportRandom", compileFinal preprocessFileLineNumbers "ritualPowers\Greek\FN_teleportRandom.sqf"];
missionNamespace setVariable ["FN_teleportCursor", compileFinal preprocessFileLineNumbers "ritualPowers\Greek\FN_teleportCursor.sqf"];

//Chronos Rituals
missionNamespace setVariable ["FN_changeTime", compileFinal preprocessFileLineNumbers "ritualPowers\Greek\FN_changeTime.sqf"];

//Apollo Rituals
missionNamespace setVariable ["FN_healSelf", compileFinal preprocessFileLineNumbers "ritualPowers\Greek\FN_healSelf.sqf"];
missionNamespace setVariable ["FN_healAllies", compileFinal preprocessFileLineNumbers "ritualPowers\Greek\FN_healAllies.sqf"];

//Great Pig Rituals
missionNamespace setVariable ["FN_pigExplosion", compileFinal preprocessFileLineNumbers "ritualPowers\Pig\FN_pigExplosion.sqf"];
missionNamespace setVariable ["FN_pigWisdom", compileFinal preprocessFileLineNumbers "ritualPowers\Pig\FN_pigWisdom.sqf"];
missionNamespace setVariable ["FN_pigFireball", compileFinal preprocessFileLineNumbers "ritualPowers\Pig\FN_pigFireball.sqf"];

//AI Magic Scripts
missionNamespace setVariable ["FN_zeusBolt_AI", compileFinal preprocessFileLineNumbers "ritualPowers\AI\FN_zeusBolt_AI.sqf"];
missionNamespace setVariable ["FN_pigFireball_AI", compileFinal preprocessFileLineNumbers "ritualPowers\AI\FN_pigFireball_AI.sqf"];
missionNamespace setVariable ["FN_banishUnit_AI", compileFinal preprocessFileLineNumbers "ritualPowers\AI\FN_banishUnit_AI.sqf"];
missionNamespace setVariable ["FN_teleportToPlayerSafePos_AI", compileFinal preprocessFileLineNumbers "ritualPowers\AI\FN_teleportToPlayerSafePos_AI.sqf"];
missionNamespace setVariable ["FN_healAllies_AI", compileFinal preprocessFileLineNumbers "ritualPowers\AI\FN_healAllies_AI.sqf"];
missionNamespace setVariable ["FN_pigWisdom_AI", compileFinal preprocessFileLineNumbers "ritualPowers\AI\FN_pigWisdom_AI.sqf"];
missionNamespace setVariable ["FN_darknessCursor_AI", compileFinal preprocessFileLineNumbers "ritualPowers\AI\FN_darknessCursor_AI.sqf"];
missionNamespace setVariable ["FN_summonLeaper_AI", compileFinal preprocessFileLineNumbers "ritualPowers\AI\FN_summonLeaper_AI.sqf"];

//Main Quest Line
missionNamespace setVariable ["LBMQ_fnc_taskCreateLocal", compileFinal preprocessFileLineNumbers "MainQuest\functions\helpers\fn_taskCreateLocal.sqf"];
missionNamespace setVariable ["LBMQ_fnc_resolveTaskDestination", compileFinal preprocessFileLineNumbers "MainQuest\functions\helpers\fn_resolveTaskDestination.sqf"];
missionNamespace setVariable ["LBMQ_fnc_playDialogueLocal", compileFinal preprocessFileLineNumbers "MainQuest\functions\helpers\fn_playDialogueLocal.sqf"];
missionNamespace setVariable ["LBMQ_fnc_updateTaskLocal", compileFinal preprocessFileLineNumbers "MainQuest\functions\fn_updateTaskLocal.sqf"];
missionNamespace setVariable ["LBMQ_fnc_mainQuestDebugAssign", compileFinal preprocessFileLineNumbers "MainQuest\functions\helpers\fn_mainQuestDebugAssign.sqf"];
missionNamespace setVariable ["LBMQ_fnc_task001Main", compileFinal preprocessFileLineNumbers "MainQuest\functions\001\fn_task001Main.sqf"];
missionNamespace setVariable ["LBMQ_fnc_task002Main", compileFinal preprocessFileLineNumbers "MainQuest\functions\002\fn_task002Main.sqf"];
missionNamespace setVariable ["LBMQ_fnc_task003Main", compileFinal preprocessFileLineNumbers "MainQuest\functions\003\fn_task003Main.sqf"];
missionNamespace setVariable ["LBMQ_fnc_task004Main", compileFinal preprocessFileLineNumbers "MainQuest\functions\004\fn_task004Main.sqf"];
missionNamespace setVariable ["LBMQ_fnc_createTaskFlag", compileFinal preprocessFileLineNumbers "MainQuest\functions\helpers\fn_createTaskFlag.sqf"];

// Money System
missionNamespace setVariable ["FN_moneyInit", compileFinal preprocessFileLineNumbers "MoneySystem\moneyInit.sqf"];
[] spawn (missionNamespace getVariable "FN_moneyInit");

// Turning off VoN
0 enableChannel [true, false];
1 enableChannel [true, false];
2 enableChannel [true, false];
3 enableChannel [true, false];
4 enableChannel [true, false];
5 enableChannel [true, true];

if (!isDedicated) then {
	waitUntil {!isNull player};
	sleep 0.1;
	
	// Define the function to add multiple diary entries
	addDiaryEntries = {
		params ["_entries"];
		
		{
			private _title = _x select 0;
			private _content = _x select 1;
			player createDiaryRecord [
				"Diary",
				[_title, _content]
			];
		} forEach _entries;
	};

	// Ensure the function is defined globally
	if (isNil "addDiaryEntries") then {
		missionNamespace setVariable ["addDiaryEntries", addDiaryEntries];
	};

	// Define the diary entries
	private _diaryEntries = [
		["Base Building", "You are allowed to use ace fortify to base build in the scenario; however, due to the garbage collector, the fortifications will be deleted if you don't take the correct precautions. If you put down a flag using the self ace interactions then Scenario Actions to put down a flag. Everything around that flag within 150 meters will not despawn. That means EVERYTHING. Nothing will despawn, so if you need to delete some stuff, you must do it manually."],
		["Sleep System", "The sleep system allows the player(s) to 'sleep' through the night. The hours allowed to be slept through is 8pm to 6am. For the server to sleep through the night, all players must be 'Trying to sleep' at their respective sleeping bag. This can be accessed by putting down the sleeping bag in the ace self interactions menu. From there, look at the sleeping back that would have put at your feet, and select 'Try to sleep.' Once all the players in the server during the appropriate time are 'Trying to sleep,' this will skip the night to 6am. "],
		["Factions", "All groups on the island except the Boonie Boys and the Survivors Union start out hostile. Other factions include Pigs Flesh, Altis Liberation Front, World Order, the Russian Federation, the United States Army, New Horizon, The Red Bullet, Ravens Cloak, Deadmans Trident, the Republic of Altis, PMC Group Alpha, Bandits and Renegades. Your standing can change based on the clothing you wear; dressing like a faction or one of its allies makes them consider you friendly so long as the units spawn after the change."],
		["Deaths", "Each time a player succumbs to their wounds, an anomaly of some kind makes the player inhabit a random persons body. This kills the person that was once inhabiting the body, and makes it so the player gets to live on. This essentially makes the player invincible to death. If any factions find out about this, they will have adverse reactions. "],
		["Backstory", "EVERYONE else on the island is hostile to the player. You may make your own head canon for your character, otherwise use the following: Your name is John Smith, a native resident of the island. After surviving years in the wasteland, you've become quite hardened. You joined the closest faction to make some easy friends/allies. Your ultimate mission is to survive and thrive in the wasteland. Not just make a base and live there, but compete with other survivors and see who is truly the fittest. To do this, you must test yourself by entering mutant zones willingly and taking on entire bandit camps. At heart, you are a warrior, and you want to prove to the wasteland you are not an easy target to take advantage of."],
		["Locations", "Locations that are NOT within faction borders (any spot with a question mark) are completely random. The exact location, how many people are there, who are there, if there are zombies there, if there are multiple factions there, are there mutants also there, and more are all completely random. This makes every question marked location unique every time you visit it. Never expect the same thing each time. Be warned, this means that leaving an area will reset any factions that were there. Locations within faction borders are fairly consistent except for the amount of people there (usually), and the gear they have. <br/><br/>All locations if teleported into will NOT spawn anything. You must enter them naturally to spawn anything. So if you set up a respawn at a location, this will ensure that the location does not spawn any AI. "],
		["Faction Traders", "Each faction's flag on the map marks a trader hub. Traders themselves are neutral, but hostile guards will still engage you if you're not friendly with their faction. Both the trader NPC and the ammo cache inside their office allow buying and selling items using bank notes. Traders may also wander at friendly locations; they sometimes have limited backpack space, so selling large items may require multiple transactions."],
		["Trader Tasks", "Trader tasks are a way to earn money and reputation with the traders. They can be found in the trader's office, and can be completed for money and reputation. The tasks vary from killing a certain amount of enemies, to collecting items, to delivering items. Completing these tasks will help you get better gear from the traders."],
		["Random Encounters", "Random encounters are a way to spice up the game. They can happen at any time, and can range from a simple bandit ambush, to a full on mutant attack. These encounters can be triggered by entering certain areas, or by simply being in the wrong place at the wrong time."],
		["Loot Boxes", "Every location marked on the map has the chance to spawn a loot box. Friendly camps do NOT spawn loot boxes, but any hostile group including mutants to bandits will spawn loot boxes. The box will be an army green WW2 style medical container."],
		["Hydration & Nutrition", "You must eat and drink to survive. Hydration and nutrition decrease over time and faster in harsh conditions. Check your levels via scenario actions; running out of either will cause you to pass out and eventually die. Refill canteens at water sources and purify water when needed."],
		["Radiation", "Radiation comes from certain idols, mutants and even heavy rain. Use gas masks and CBRN gear to reduce exposure. High exposure is lethal, so watch for warnings and take shelter or retreat if your levels climb too high."],
		["Sanity", "Disturbing events and mutant encounters wear down your sanity. Low sanity can trigger hallucinations or other negative effects. Rest in safe areas or interact with friendly factions to recover."],
		["Temperature System", "Temperature system is calculated based on your clothing, altitude, if it's raining, if you’re in the water, if you're in a building, and if you're near a fire. All of these things combine into how your temperature is calculated. You will start to freeze if your body temperature goes below 91.5F. You will need to either make a fire, or enter the hot zone(s) on the map to combat the cold. If your body goes below 89F, you will die. Being at a low altitude, in a building, and having warm clothing can help delay frostbite but will not stop it. Warm Clothing are as follows: Clothing with Jacket or sweater. Any hot weather clothing is those that includes T-Shirts/Tanktops. The 'Check your temp' option in scenario actions will tell you if your equipment is rated for cold weather.<br/><br/>Building a Fire: use a 'Box of matches' and something flamable (like bank notes) to create a fire. "],
		["MISSION", "Survive. Create a base. Go on patrols. Take missions from traders. Protect your home while serving the Survivors Union if you wish to. Do whatever you want in the scenario. Just be warned, without a Zeus, it is limited but with a Zeus, the possibilities are endless. "],
		["Garbage Collection", "Due to the scenario having the possibility of getting very cluttered, there is a very aggressive garbage clean up script running on the server. If an AI that is NOT within 150 meters from a base flag pole and is over 1000 meters from the nearest player, then it WILL be deleted. Same with vehicles and vehicle wrecks except they need to be 2000 meters from the nearest player. If a player exceeds the 2000 meter mark for the car, just think of it as a bandit stealing their car."],
		["Survival System", "In this scenario, there is a custom made hydration and nutrition (HN) system that utilizes other scenario specific functions such as temperature and radiation. To use the HN system, you must use the ace self-interactions menu to reach the Scenario Actions. From there, to reach HN you need to go to Scenario Actions -> Survival System. From here, you are given a myriad of options to operate the scenario survival system. These should all be self explanatory, but I will explain each nonetheless:<br/><br/>Check Temperature: Checks your player’s current temperature as well as the clothing description<br/><br/>Check Rad Exposure: Checks the player’s radiation exposure if they have a geiger counter<br/><br/>Check Hydration and Nutrition: Checks the players current hydration and nutrition level. This is calculated with the player's current temperature in mind. The colder or hotter the player is, the faster they dehydrate and starve.<br/><br/>Drink Water: This function drinks water from the player’s inventory prioritizing water sources in the following order: soda, water bottles, canteens, unpurified water bottles, and finally unpurified canteens. Take note that sodas and unpurified water sources do give amounts of radiation while clean water sources do not.<br/><br/>Eat Food: This function eats food from the player’s inventory prioritizing:<br/>1. Powdered milk and rice<br/>2. Cooked chicken, beans, and bacon<br/>3. MRE’s and cooked boar (5 rads)<br/>4. Cooked sheep<br/>5. Uncooked boar meat (5 rads)<br/>6. Uncooked sheep meat<br/>7. Uncooked chicken meat (5 rads)<br/>8. Cooked rabbit meat (35 rads)<br/>9. Uncooked rabbit meat (35 rads)<br/>10. Cooked buffalo meat (100 rads)<br/>11.Uncooked buffalo meat (100 rads)<br/><br/>Refill Canteen: If the player has an empty canteen and is near a water source (ocean, well, water tank, etc) they can refill their canteen with contaminated water.<br/><br/>Purify Water: If the player has a contaminated water bottle or canteen, they can purify their water source using water purification tablets to make the water safe to drink.<br/><br/>Skin Animal: The player can skin an animal (goat, boar, rabbit, human, dog, sheep, and chickens) to obtain their uncooked meat. If the player does not have a gutting knife, they can still skin the animal (with the exception of the human) to obtain lesser meat (rabbit meat). If the player uses a gutting knife, they can obtain the default meat from the animal.<br/><br/>Cook Meat: The player can, if near a fire source, can cook their uncooked meat. If the player has multiple pieces of uncooked meat, they can cook them all at once. Boar gives cooked boar meat, goat gives cooked goat meat, and etc.<br/><br/>Make Fire: If the player has matches and a fire starter source (bank notes, documents, and notepad) they can craft a fireplace using 1 of the fire starter’s in this priority: notepad, documents, and finally bank notes. Note that the matches last indefinitely."]
	];
	
	private _diaryFactions = [
		["Factions", "Most factions on the island begin hostile to you. Only the Boonie Boys and the Survivors Union are generally safe at the start. Your clothing can affect how factions treat you; if you dress like a faction or one of its allies, newly spawned units may consider you friendly. Open the faction-specific entries below for each group's doctrine, alliances, and identifying features."],
		["PF - Pig Flesh", "<img image='pics\FactionPhotos\PF.paa' width='256' height='256'/><br/><br/><font size='18'>Pig Flesh</font><br/><br/><font size='16'>Fighting Style:</font> Rush and destroy everything<br/><font size='16'>Intimidation:</font> Extremely Hard to Intimidate<br/><font size='16'>Pre-existing Alliances:</font> None<br/><font size='16'>Alliance Factor:</font> Player becomes a cannibal<br/><br/><font size='16'>Description:</font><br/>Cannibals that worship the age of the apocalypse, and believe the more human flesh they devour, the stronger they become.<br/><br/><font size='16'>Distinguishing Features:</font><br/>Wears mostly red clothing, and often has bad equipment."],
		["ALF - Altis Liberation Front", "<img image='pics\FactionPhotos\ALF.paa' width='256' height='256'/><br/><br/><font size='18'>Altis Liberation Front</font><br/><br/><font size='16'>Fighting Style:</font> Tactical and thought out, 3:1 ratio<br/><font size='16'>Intimidation:</font> Very Hard to Intimidate<br/><font size='16'>Pre-existing Alliances:</font> None<br/><font size='16'>Alliance Factor:</font> Players must give up their entire faction and all of their territory, or pass their tests of combat.<br/><br/><font size='16'>Description:</font><br/>A radical paramilitary faction that was fighting even before the apocalypse for the liberation of Altis from US occupation. Now they fight for superiority in the wasteland at all costs.<br/><br/><font size='16'>Distinguishing Features:</font><br/>Battered PMC / paramilitary gear. Older M16/AR platforms and Česká zbrojovka weaponary"],
		["WO - World Order", "<img image='pics\FactionPhotos\WO.paa' width='256' height='256'/><br/><br/><font size='18'>World Order</font><br/><br/><font size='16'>Fighting Style:</font> Fall back and wait for reinforcements<br/><font size='16'>Intimidation:</font> Hard<br/><font size='16'>Pre-existing Alliances:</font> None<br/><font size='16'>Alliance Factor:</font> Pledge allegiance to their leader, and provide support whenever they need it.<br/><br/><font size='16'>Description:</font><br/>A social nationalist faction that fights for world domination under their godly leader.<br/><br/><font size='16'>Distinguishing Features:</font><br/>Wears mostly black, and primarily uses G36 rifles."],
		["RU - Russian Federation", "<img image='pics\FactionPhotos\RU.paa' width='256' height='256'/><br/><br/><font size='18'>Russian Federation</font><br/><br/><font size='16'>Fighting Style:</font> Disorganization of enemy command with defensive and offensive operations<br/><font size='16'>Intimidation:</font> Extremely Hard<br/><font size='16'>Pre-existing Alliances:</font> None<br/><font size='16'>Alliance Factor:</font> Surrender completely and be willing to be conscripted into their army.<br/><br/><font size='16'>Description:</font><br/>The Russian Army was tasked with containing the outbreak by any means necessary. Rumors say they also have a secondary mission behind their deployment into the dead zones.<br/><br/><font size='16'>Distinguishing Features:</font><br/>EMR camouflage and AK-74M pattern rifles."],
		["US - United States Army", "<img image='pics\FactionPhotos\US.paa' width='256' height='256'/><br/><br/><font size='18'>United States Army</font><br/><br/><font size='16'>Fighting Style:</font> 3:1 ratio and overwhelming the enemy with superior firepower<br/><font size='16'>Intimidation:</font> Very Hard<br/><font size='16'>Pre-existing Alliances:</font> None<br/><font size='16'>Alliance Factor:</font> Fight for the liberation of Altis, and help whenever the Army calls you.<br/><br/><font size='16'>Description:</font><br/>A battalion of CBRN-trained infantry has been deployed to the infected region to 'cure' it. The UN tasked the US with containing the infection, though many suspect there is more to their mission.<br/><br/><font size='16'>Distinguishing Features:</font><br/>Multicam CBRN gear, M40 gas masks, and AR-platform weapons."],
		["NH - New Horizon", "<img image='pics\FactionPhotos\NH.paa' width='256' height='256'/><br/><br/><font size='18'>New Horizon</font><br/><br/><font size='16'>Fighting Style:</font> Hit and run tactics<br/><font size='16'>Intimidation:</font> Medium<br/><font size='16'>Pre-existing Alliances:</font> Deadman's Trident<br/><font size='16'>Alliance Factor:</font> Provide mutual support for their faction and yours.<br/><br/><font size='16'>Description:</font><br/>A faction that embraces the apocalypse and believes it is mother nature weeding out the weak. They fight to survive and will do whatever is required to continue doing so.<br/><br/><font size='16'>Distinguishing Features:</font><br/>Mostly green clothing with a mandatory green shemagh."],
		["RC - Raven's Cloak", "<img image='pics\FactionPhotos\RC.paa' width='256' height='256'/><br/><br/><font size='18'>Raven's Cloak</font><br/><br/><font size='16'>Fighting Style:</font> Sneak up and strike fast<br/><font size='16'>Intimidation:</font> Medium<br/><font size='16'>Pre-existing Alliances:</font> The Red Bullet<br/><font size='16'>Alliance Factor:</font> Kill a ROA camp, support them on their raids, and attend daily sermons.<br/><br/><font size='16'>Description:</font><br/>A once powerful bandit group turned ritualistic cultist faction, the Raven’s Cloak believe in the all powerful god the Wanderer who seeks the destruction of all world powers, supernatural or not<br/><br/><font size='16'>Distinguishing Features:</font><br/>A dark uniform with moderate primaries. Typically hard to distinguish due to their intentional lack of identifying features other than their deprecated speech patterns."],
		["DT - Deadman's Trident", "<img image='pics\FactionPhotos\DT.paa' width='256' height='256'/><br/><br/><font size='18'>Deadman's Trident</font><br/><br/><font size='16'>Fighting Style:</font> Defense is the best offense; let the enemy push to you and then rain hell on them<br/><font size='16'>Intimidation:</font> Easy<br/><font size='16'>Pre-existing Alliances:</font> New Horizon<br/><font size='16'>Alliance Factor:</font> Pledge allegiance to Zeus, and follow their leader's might.<br/><br/><font size='16'>Description:</font><br/>A faction that believes in the Greek pantheon of gods and punishes non-believers harshly.<br/><br/><font size='16'>Distinguishing Features:</font><br/>Blue headgear and vests with white facewear."],
		["ROA - Republic of Altis", "<img image='pics\FactionPhotos\ROA.paa' width='256' height='256'/><br/><br/><font size='18'>Republic of Altis</font><br/><br/><font size='16'>Fighting Style:</font> Slow and methodical; impatience is the downfall of the enemy<br/><font size='16'>Intimidation:</font> Hard<br/><font size='16'>Pre-existing Alliances:</font> Survivors Union<br/><font size='16'>Alliance Factor:</font> Become a citizen of their republic, and support ROA when needed.<br/><br/><font size='16'>Description:</font><br/>A PMC force that was already based in Altis. They are extremely wary of unknown survivors, and often shoot first and ask questions later.<br/><br/><font size='16'>Distinguishing Features:</font><br/>PMC gear with multicam equipment, often paired with button-up shirts and cargo pants."],
		["PMC - PMC Group Alpha", "<img image='pics\FactionPhotos\PMC.paa' width='256' height='256'/><br/><br/><font size='18'>PMC Group Alpha</font><br/><br/><font size='16'>Fighting Style:</font> Reactive QRF-style response with reinforcements to ongoing fights; mortars if they are losing<br/><font size='16'>Intimidation:</font> Extremely Hard<br/><font size='16'>Pre-existing Alliances:</font> None<br/><font size='16'>Alliance Factor:</font> Assist them on high-risk missions and wear their M81 camouflage. You must formally join their organization to become allies.<br/><br/><font size='16'>Description:</font><br/>A professional mercenary force that responds aggressively to threats and reinforces trouble spots fast.<br/><br/><font size='16'>Distinguishing Features:</font><br/>M81 camouflage with AK-style weapons. Five-man QRF teams are common."],
		["SU - Survivors Union", "<img image='pics\FactionPhotos\SU.paa' width='256' height='256'/><br/><br/><font size='18'>Survivors Union</font><br/><br/><font size='16'>Fighting Style:</font> Retreat to fortified positions, then overwhelm the enemy<br/><font size='16'>Intimidation:</font> Medium<br/><font size='16'>Pre-existing Alliances:</font> Boonie Boys and ROA<br/><font size='16'>Alliance Factor:</font> Kill no friendly survivors, and help survivors whenever you can.<br/><br/><font size='16'>Description:</font><br/>A faction of survivors that grouped together to protect the weak from harsher factions. Their motto is, “One less survivor is a loss, no matter what.” With this motto, they attempted to instill the wasteland with morals/ethics, and with this mindset, they captured the attention of US “peacekeeping” forces. They are the only faction that has access to modern medicines through US medical supplies.<br/><br/><font size='16'>Distinguishing Features:</font><br/>No strict uniform standard. Mostly poor to moderate gear, commonly with gas masks."],
		["BB - Boonie Boys", "<img image='pics\FactionPhotos\BB.paa' width='256' height='256'/><br/><br/><font size='18'>Boonie Boys</font><br/><br/><font size='16'>Fighting Style:</font> Small, well-equipped offensive teams backed by many lesser-equipped defenders<br/><font size='16'>Intimidation:</font> Hard<br/><font size='16'>Pre-existing Alliances:</font> Survivors Union<br/><font size='16'>Alliance Factor:</font> Keep a boonie hat on your person at all times, and prove that you can be a reliable ally.<br/><br/><font size='16'>Description:</font><br/>A newer faction that spread from Altis with a reputation for being good to allies but ruthless with enemies. Their legend draws many survivors seeking safety, though their brutality attracts plenty of undisciplined recruits as well.<br/><br/><font size='16'>Distinguishing Features:</font><br/>Boonie hats are central to their identity."],
		["TRB - The Red Bullet", "<img image='pics\FactionPhotos\TRB.paa' width='256' height='256'/><br/><br/><font size='18'>The Red Bullet</font><br/><br/><font size='16'>Fighting Style:</font>Large groups of semi-trained soldiers thrown at the enemy while more competent spec ops manuever to attack the enemy from their flank<br/><font size='16'>Intimidation:</font> Hard<br/><font size='16'>Pre-existing Alliances:</font> Raven’s Cloak<br/><font size='16'>Alliance Factor:</font>Abandon all other alliances and have the faction’s emblem be carved on your back<br/><br/><font size='16'>Description:</font><br/>A radical faction that emerged from Eastern Europe spreading the stories of Peter the Great, a godly figure amongst the faction that grew around this man’s influence. Through his great actions in Eastern Europe and some of Asia, he nearly single-handedly liberated ¾ million square miles of land (or so the stories would have the world believe). Peter the Great now directs his faction to the rest of the world to spread his greatness, and wish for people to follow him so that he can free the world of the apocalypse with no hindrance from other survivors<br/><br/><font size='16'>Distinguishing Features:</font><br/>Russian-style weapons with primitive gorkas worn by all members. "],
		["Bandits", "<img image='pics\FactionPhotos\Bandit.paa' width='256' height='256'/><br/><br/><font size='18'>Bandits</font><br/><br/><font size='16'>Fighting Style:</font> Opportunistic ambushes, raids, and harassment of weaker targets<br/><font size='16'>Intimidation:</font> Low to Medium<br/><font size='16'>Pre-existing Alliances:</font> None guaranteed<br/><font size='16'>Alliance Factor:</font> None. They are generally hostile opportunists and are not a dependable diplomatic faction.<br/><br/><font size='16'>Description:</font><br/>Bandits are common wasteland predators who survive through robbery, ambushes, and taking advantage of isolated survivors. They are less organized than major factions, but still dangerous because of their unpredictability.<br/><br/><font size='16'>Distinguishing Features:</font><br/>No standard uniform. Mixed scavenged gear, uneven equipment quality, and improvised-looking loadouts."]
	];

	addDiaryEntries = {
		params ["_diaryEntries", "_diaryFactions"];

		player createDiarySubject ["LB_General", "Scenario Guide"];
		{
			private _title = _x select 0;
			private _content = _x select 1;

			player createDiaryRecord [
				"LB_General",
				[_title, _content]
			];
		} forEach _diaryEntries;

		player createDiarySubject ["LB_Factions", "Faction Guide"];
		{
			private _title = _x select 0;
			private _content = _x select 1;

			player createDiaryRecord [
				"LB_Factions",
				[_title,_content]
			];
		} forEach _diaryFactions;
	};

	if (isNil "addDiaryEntries") then {
		missionNamespace setVariable ["addDiaryEntries", addDiaryEntries];
	};

	[_diaryEntries, _diaryFactions] call addDiaryEntries;


	// adding any food or drinks to the player's ace interact menu as they spawn;
	player addEventHandler ["InventoryClosed", {
		params ["_unit","_container"];
		// Refresh drink menu
		[_unit] call FN_updateDrinkActions;
		// Refresh eat menu
		[_unit] call FN_updateEatActions;

		[_unit] spawn FN_updateRitualActions;

		hintSilent "";
	}];

	player addEventHandler ["InventoryOpened", {
		params ["_unit"];

		//–– Gather stats ––
		private _temp = [_unit] call FN_getTemp;
		private _hydrationNutrition = [_unit] call FN_getHydrationNutrition;
		private _sanity = [_unit] call FN_getSanity;
		private _defecationStatus = [_unit, false] call FN_checkDefecationStatus;
		private _rad = _unit getVariable ["Rad", 0];
		private _hasGeiger = ((itemsWithMagazines _unit) select { _x == "rvg_geiger" }) isNotEqualTo [];
		private _faction = [_unit] call FN_checkFaction;

		//–– Build “Body Temperature” line ––
		private _tempLine = if (_temp < 93) then {
			format ["<t size='1.5' color='#0000ff'>Body Temperature: %1</t>", _temp]
		} else {
			if (_temp > 100) then {
				format ["<t size='1.5' color='#F38701'>Body Temperature: %1</t>", _temp]
			} else {
				format ["<t size='1.3'>Body Temperature: %1</t>", _temp]
			}
		};

		//–– Build “Hydration” line ––
		private _hydrVal = _hydrationNutrition select 0;
		private _hydrationLine = if (_hydrVal < 1) then {
			format ["<t size='1.5' color='#36aac2'>Hydration: %1</t>", _hydrVal]
		} else {
			if (_hydrVal < 20) then {
				format ["<t size='1.5' color='#74d3e7'>Hydration: %1</t>", _hydrVal]
			} else {
				format ["<t size='1.3'>Hydration: %1</t>", _hydrVal]
			};
		};

		//–– Build “Nutrition” line ––
		private _nutrVal = _hydrationNutrition select 1;
		private _nutritionLine = if (_nutrVal < 1) then {
			format ["<t size='1.5' color='#aa6910'>Nutrition: %1</t>", _nutrVal]
		} else {
			if (_nutrVal < 20) then {
				format ["<t size='1.5' color='#e7b774'>Nutrition: %1</t>", _nutrVal]
			} else {
				format ["<t size='1.3'>Nutrition: %1</t>", _nutrVal]
			};
		};

		//–– Build “Defecation Status” line (no custom color) ––
		private _defecationLine = format ["<t size='1.3'>%1</t>", _defecationStatus];

		//–– Build “Sanity” line ––
		private _sanityLine = if (_sanity <= 10) then {
			format ["<t size='1.5' color='#f860000ff'>Sanity: %1</t>", _sanity]
		} else {
			format ["<t size='1.3'>Sanity: %1</t>", _sanity]
		};

		//–– Build “Radiation Exposure” line ––
		private _radLine = if (_rad >= 50) then {
			format ["<t size='1.5' color='#ff0000'>Radiation Exposure: %1</t>", _rad]
		} else {
			format ["<t size='1.3'>Radiation Exposure: %1</t>", _rad]
		};
		private _noRadLine = if (_rad >= 50) then {
			"<t size='1.5' color='#ff0000'>Radiation Exposure: *Geiger Counter Required*</t>"
		} else {
			"<t size='1.3'>Radiation Exposure: *Geiger Counter Required*</t>"
		};

		//–– Build “Faction” line (default size, no color) ––
		private _factionLine = format ["<t size='1.3'>Faction: %1</t>", (_faction joinString " and ")];

		private _ritualStatusPig = format ["<t size='1.3'>Ritual Power (Pig): %1</t>", (_unit getVariable ["ritualStatusPig",0])];
		private _ritualStatusZeus = format ["<t size='1.3'>Ritual Power (Greek): %1</t>", (_unit getVariable ["ritualStatusZeus",0])];
		private _ritualStatusWanderer = format ["<t size='1.3'>Ritual Power (Wanderer): %1</t>", (_unit getVariable ["ritualStatusWanderer",0])];

		//–– Build “Money” line ––
		private _money = _unit getVariable ["LB_money", 0];
		private _moneyLine = format ["<t size='1.3'>Money: %1</t>", _money];

		//–– Assemble all lines and display ––
		private _hintText =
			_tempLine + "<br/><br/>" +
			_hydrationLine + "<br/>" +
			_nutritionLine + "<br/><br/>" +
			_defecationLine + "<br/><br/>" +
			_sanityLine + "<br/><br/>" +
			(if _hasGeiger then { _radLine } else { _noRadLine }) + "<br/><br/>" +
			_factionLine + "<br/><br/>" +
			_ritualStatusPig + "<br/>" +
			_ritualStatusZeus + "<br/>" +
			_ritualStatusWanderer + "<br/><br/>" +
			_moneyLine;

		hintSilent parseText _hintText;
	}];

	addMissionEventHandler ["EntityRespawned", {
		params ["_newUnit","_oldUnit"];
		if (isPlayer _newUnit) then {
			_newUnit addEventHandler ["InventoryClosed", {
				params ["_unit"];
				[_unit] call FN_updateDrinkActions;
				// Refresh eat menu
				[_unit] call FN_updateEatActions;
				// Refresh the faction alliance check
				[_unit] call FN_factionClothingCheck;
				//check ritual power of the player and assigns appriorate spells to the player
				[_unit] spawn FN_updateRitualActions;
			}];
		};
	}];

	//Ace organization actions
	private _actionMain = ["Scenario_Actions","Scenario Actions","",{},{true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions"], _actionMain] call ace_interact_menu_fnc_addActionToClass;

	private _survivalFolder = ["Survival_System", "Survival System", "", {}, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions"], _survivalFolder] call ace_interact_menu_fnc_addActionToClass;

	private _checkInv = ["check_inv","Scenario Checks","",{},{true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions"], _checkInv] call ace_interact_menu_fnc_addActionToClass; 

	private _ritualPowers = ["ritualPowers","Ritual Powers","",{},{true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions"], _ritualPowers] call ace_interact_menu_fnc_addActionToClass; 

	// Holster Weapon ACE Self-Action
	private _actionHolster = ["holster","Holster Weapon","",{player action ["SwitchWeapon",player,player,-1];}, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player),1,["ACE_SelfActions"],_actionHolster] call ace_interact_menu_fnc_addActionToClass;

	//Ace Scenario Actions
	private _action = ["Arsenal","Open the Arsenal","",{[player, player, true] call ace_arsenal_fnc_openBox;},{true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","Scenario_Actions"], _action] call ace_interact_menu_fnc_addActionToClass;

	private _actionSleep = ["sleep","Lay Down Sleeping Bag","",{call FN_sleep},{true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","Scenario_Actions"], _actionSleep] call ace_interact_menu_fnc_addActionToClass;

	private _actionFlag = ["base","Set Down Base Flag","",{call FN_setDownBaseCache},{true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","Scenario_Actions"], _actionFlag] call ace_interact_menu_fnc_addActionToClass;

	private _actionTemp = ["temperature", "Check Clothing Capabilities", "", {call FN_temperature;}, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Scenario_Actions"], _actionTemp] call ace_interact_menu_fnc_addActionToClass;

	private _actionDisableRadioAudio = ["LB_Disable_Radio_Audio","Turn Off Radio Audio","",{	player setVariable ["LB_radioAudioDisabled", true, true];	hintSilent "Radio audio disabled. You will no longer receive LB chatter transceiver comms.";},{ !(player getVariable ["LB_radioAudioDisabled", false]) }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","Scenario_Actions"], _actionDisableRadioAudio] call ace_interact_menu_fnc_addActionToClass;

	private _actionEnableRadioAudio = ["LB_Enable_Radio_Audio","Turn On Radio Audio","",{	player setVariable ["LB_radioAudioDisabled", false, true];	hintSilent "Radio audio enabled. You can receive LB chatter transceiver comms again.";},{ player getVariable ["LB_radioAudioDisabled", false] }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","Scenario_Actions"], _actionEnableRadioAudio] call ace_interact_menu_fnc_addActionToClass;
	
	private _actionDisableRadioTranscript = ["LB_Disable_Radio_Transcript","Turn Off Radio Transcript","",{	player setVariable ["LB_radioTranscriptDisabled", true, true];	hintSilent "Radio transcript disabled. You will no longer receive LB chatter system chat comms.";},{ !(player getVariable ["LB_radioTranscriptDisabled", false]) }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","Scenario_Actions"], _actionDisableRadioTranscript] call ace_interact_menu_fnc_addActionToClass;

	private _actionEnableRadioTranscript = ["LB_Enable_Radio_Transcript","Turn On Radio Transcript","",{	player setVariable ["LB_radioTranscriptDisabled", false, true];	hintSilent "Radio transcript enabled. You can receive LB chatter system chat comms again.";},{ player getVariable ["LB_radioTranscriptDisabled", false] }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","Scenario_Actions"], _actionEnableRadioTranscript] call ace_interact_menu_fnc_addActionToClass;
	
	private _actionPray = ["pray","Pray","",{[player spawn FN_pray]},{true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","Scenario_Actions"], _actionPray] call ace_interact_menu_fnc_addActionToClass;
	
	missionNamespace setVariable ["LBMQ_mainQuestDebugEnabled", false];
	private _mainQuestDebugFolder = ["Main_Quest_Debug", "Main Quest Debug", "", {}, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Scenario_Actions"], _mainQuestDebugFolder] call ace_interact_menu_fnc_addActionToClass;

	private _enableMainQuestDebug = ["LBMQ_Enable_Debug","Enable Main Quest Debug","",{ missionNamespace setVariable ["LBMQ_mainQuestDebugEnabled", true]; },{ !(missionNamespace getVariable ["LBMQ_mainQuestDebugEnabled", false]) }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Scenario_Actions", "Main_Quest_Debug"], _enableMainQuestDebug] call ace_interact_menu_fnc_addActionToClass;

	private _giveTask001 = ["LBMQ_Give_Task001","Give Task001","",{ [player, "Task001"] call (missionNamespace getVariable "LBMQ_fnc_mainQuestDebugAssign"); },{ missionNamespace getVariable ["LBMQ_mainQuestDebugEnabled", false] }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Scenario_Actions", "Main_Quest_Debug"], _giveTask001] call ace_interact_menu_fnc_addActionToClass;

	private _giveTask002 = ["LBMQ_Give_Task002","Give Task002","",{ [player, "Task002"] call (missionNamespace getVariable "LBMQ_fnc_mainQuestDebugAssign"); },{ missionNamespace getVariable ["LBMQ_mainQuestDebugEnabled", false] }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Scenario_Actions", "Main_Quest_Debug"], _giveTask002] call ace_interact_menu_fnc_addActionToClass;

	private _giveTask003 = ["LBMQ_Give_Task003","Give Task003","",{ [player, "Task003"] call (missionNamespace getVariable "LBMQ_fnc_mainQuestDebugAssign"); },{ missionNamespace getVariable ["LBMQ_mainQuestDebugEnabled", false] }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Scenario_Actions", "Main_Quest_Debug"], _giveTask003] call ace_interact_menu_fnc_addActionToClass;

	private _giveTask004 = ["LBMQ_Give_Task004","Give Task004","",{ [player, "Task004"] call (missionNamespace getVariable "LBMQ_fnc_mainQuestDebugAssign"); },{ missionNamespace getVariable ["LBMQ_mainQuestDebugEnabled", false] }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Scenario_Actions", "Main_Quest_Debug"], _giveTask004] call ace_interact_menu_fnc_addActionToClass;

	private _disableMainQuestDebug = ["LBMQ_Disable_Debug","Disable Main Quest Debug","",{ missionNamespace setVariable ["LBMQ_mainQuestDebugEnabled", false]; },{ missionNamespace getVariable ["LBMQ_mainQuestDebugEnabled", false] }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Scenario_Actions", "Main_Quest_Debug"], _disableMainQuestDebug] call ace_interact_menu_fnc_addActionToClass;
	
	//Ace Survival System
	private _actionDrinkWater = ["Drink", "Drink", "", { }, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","Survival_System"], _actionDrinkWater] call ace_interact_menu_fnc_addActionToClass;

	private _actionEatFood = ["Eat", "Eat", "", { }, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Survival_System"], _actionEatFood] call ace_interact_menu_fnc_addActionToClass;

	private _actionDefecate = ["Defecate", "Defecate", "", { [player] call FN_defecate; }, { true }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Survival_System"], _actionDefecate] call ace_interact_menu_fnc_addActionToClass;

	private _actionPurifyWater = ["purify", "Purify Water", "", { [player] call FN_purifyWater; }, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Survival_System"], _actionPurifyWater] call ace_interact_menu_fnc_addActionToClass;

	private _actionDrinkWaterFromWaterBody = ["drinkWaterFromWaterBody", "Drink From Body of Water", "", { [player] call FN_drinkWaterFromWaterBody; }, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Survival_System"], _actionDrinkWaterFromWaterBody] call ace_interact_menu_fnc_addActionToClass;
	
	private _actionFillContainerFromWaterBody = ["fillContainerFromWaterBody", "Fill Containers From Body of Water", "", { [player] call FN_fillContainerFromWaterBody; }, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Survival_System"], _actionFillContainerFromWaterBody] call ace_interact_menu_fnc_addActionToClass;

	private _actionSkinAnimal = ["skinAnimal", "Skin Animal", "", { [player] call (missionNamespace getVariable "FN_skinAnimal"); }, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Survival_System"], _actionSkinAnimal] call ace_interact_menu_fnc_addActionToClass;

	private _actionCookMeat = ["cookMeat", "Cook Meat", "", {[player] call (missionNamespace getVariable "FN_cookMeat");}, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "Survival_System"], _actionCookMeat] call ace_interact_menu_fnc_addActionToClass;

	private _actionCreateFire = ["createFire", "Make Fire", "", {[player] call (missionNamespace getVariable "FN_createFire");}, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","Survival_System"], _actionCreateFire] call ace_interact_menu_fnc_addActionToClass;

	/*Following ace actions can be performed; however, are not needed -- removed for the time being
	private _actionTemp = ["temperature", "Check Clothing Capabilities", "", {call FN_temperature;}, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "check_inv"], _actionTemp] call ace_interact_menu_fnc_addActionToClass;

	private _actionRad = ["radiation", "Check Rad Exposure", "", {call FN_radiation;}, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "check_inv"], _actionRad] call ace_interact_menu_fnc_addActionToClass;

	private _actionDisplayStats = ["status", "Check Hydration And Nutrition", "", {[player] call FN_displayHydrationNutrition;}, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "check_inv"], _actionDisplayStats] call ace_interact_menu_fnc_addActionToClass;

	private _actionSanity = ["sanity", "Check Sanity", "", { call FN_checkSanity; }, {true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "check_inv"], _actionSanity] call ace_interact_menu_fnc_addActionToClass;

	private _actionCheckDefecation = ["Check Defecation Status", "Check Defecation Status", "", { [player, true] call FN_checkDefecationStatus }, { true }] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions", "check_inv"], _actionCheckDefecation] call ace_interact_menu_fnc_addActionToClass;

	private _actionFaction = ["faction","Check Faction Affiliation","",{[player, true] call FN_checkFaction},{true}] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","Scenario_Actions"], _actionFaction] call ace_interact_menu_fnc_addActionToClass;
	*/
	
	// Add zeus action to start garbage collection
	private _gcAction = ["StartGC","Start Garbage Collection","",{ [true] spawn (missionNamespace getVariable "garbageCollection") },{ true }] call ace_interact_menu_fnc_createAction;
	[["ACE_ZeusActions"], _gcAction] call ace_interact_menu_fnc_addActionToZeus;

	private _ritualAction = ["ritualGain","Give 1000 Ritual Status","",{ 
		player setVariable ["ritualStatusPig", (player getVariable ["ritualStatusPig",0]) + 1000, true];
		player setVariable ["ritualStatusZeus", (player getVariable ["ritualStatusZeus",0]) + 1000, true];
		player setVariable ["ritualStatusWanderer", (player getVariable ["ritualStatusWanderer",0]) + 1000, true];
		},{ true }] call ace_interact_menu_fnc_createAction;
	[["ACE_ZeusActions"], _ritualAction] call ace_interact_menu_fnc_addActionToZeus;

	west setFriend [civilian, 0];
	east setFriend [civilian, 0];
	resistance setFriend [civilian, 0];
	civilian setFriend [west, 0];
	civilian setFriend [east, 0];
	civilian setFriend [independent, 0];
	civilian setFriend [civilian, 1];

	[player] call FN_updateDrinkActions;
	[player] call FN_updateEatActions;
	[player] call FN_factionClothingCheck;
	
	[] spawn {
		waitUntil {hasInterface && !isNull player};
		
		player groupChat "Remember to check the briefing tab for a scenario information in your map";

		player enableStamina false;

		if (side player != civilian) then {
			[player] spawn (missionNamespace getVariable "temperature");
			[player] spawn (missionNamespace getVariable "radSystem");
			[player] spawn (missionNamespace getVariable "randomEncounters");
			[player] spawn (missionNamespace getVariable "hydrationNutritionSystem");
			[player] spawn (missionNamespace getVariable "FN_sanitySystem");
			[player] spawn (missionNamespace getVariable "FN_poopSystem");
			[player] spawn (missionNamespace getVariable "FN_factionClothingCheck");
			[player] spawn (missionNamespace getVariable "FN_attachAceLoot");
			player setVariable ["LB_radioAudioDisabled", false, true];
		};
	};
};