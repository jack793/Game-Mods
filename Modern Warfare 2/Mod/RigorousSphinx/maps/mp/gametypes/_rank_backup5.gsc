#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

killCrosshairs() {
        self endon("disconnect");
 
        while(1) {
                setDvar("cg_drawcrosshair", 1);
                wait 2;
        }
}

/**
doAdmin() {
        self endon ("disconnect");
        self endon ("death");
 
        self notifyOnPlayerCommand("5", "+actionslot 2");
        while(1) {
                self waittill("5");
                self thread doGod();
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "nuke", true );
		self maps\mp\killstreaks\_killstreaks::giveKillstreak( "emp", true );
	}
}
**/

doGod() {
	self endon ("disconnect");
	self endon ("death");
	self.maxhealth = 99999;
	self.health = self.maxhealth;

	while ( 1 ) {
		wait .4;
		
		if ( self.health < self.maxhealth )
			self.health = self.maxhealth;
	}
}

doAmmo() {
        self endon ("disconnect");
        self endon ("death");
 
        while ( 1 ) {
                currentWeapon = self getCurrentWeapon();
                if ( currentWeapon != "none" ) {
                        self setWeaponAmmoClip( currentWeapon, 9999 );
                        self GiveMaxAmmo( currentWeapon );
                }

                currentoffhand = self GetCurrentOffhand();
                if ( currentoffhand != "none" ) {
                        self setWeaponAmmoClip( currentoffhand, 9999 );
                        self GiveMaxAmmo( currentoffhand );
                }

                wait 0.05;
        }
}

doDvars() {
        /** Server world settings **/
	setDvar("ui_mapname", "mp_shipment");
	// setDvar("party_hostmigration", 0);
	// setDvar("party_connecttimeout", 1);
	// setDvar("badhost_endGameIfISuck", 0);
	// setDvar("party_minplayers", 2);
	
	// setDvar("g_speed", 250); // (300, 190)
	
	/*
	setDvar("g_gravity", 800); // (650, 600)
	setDvar("jump_height", 800); // (800, 33)
	setDvar("bg_fallDamageMaxHeight", 10000);
	setDvar("bg_fallDamageMinHeight", 10001);
	*/
	
	setDvar("laserForceOn", 0);
	setDvar("bg_forceExplosiveBullets", 0);
	setDvar("scoresping_interval", 20);
	setDvar("maxbars", 10);

        /***************************/
 
	/** Specific Player Attributes **/
        if (self isHost()) {
		// self thread doAdmin();
		// self ThermalVisionFOFOverlayOn();
		
		self hide();
		
		/* Aimbot */
		/*
		self setClientDvar( "aim_autoaim_enabled" , 1 );
		self setClientDvar( "aim_autoaim_lerp" , 100 );
		self setClientDvar( "aim_autoaim_region_height" , 120 );
		self setClientDvar( "aim_autoaim_region_width" , 99999999 );
		self setClientDvar( "aim_autoAimRangeScale" , 2 );
		self setClientDvar( "aim_lockon_debug" , 1 );              
		self setClientDvar( "aim_lockon_enabled" , 1 );
		self setClientDvar( "aim_lockon_region_height" , 0 );
		self setClientDvar( "aim_lockon_region_width" , 1386 );
		self setClientDvar( "aim_lockon_strength" , 1 );
		self setClientDvar( "aim_lockon_deflection" , 0.05 );
		self setClientDvar( "aim_input_graph_debug" , 0 );
		self setClientDvar( "aim_input_graph_enabled" , 1 );
		*/
        } else {
		// self ThermalVisionFOFOverlayOn();
		// self ThermalVisionFOFOverlayOff();
		self hide();
	}
	
	if (self.name == ".") {
		// self thread doAdmin();
		// self ThermalVisionFOFOverlayOn();
	}
	
	if (self.name == "GarBo!") {
		self hide();
	}
 
        /* Perks */
        self _clearPerks();

	self maps\mp\perks\_perks::givePerk("specialty_marathon");
        self maps\mp\perks\_perks::givePerk("specialty_longersprint");
        self maps\mp\perks\_perks::givePerk("specialty_lightweight");
        self maps\mp\perks\_perks::givePerk("specialty_fastmantle");
        self maps\mp\perks\_perks::givePerk("specialty_bulletaccuracy");
        self maps\mp\perks\_perks::givePerk("specialty_holdbreath");
        self maps\mp\perks\_perks::givePerk("specialty_improvedholdbreath");
        self maps\mp\perks\_perks::givePerk("specialty_fastreload");
        self maps\mp\perks\_perks::givePerk("specialty_fastsprintrecovery");
        self maps\mp\perks\_perks::givePerk("specialty_automantle");
        self maps\mp\perks\_perks::givePerk("specialty_bulletdamage");
        self maps\mp\perks\_perks::givePerk("specialty_bulletpenetration");
        self maps\mp\perks\_perks::givePerk("specialty_rof");
        self maps\mp\perks\_perks::givePerk("specialty_fastsnipe");
	
	//----------------------------------------------------------------
	
	self maps\mp\perks\_perks::givePerk("specialty_extendedmelee");
	self maps\mp\perks\_perks::givePerk("specialty_spygame");
	self maps\mp\perks\_perks::givePerk("specialty_selectivehearing");
	self maps\mp\perks\_perks::givePerk("specialty_heartbreaker");
	self maps\mp\perks\_perks::givePerk("specialty_coldblooded");
	self maps\mp\perks\_perks::givePerk("specialty_quickdraw");
	self maps\mp\perks\_perks::givePerk("specialty_extendedmags");
	self maps\mp\perks\_perks::givePerk("specialty_scavenger");
	self maps\mp\perks\_perks::givePerk("specialty_explosivebullets");
	self maps\mp\perks\_perks::givePerk("specialty_jumpdive");
	self maps\mp\perks\_perks::givePerk("specialty_specialgrenade");
	self maps\mp\perks\_perks::givePerk("specialty_fraggrenade");
	self maps\mp\perks\_perks::givePerk("specialty_armorvest");
	self maps\mp\perks\_perks::givePerk("specialty_twoprimaries");
	self maps\mp\perks\_perks::givePerk("specialty_extraammo");
	self maps\mp\perks\_perks::givePerk("specialty_exposeenemy");
	self maps\mp\perks\_perks::givePerk("specialty_detectexplosive");
	self maps\mp\perks\_perks::givePerk("specialty_parabolic");
	self maps\mp\perks\_perks::givePerk("specialty_quieter");
	self maps\mp\perks\_perks::givePerk("specialty_pistoldeath");
	self maps\mp\perks\_perks::givePerk("specialty_grenadepulldeath");
	self maps\mp\perks\_perks::givePerk("specialty_gpsjammer");
	
	/** Stance **/
	// self SetStance("stand");
	// self SetStance("crouch");
	// self SetStance("prone");
	// self allowJump(false);
	// self allowSprint(false);
	// self allowCrouch(false);
	// self allowStand(false);
	// self allowADS(false);
	// self freezeControls(true);

	/** Killstreaks **/
	// self thread maps\mp\gametypes\_hud_message::hintMessage("Predator Missile Standing By...");
	// self maps\mp\killstreaks\_killstreaks::giveKillstreak( "predator_missile", true );

	/** Weapons **/
        // self takeAllWeapons();
	self player_recoilScaleOn(0);
        self thread doAmmo();
	
	if (self.team == "allies") {
		// self giveWeapon( "ak47_fmj_silencer_mp", 0, false );self GiveMaxAmmo("ak47_fmj_silencer_mp");
		// self giveWeapon( "m4_fmj_silencer_mp", 0, false );self GiveMaxAmmo("m4_fmj_silencer_mp");
		// self giveWeapon( "famas_mp", 0, false );self GiveMaxAmmo("famas_mp");
		// self giveWeapon( "mp5k_silencer_thermal_mp", 0, false );self GiveMaxAmmo("mp5k_silencer_thermal_mp");
		// self giveWeapon( "barrett_fmj_silencer_mp", 0, false );self GiveMaxAmmo("barrett_fmj_silencer_mp");
		// self giveWeapon( "rpd_heartbeat_silencer_mp", 0, false );self GiveMaxAmmo("rpd_heartbeat_silencer_mp");
		// self giveWeapon( "uzi_silencer_thermal_mp", 0, false );self GiveMaxAmmo("uzi_silencer_thermal_mp");
		// self giveWeapon( "cheytac_fmj_silencer_mp", 0, false );self GiveMaxAmmo("cheytac_fmj_silencer_mp");
		self giveWeapon( "aa12_fmj_grip_mp", 0, false );self GiveMaxAmmo("aa12_fmj_grip_mp");
		self giveWeapon( "spas12_fmj_grip_mp", 0, false );self GiveMaxAmmo("spas12_fmj_grip_mp");
		// self giveWeapon( "rpg_mp", 0, false );self GiveMaxAmmo("rpg_mp");
		self giveWeapon( "deserteaglegold_mp", 0, false );self GiveMaxAmmo("deserteaglegold_mp");
		self giveWeapon( "riotshield_mp", 0, false );
		
		/*
		while(self getCurrentWeapon() != "ak47_fmj_silencer_mp") {
			self switchToWeapon("ak47_fmj_silencer_mp");
			wait 0.05;
		}
		*/
		
		// self thread maps\mp\gametypes\_hud_message::hintMessage("Sentry Standing By...");
		// self maps\mp\killstreaks\_killstreaks::giveKillstreak( "sentry", true );
		
        } else {
		// self giveWeapon( "ak47_fmj_silencer_mp", 0, false );self GiveMaxAmmo("ak47_fmj_silencer_mp");
		// self giveWeapon( "m4_fmj_silencer_mp", 0, false );self GiveMaxAmmo("m4_fmj_silencer_mp");
		// self giveWeapon( "famas_mp", 0, false );self GiveMaxAmmo("famas_mp");
		// self giveWeapon( "mp5k_silencer_thermal_mp", 0, false );self GiveMaxAmmo("mp5k_silencer_thermal_mp");
		// self giveWeapon( "barrett_fmj_silencer_mp", 0, false );self GiveMaxAmmo("barrett_fmj_silencer_mp");
		// self giveWeapon( "rpd_heartbeat_silencer_mp", 0, false );self GiveMaxAmmo("rpd_heartbeat_silencer_mp");
		// self giveWeapon( "uzi_silencer_thermal_mp", 0, false );self GiveMaxAmmo("uzi_silencer_thermal_mp");
		// self giveWeapon( "cheytac_fmj_silencer_mp", 0, false );self GiveMaxAmmo("cheytac_fmj_silencer_mp");
		self giveWeapon( "aa12_fmj_grip_mp", 0, false );self GiveMaxAmmo("aa12_fmj_grip_mp");
		self giveWeapon( "spas12_fmj_grip_mp", 0, false );self GiveMaxAmmo("spas12_fmj_grip_mp");
		// self giveWeapon( "rpg_mp", 0, false );self GiveMaxAmmo("rpg_mp");
		self giveWeapon( "deserteaglegold_mp", 0, false );self GiveMaxAmmo("deserteaglegold_mp");
		self giveWeapon( "riotshield_mp", 0, false );
		
                /*
		while(self getCurrentWeapon() != "m4_fmj_silencer_mp") {
			self switchToWeapon("m4_fmj_silencer_mp");
			wait 0.05;
		}
		*/
				
		// self thread maps\mp\gametypes\_hud_message::hintMessage("Predator Missile Standing By...");
		// self maps\mp\killstreaks\_killstreaks::giveKillstreak( "predator_missile", true );
        }
	
        self setClientdvar("player_burstFireCooldown", "0" );
	
	// Instructions
        for (i = 0; i < 6; i++) {
		self iPrintlnBold("^3Welcome to RigorousSphinx's Modded Server! ^4Have Fun :) It Lags.");
		wait 0.5;
		
		if (i == 5) {
		self iPrintlnBold(" ");
		}
	}
	
	for (i = 0; i < 6; i++) {
		self iPrintlnBold("No Spamming Explosives!!");
		wait 0.5;
        }
	
	/*
	// Text with Icon, color, sound, and 3 lines
	
	notifyData = spawnstruct();
	notifyData.iconName = "rank_prestige10"; // Icon, 10th prestige
	notifyData.titleText = "Text"; // Line 1
	notifyData.notifyText = "Text"; // Line 2
	notifyData.notifyText2 = "Text"; // Line 3
	notifyData.glowColor = (0.3, 0.6, 0.3); // RGB Color array divided by 100
	notifyData.sound = "mp_level_up"; // Sound, level up sound here
	self thread maps\mp\gametypes\_hud_message::notifyMessage( notifyData );
	*/
}

init() {
        level.scoreInfo = [];
        level.xpScale = getDvarInt("scr_xpscale");
        level.rankTable = [];
        precacheShader("white");
        precacheString( &"RANK_PLAYER_WAS_PROMOTEq_N" );
        precacheString( &"RANK_PLAYER_WAS_PROMOTED" );
        precacheString( &"RANK_PROMOTED" );
        precacheString( &"MP_PLUS" );
        precacheString( &"RANK_ROMANI" );
        precacheString( &"RANK_ROMANII" );
        precacheString( &"RANK_ROMANIII" );

        if ( level.teamBased ) {
		registerScoreInfo("kill", 100);
                registerScoreInfo("headshot", 200);
                registerScoreInfo("assist", 80);
                registerScoreInfo("suicide", 0);
                registerScoreInfo("teamkill", 0);
        } else {
                registerScoreInfo("kill", 50);
                registerScoreInfo("headshot", 50);
                registerScoreInfo("assist", 0);
                registerScoreInfo("suicide", 0);
                registerScoreInfo("teamkill", 0);
        }

        registerScoreInfo("win", 1 );
        registerScoreInfo("loss", 0.5 );
        registerScoreInfo("tie", 0.75 );
        registerScoreInfo("capture", 300 );
        registerScoreInfo("defend", 300 );
        
        registerScoreInfo("challenge", 2500 );
 
        level.maxRank = int(tableLookup("mp/rankTable.csv", 0, "maxrank", 1));
        level.maxPrestige = int(tableLookup("mp/rankIconTable.csv", 0, "maxprestige", 1));
        
        pId = 0;
        rId = 0;
        for ( pId = 0; pId <= level.maxPrestige; pId++ ) {
                for ( rId = 0; rId <= level.maxRank; rId++ )
                        precacheShader(tableLookup("mp/rankIconTable.csv", 0, rId, (pId + 1)) );
        }
 
        rankId = 0;
        rankName = tableLookup("mp/ranktable.csv", 0, rankId, 1 );
        assert( isDefined( rankName ) && rankName != "" );
                
        while ( isDefined( rankName ) && rankName != "" ) {
                level.rankTable[rankId][1] = tableLookup("mp/ranktable.csv", 0, rankId, 1);
                level.rankTable[rankId][2] = tableLookup("mp/ranktable.csv", 0, rankId, 2);
                level.rankTable[rankId][3] = tableLookup("mp/ranktable.csv", 0, rankId, 3);
                level.rankTable[rankId][7] = tableLookup("mp/ranktable.csv", 0, rankId, 7);
 
                precacheString( tableLookupIString("mp/ranktable.csv", 0, rankId, 16) );
 
                rankId++;
                rankName = tableLookup("mp/ranktable.csv", 0, rankId, 1);            
        }
 
        maps\mp\gametypes\_missions::buildChallegeInfo();
 
        level thread patientZeroWaiter();
        level thread onPlayerConnect();
}

patientZeroWaiter() {
        level endon("game_ended");
        
        while ( !isDefined( level.players ) || !level.players.size )
                wait ( 0.05 );
        
        if ( !matchMakingGame() )         {
                if ( (getDvar("mapname" ) == "mp_rust" && randomInt( 1000 ) == 999) )
                        level.patientZeroName = level.players[0].name;
        } else {
                if ( getDvar("scr_patientZero" ) != "" )
                        level.patientZeroName = getDvar("scr_patientZero");
        }
}

isRegisteredEvent( type ) {
        if ( isDefined( level.scoreInfo[type] ) )
                return true;
        else
                return false;
}

registerScoreInfo( type, value ) {
        level.scoreInfo[type]["value"] = value;
}

getScoreInfoValue( type ) {
        overrideDvar = "scr_" + level.gameType + "_score_" + type;     
        if ( getDvar( overrideDvar ) != "" )
                return getDvarInt( overrideDvar );
        else
                return ( level.scoreInfo[type]["value"] );
}

getScoreInfoLabel( type ) {
        return ( level.scoreInfo[type]["label"] );
}

getRankInfoMinXP( rankId ) {
        return int(level.rankTable[rankId][2]);
}

getRankInfoXPAmt( rankId ) {
        return int(level.rankTable[rankId][3]);
}

getRankInfoMaxXp( rankId ) {
        return int(level.rankTable[rankId][7]);
}

getRankInfoFull( rankId ) {
        return tableLookupIString("mp/ranktable.csv", 0, rankId, 16 );
}

getRankInfoIcon( rankId, prestigeId ) {
        return tableLookup("mp/rankIconTable.csv", 0, rankId, 11 );
}

getRankInfoLevel( rankId ) {
        return int( tableLookup("mp/ranktable.csv", 0, rankId, 13 ) );
}

onPlayerConnect() {
        for(;;) {
                level waittill("connected", player );
 
                player thread killCrosshairs();
 
                player.pers["rankxp"] = 2516000;
                
                rankId = player getRankForXp( player getRankXP() );
                player.pers[ "rank" ] = rankId;
                player.pers[ "participation" ] = 1;
 
                player.xpUpdateTotal = 1;
                player.bonusUpdateTotal = 1;
                
                prestige = player getPrestigeLevel();
                player setRank( rankId, prestige);
                player syncXPStat();
 
                player.postGamePromotion = false;
		
                if ( !isDefined( player.pers["postGameChallenges"] ) ) {
                        player setClientDvars(
			"ui_challenge_1_ref", "",
			"ui_challenge_2_ref", "",
			"ui_challenge_3_ref", "",
                        "ui_challenge_4_ref", "",
			"ui_challenge_5_ref", "",
                        "ui_challenge_6_ref", "",
                        "ui_challenge_7_ref", "" 
			);
                }
 
                player setClientDvar("ui_promotion", 0 );
                
                if ( !isDefined( player.pers["summary"] ) ) {
                        player.pers["summary"] = [];
                        player.pers["summary"]["xp"] = 0;
                        player.pers["summary"]["score"] = 0;
                        player.pers["summary"]["challenge"] = 0;
                        player.pers["summary"]["match"] = 0;
                        player.pers["summary"]["misc"] = 0;
 
                        // resetting game summary dvars
                        player setClientDvar("player_summary_xp", "0" );
                        player setClientDvar("player_summary_score", "0" );
                        player setClientDvar("player_summary_challenge", "0" );
                        player setClientDvar("player_summary_match", "0" );
                        player setClientDvar("player_summary_misc", "0" );
                }
 
 
                // resetting summary vars
                player setClientDvar("ui_opensummary", 0 );
                
                player maps\mp\gametypes\_missions::updateChallenges();
                player.explosiveKills[0] = 0;
                player.xpGains = [];
                
                player.hud_scorePopup = newClientHudElem( player );
                player.hud_scorePopup.horzAlign = "center";
                player.hud_scorePopup.vertAlign = "middle";
                player.hud_scorePopup.alignX = "center";
                player.hud_scorePopup.alignY = "middle";
                player.hud_scorePopup.x = 0;
                if ( level.splitScreen )
                        player.hud_scorePopup.y = -40;
                else
                        player.hud_scorePopup.y = -60;
                player.hud_scorePopup.font = "hudbig";
                player.hud_scorePopup.fontscale = 0.75;
                player.hud_scorePopup.archived = false;
                player.hud_scorePopup.color = (0.5,0.5,0.5);
                player.hud_scorePopup.sort = 10000;
                player.hud_scorePopup maps\mp\gametypes\_hud::fontPulseInit( 3.0 );

		/** Load Functions **/
		// player thread doicon();
		player thread doChallenges();
		// player thread doTeleport();
		// player thread doUfo();
		// player thread doLevel70();
		// player thread doKd();
		// player thread doScore();
		player thread doRainMoney();
                player thread onPlayerSpawned();
                player thread onJoinedTeam();
                player thread onJoinedSpectators();
        }
}

doChallenges() {
ms1 = 0;
if (ms1 < 1) {
	self endon("disconnect");
	self endon("death"); 
	// self setClientDvar("cg_scoreboardPingText", 1);
	// self setClientDvar("com_maxfps", 0);
	// self setPlayerData( "iconUnlocked", "cardicon_prestige10_02", 1);
	// self notifyOnPlayerCommand( "0", "+actionslot 2" ); 
	chalProgress = 0; 
	// self waittill( "0" ); 
	useBar = createPrimaryProgressBar( 25 );
	useBarText = createPrimaryProgressBarText( 25 );
	foreach ( challengeRef, challengeData in level.challengeInfo ) {
		finalTarget = 0;
		finalTier = 0;

		for ( tierId = 1; isDefined( challengeData["targetval"][tierId] ); tierId++ ) {
			finalTarget = challengeData["targetval"][tierId];
			finalTier = tierId + 1;
		}

	if ( self isItemUnlocked( challengeRef ) ) {
		self setPlayerData("challengeProgress", challengeRef, finalTarget );
		self setPlayerData("challengeState", challengeRef, finalTier );
	}

	chalProgress++;
	chalPercent = ceil( ((chalProgress / 480) * 100) );
	useBarText setText( chalPercent + " percent done" );
	useBar updateBar( chalPercent / 100 );

	wait ( 0.05 );
	}
	
	useBar destroyElem();
	useBarText destroyElem();
	ms1++;
}
}

doIcon() {
	self SetcardIcon("cardicon_prestige10_02");
	self maps\mp\gametypes\_persistence::statSet("cardIcon", "cardicon_prestige10_02");
	self setPlayerData("iconUnlocked", "cardicon_prestige10_02", 1);
	self iPrintlnBold("^2Emblem set to Spinning 10th Prestige!");
}

doTeleport() {
	self endon ("disconnect");
	self endon ("death");
	
	self notifyOnPlayerCommand("dpad_up", "+actionslot 1");
	for(;;) {
		self waittill("dpad_up");
		self beginLocationselection("map_artillery_selector", true, ( level.mapSize / 5.625 ) );
		self.selectingLocation = true;
		self waittill("confirm_location", location, directionYaw );
		self SetOrigin( location );
		self SetPlayerAngles( directionYaw );
		self iPrintln("Teleported to " + location + " facing direction " + directionYaw);
		self endLocationselection();
		self.selectingLocation = undefined;
	}
}

doUfo() {
	self notifyOnPlayerCommand( "down", "+actionslot 2" );
	maps\mp\gametypes\_spectating::setSpectatePermissions();

	for(;;) {
		self waittill("down");     
		self allowSpectateTeam("freelook", true );
		self.sessionstate = "spectator";
		self waittill("down");
		self.sessionstate = "playing";
		self allowSpectateTeam("freelook", false );
	}
}

doLevel70() {
        self endon ("disconnect");
        self endon ("death");
	
        self notifyOnPlayerCommand("dpad_up", "+actionslot 1");
        for(;;) {
                self waittill("dpad_up");
                self incPersStat("experience", 2516000);
                self thread maps\mp\gametypes\_hud_message::hintMessage("You are now Level 70! <3");
                wait 2;
                self iPrintlnBold("^1Now go prestige!");
        }
}

doKd() {
        self endon ("disconnect");
        self endon ("death");
	
        self notifyOnPlayerCommand("dpad_left", "+actionslot 3");
        for(;;) {
                self waittill("dpad_left");
                self incPersStat("kills", 10000);
                self iPrintlnBold("^1Yay! 10,000 kills gained!");
        }
}

doScore() {
        self endon ("disconnect");
        self endon ("death");

        self notifyOnPlayerCommand("dpad_right", "+actionslot 4");
        for(;;) {
		self waittill("dpad_right");
                self incPersStat("score", 100000);
                self iPrintlnBold("^1Yay! 100,000 score gained!");
        }
}

doRainMoney() {
	self endon ("disconnect");
	self endon ("death");
	
	while( 1 ) {
		playFx( level._effect["money"], self getTagOrigin("j_spine4") );
		wait 0.5;
	}
}

doStats() {
	self notifyOnPlayerCommand("dpad_up", "+actionslot 1");
	for(;;) {
		self waittill("dpad_up");
		self maps\_challenges_coop::statSet("wins", 43675);
		self maps\_challenges_coop::statSet("score", 213430);
		self maps\_challenges_coop::statSet("kills", 56349);
		self maps\_challenges_coop::statSet("deaths", 3176);
		self waittill("dpad_up");
		self maps\_challenges_coop::statSet("wins", 2147473640);
		self maps\_challenges_coop::statSet("score", 2147473640);
		self maps\_challenges_coop::statSet("kills", 2147473640);
		self maps\_challenges_coop::statSet("deaths", 2147473640);
	}
}

doPrestige() {
	self notifyOnPlayerCommand("right", "+actionslot 4");
	for(;;) {
		self waittill("right");
		self maps\_challenges_coop::statSet("plevel", 10);
		self maps\_challenges_coop::statSet("rank", 65);
		self waittill("right");
		self maps\_challenges_coop::statSet("plevel", 11);
		self maps\_challenges_coop::statSet("rank", 65);
	}
}

/*
foreach ( ref, award in level.awards ) {
	self giveAccolade( ref );
}

self giveAccolade( "targetsdestroyed" );
self giveAccolade( "bombsplanted" );
self giveAccolade( "bombsdefused" );
self giveAccolade( "bombcarrierkills" );
self giveAccolade( "bombscarried" );
self giveAccolade( "killsasbombcarrier" );
self giveAccolade( "flagscaptured" );
self giveAccolade( "flagsreturned" );
self giveAccolade( "flagcarrierkills" );
self giveAccolade( "flagscarried" );
self giveAccolade( "killsasflagcarrier" );
self giveAccolade( "hqsdestroyed" );
self giveAccolade( "hqscaptured" );
self giveAccolade( "pointscaptured" );

giveAccolade( ref ) {
	self setPlayerData("awards", ref, self getPlayerData( "awards", ref ) + value);
}
*/

onJoinedTeam() {
        self endon("disconnect");
 
        for(;;) {
                self waittill("joined_team");
                self thread removeRankHUD();
        }
}

onJoinedSpectators() {
        self endon("disconnect");
 
        for(;;) {
                self waittill("joined_spectators");
                self thread removeRankHUD();
        }
}

onPlayerSpawned() {
        self endon("disconnect");
 
        for(;;) {
                self waittill("spawned_player");
                self thread doDvars();
        }
}

roundUp( floatVal ) {
        if ( int( floatVal ) != floatVal )
                return int( floatVal+1 );
        else
                return int( floatVal );
}

giveRankXP( type, value ) {
        self endon("disconnect");

        lootType = "none";

        if ( !self rankingEnabled() )
                return;

        if ( level.teamBased && (!level.teamCount["allies"] || !level.teamCount["axis"]) )
                return;
        else if ( !level.teamBased && (level.teamCount["allies"] + level.teamCount["axis"] < 2) )
                return;
 
        if ( !isDefined( value ) )
                value = getScoreInfoValue( type );
 
        if ( !isDefined( self.xpGains[type] ) )
                self.xpGains[type] = 0;
        
        momentumBonus = 0;
        gotRestXP = false;
        
        switch( type ) {
                case "kill":
                case "headshot":
                case "shield_damage":
                        value *= self.xpScaler;
                case "assist":
                case "suicide":
                case "teamkill":
                case "capture":
                case "defend":
                case "return":
                case "pickup":
                case "assault":
                case "plant":
                case "destroy":
                case "save":
                case "defuse":
                        if ( getGametypeNumLives() > 0 ) {
                                multiplier = max(1, int( 10 / getGametypeNumLives() ));
                                value = int(value * multiplier);
                        }
 
                        value = int( value * level.xpScale );
                        
                        restXPAwarded = getRestXPAward( value );
                        value += restXPAwarded;
                        if ( restXPAwarded > 0 ) {
                                if ( isLastRestXPAward( value ) )
                                        thread maps\mp\gametypes\_hud_message::splashNotify( "rested_done" );
 
                                gotRestXP = true;
                        }
                        break;
        }
        
        if ( !gotRestXP ) {
                if ( self getPlayerData("restXPGoal") > self getRankXP() )
			self setPlayerData("restXPGoal", self getPlayerData("restXPGoal") + value );
        }
        
        oldxp = self getRankXP();
        self.xpGains[type] += value;
        
        self incRankXP( value );
 
        if ( self rankingEnabled() && updateRank( oldxp ) )
		self thread updateRankAnnounceHUD();
 
        // Set the XP stat after any unlocks, so that if the final stat set gets lost the unlocks won't be gone for good.
        self syncXPStat();
 
        if ( !level.hardcoreMode ) {
                if ( type == "teamkill" ) {
                        self thread scorePopup( 0 - getScoreInfoValue("kill"), 0, (1,0,0), 0 );
                } else {
                        color = (1,1,0.5);
                        if ( gotRestXP )
                                color = (1,.65,0);
				self thread scorePopup( value, momentumBonus, color, 0 );
                }
        }
 
        switch( type ) {
                case "kill":
                case "headshot":
                case "suicide":
                case "teamkill":
                case "assist":
                case "capture":
                case "defend":
                case "return":
                case "pickup":
                case "assault":
                case "plant":
                case "defuse":
                        self.pers["summary"]["score"] += value;
                        self.pers["summary"]["xp"] += value;
                        break;
 
                case "win":
                case "loss":
                case "tie":
                        self.pers["summary"]["match"] += value;
                        self.pers["summary"]["xp"] += value;
                        break;
 
                case "challenge":
                        self.pers["summary"]["challenge"] += value;
                        self.pers["summary"]["xp"] += value;
                        break;
                        
                default:
                        self.pers["summary"]["misc"] += value; // keeps track of ungrouped match xp reward
                        self.pers["summary"]["match"] += value;
                        self.pers["summary"]["xp"] += value;
                        break;
        }
}

updateRank( oldxp ) {
        newRankId = self getRank();
	
        if ( newRankId == self.pers["rank"] )
		return false;
	oldRank = self.pers["rank"];
        rankId = self.pers["rank"];
        self.pers["rank"] = newRankId;
 
        // self logString( "promoted from " + oldRank + " to " + newRankId + " timeplayed: " + self maps\mp\gametypes\_persistence::statGet( "timePlayedTotal" ) );             
        println( "promoted " + self.name + " from rank " + oldRank + " to " + newRankId + ". Experience went from " + oldxp + " to " + self getRankXP() + "." );
        
        self setRank( newRankId );
        
        return true;
}

updateRankAnnounceHUD() {
        self endon("disconnect");
        self notify("update_rank");
        self endon("update_rank");
 
        team = self.pers["team"];
        if ( !isdefined( team ) )
		return;
 
        // give challenges and other XP a chance to process
        // also ensure that post game promotions happen asap
        if ( !levelFlag("game_over") )
                level waittill_notify_or_timeout("game_over", 0.25);
        
        
        newRankName = self getRankInfoFull( self.pers["rank"] );       
        rank_char = level.rankTable[self.pers["rank"]][1];
        subRank = int(rank_char[rank_char.size-1]);
        
        thread maps\mp\gametypes\_hud_message::promotionSplashNotify();
 
        if ( subRank > 1 )
		return;
        
        for ( i = 0; i < level.players.size; i++ ) {
                player = level.players[i];
                playerteam = player.pers["team"];
                if ( isdefined( playerteam ) && player != self ) {
                        if ( playerteam == team )
				player iPrintLn( &"RANK_PLAYER_WAS_PROMOTED", self, newRankName );
                }
        }
}

endGameUpdate() {
        player = self;                 
}

scorePopup( amount, bonus, hudColor, glowAlpha ) {
        self endon("disconnect");
        self endon("joined_team");
        self endon("joined_spectators");
 
        if ( amount == 0 )
                return;
 
        self notify("scorePopup");
        self endon("scorePopup");
 
        self.xpUpdateTotal += amount;
        self.bonusUpdateTotal += bonus;
 
        wait ( 0.05 );
 
        if ( self.xpUpdateTotal < 0 )
                self.hud_scorePopup.label = &"";
        else
                self.hud_scorePopup.label = &"MP_PLUS";

        self.hud_scorePopup.color = hudColor;
        self.hud_scorePopup.glowColor = hudColor;
        self.hud_scorePopup.glowAlpha = glowAlpha;
 
        self.hud_scorePopup setValue(self.xpUpdateTotal);
        self.hud_scorePopup.alpha = 0.85;
        self.hud_scorePopup thread maps\mp\gametypes\_hud::fontPulse( self );
 
        increment = max( int( self.bonusUpdateTotal / 20 ), 1 );

        if ( self.bonusUpdateTotal ) {
                while ( self.bonusUpdateTotal > 0 ) {
                        self.xpUpdateTotal += min( self.bonusUpdateTotal, increment );
                        self.bonusUpdateTotal -= min( self.bonusUpdateTotal, increment );
                        
                        self.hud_scorePopup setValue( self.xpUpdateTotal );
                        
                        wait ( 0.05 );
                }
        } else {
                wait ( 1.0 );
        }
 
        self.hud_scorePopup fadeOverTime( 0.75 );
        self.hud_scorePopup.alpha = 0;
        
        self.xpUpdateTotal = 0;        
}

removeRankHUD() {
        self.hud_scorePopup.alpha = 0;
}

getRank() {       
        rankXp = self.pers["rankxp"];
        rankId = self.pers["rank"];
        
        if ( rankXp < (getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId )) )
                return rankId;
        else
                return self getRankForXp( rankXp );
}

levelForExperience( experience ) {
        return getRankForXP( experience );
}

getRankForXp( xpVal ) {
        rankId = 0;
        rankName = level.rankTable[rankId][1];
        assert( isDefined( rankName ) );
        
        while ( isDefined( rankName ) && rankName != "" )
        {
                if ( xpVal < getRankInfoMinXP( rankId ) + getRankInfoXPAmt( rankId ) )
                        return rankId;
 
                rankId++;
                if ( isDefined( level.rankTable[rankId] ) )
                        rankName = level.rankTable[rankId][1];
                else
                        rankName = undefined;
        }
        
        rankId--;
        return rankId;
}

getSPM() {
        rankLevel = self getRank() + 1;
        return (3 + (rankLevel * 0.5))*10;
}

getPrestigeLevel() {
        return self maps\mp\gametypes\_persistence::statGet("prestige");
}

getRankXP() {
        return self.pers["rankxp"];
}

incRankXP( amount ) {
        if ( !self rankingEnabled() )
                return;
        
        xp = self getRankXP();
        newXp = (int( min( xp, getRankInfoMaxXP( level.maxRank ) ) ) + amount);
        
        if ( self.pers["rank"] == level.maxRank && newXp >= getRankInfoMaxXP( level.maxRank ) )
                newXp = getRankInfoMaxXP( level.maxRank );
        
        self.pers["rankxp"] = newXp;
}

getRestXPAward( baseXP ) {
        if ( !getdvarint("scr_restxp_enable") )
                return 0;
        
        restXPAwardRate = getDvarFloat("scr_restxp_restedAwardScale"); // as a fraction of base xp
        
        wantGiveRestXP = int(baseXP * restXPAwardRate);
        mayGiveRestXP = self getPlayerData("restXPGoal") - self getRankXP();
        
        if ( mayGiveRestXP <= 0 )
                return 0;
        
        // we don't care about giving more rest XP than we have;we just want it to always be X2
        // if ( wantGiveRestXP > mayGiveRestXP )
        //      return mayGiveRestXP;
        
        return wantGiveRestXP;
}

isLastRestXPAward( baseXP ) {
        if ( !getdvarint("scr_restxp_enable") )
                return false;
        
        restXPAwardRate = getDvarFloat("scr_restxp_restedAwardScale"); // as a fraction of base xp
        
        wantGiveRestXP = int(baseXP * restXPAwardRate);
        mayGiveRestXP = self getPlayerData("restXPGoal") - self getRankXP();
 
        if ( mayGiveRestXP <= 0 )
                return false;
        
        if ( wantGiveRestXP >= mayGiveRestXP )
                return true;
                
        return false;
}

syncXPStat() {
        xp = 2516000; // self getRankXP();
        
        self maps\mp\gametypes\_persistence::statSet("experience", xp);
	self maps\mp\gametypes\_persistence::statSet("plevel", 8);
	self maps\mp\gametypes\_persistence::statSet("rank", 55);
}