CREATE TABLE IF NOT EXISTS bot_langs (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

	name VARCHAR(30) NOT NULL UNIQUE,
	tag VARCHAR(10) NOT NULL UNIQUE,

	PRIMARY KEY (id),

	INDEX idx_tag_bot_langs(name)
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS command_modules (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

	name VARCHAR(30) NOT NULL UNIQUE,

	PRIMARY KEY (id),

	INDEX idx_name_command_modules(name)
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS bot_commands (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

	name VARCHAR(30) NOT NULL UNIQUE,
	alias VARCHAR(10) NOT NULL UNIQUE,
  arg VARCHAR(30) DEFAULT NULL,

	module_id BIGINT UNSIGNED NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (module_id) REFERENCES command_modules(id) ON UPDATE CASCADE ON DELETE RESTRICT,

	INDEX idx_name_bot_commands(name)	
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS command_args (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

	name VARCHAR(30) NOT NULL UNIQUE,
	casted_type VARCHAR(30) NOT NULL,
	is_required BOOL NOT NULL,

	PRIMARY KEY (id),

	INDEX idx_name_command_args(name)
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS commands_args_binding (
	command_id BIGINT UNSIGNED NOT NULL,
	arg_id BIGINT UNSIGNED NOT NULL,
	arg_pos INT UNSIGNED DEFAULT 1,

	FOREIGN KEY (command_id) REFERENCES bot_commands(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (arg_id) REFERENCES command_args(id) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS guilds (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

	discord_id VARCHAR(255) NOT NULL UNIQUE,
	legacy_prefix CHAR NOT NULL DEFAULT '$',
	music_text_channel_id VARCHAR(255) DEFAULT NULL,
	lang_id BIGINT UNSIGNED NOT NULL,
	dj_role_name VARCHAR(255) NOT NULL DEFAULT "DJWizard",
	slash_enabled BOOL NOT NULL DEFAULT TRUE,
	leave_empty_channel_sec INT UNSIGNED NOT NULL DEFAULT 120,
	leave_no_tracks_channel_sec INT UNSIGNED NOT NULL DEFAULT 120,
	voting_percentage_ratio INT UNSIGNED NOT NULL DEFAULT 50,
	time_to_finish_voting_sec INT UNSIGNED NOT NULL DEFAULT 120,
	random_auto_choose_track BOOL NOT NULL DEFAULT TRUE,
	tracks_to_choose_max INT UNSIGNED NOT NULL DEFAULT 10,
	time_after_auto_choose_sec INT UNSIGNED NOT NULL DEFAULT 30,
	max_repeats_of_track INT UNSIGNED NOT NULL DEFAULT 30,
	default_volume INT UNSIGNED NOT NULL DEFAULT 100,

	PRIMARY KEY (id),
	FOREIGN KEY (lang_id) REFERENCES bot_langs(id) ON UPDATE CASCADE ON DELETE CASCADE,

	INDEX idx_discord_id_guilds(discord_id)
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS guilds_commands_binding (
	guild_id BIGINT UNSIGNED NOT NULL,
	command_id BIGINT UNSIGNED NOT NULL,
	is_slash_enabled BOOL NOT NULL DEFAULT TRUE,

	FOREIGN KEY (guild_id) REFERENCES guilds(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (command_id) REFERENCES bot_commands(id) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS guilds_modules_binding (
	guild_id BIGINT UNSIGNED NOT NULL,
	module_id BIGINT UNSIGNED NOT NULL,

	FOREIGN KEY (guild_id) REFERENCES guilds(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (module_id) REFERENCES command_modules(id) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS command_arg_options (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

	option_key VARCHAR(50) NOT NULL,
	command_id BIGINT UNSIGNED NOT NULL,
	command_arg_id BIGINT UNSIGNED NOT NULL,

	PRIMARY KEY (id),
	FOREIGN KEY (command_id) REFERENCES bot_commands(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (command_arg_id) REFERENCES command_args(id) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS radio_stations (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

	radio_key VARCHAR(255) NOT NULL,
	stream_url VARCHAR(500) NOT NULL,
	proxy_stream_url VARCHAR(500) DEFAULT NULL,
	
	PRIMARY KEY (id),

	INDEX idx_slug_radio_stations(radio_key)
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS guilds_radio_stations_binding (
	guild_id BIGINT UNSIGNED NOT NULL,
	radio_station_id BIGINT UNSIGNED NOT NULL,

	FOREIGN KEY (guild_id) REFERENCES guilds(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (radio_station_id) REFERENCES radio_stations(id) ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS key_features (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

	name VARCHAR(50) NOT NULL,
	is_active BOOL NOT NULL DEFAULT TRUE,

	PRIMARY KEY (id)
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS global_configs (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	prop_key VARCHAR(255) NOT NULL UNIQUE,
	prop_value VARCHAR(255) NOT NULL,
	type VARCHAR(20) NOT NULL,

	PRIMARY KEY (id)
)
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS jda_permission_flags (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	flag_name VARCHAR(255) NOT NULL UNIQUE,
	is_active BOOL NOT NULL DEFAULT TRUE,

	PRIMARY KEY (id)
)
ENGINE=InnoDB;


---


INSERT INTO bot_langs(id,name,tag) VALUES
(1, "Polski", "pl"),
(2, "English", "en");


INSERT INTO command_modules (id,name) VALUES
(1, "music"),
(2, "dj"),
(3, "playlist"),
(4, "vote"),
(5, "other"),
(6, "radio");


INSERT INTO bot_commands (id,name,alias,arg,module_id) VALUES
(1, "play", "p", "titleOrUrl", 1),
(2, "pause", "ps", null, 1),
(3, "resume", "rs", null, 1),
(4, "repeat", "rp", "repeatsNumber", 1),
(5, "repeatcls", "rpcl", null, 1),
(6, "loop", "lp", null, 1),
(7, "playing", "cp", null, 1),
(8, "paused", "cps", null, 1),
(9, "getvolume", "gvl", null, 1),
(10, "queue", "qt", null, 1),
(11, "setvolume", "svl", "volumeUnitsNumber", 2),
(12, "volumecls", "cvl", null, 2),
(13, "join", "jchn", null, 2),
(14, "tracksrm", "rtr", "memberTag", 2),
(15, "shuffle", "shq", null, 2),
(16, "skipto", "skt", "positionInQueue", 2),
(17, "skip", "sk", null, 2),
(18, "clear", "cl", null,  2),
(19, "stop", "st", null, 2),
(20, "move", "mv", "currentAndNewPos", 2),
(21, "infinite", "inf", null, 2),
(22, "addtrackpl", "apt", "playlistNameOrId", 3),
(23, "addqueuepl", "apq", "playlistNameOrId", 3),
(24, "addplaylist", "addpl", "playlistName", 3),
(25, "playpl", "pl", "playlistNameOrId", 3),
(26, "showmempl", "smmpl", "memberTag", 3),
(27, "showmypl", "smpl", null, 3),
(28, "showplsongs", "splsg", "playlistNameOrId", 3),
(29, "vshuffle", "vshq", null, 4),
(30, "vskip", "vsk", null, 4),
(31, "vskipto", "vsto", "positionInQueue", 4),
(32, "vclear", "vcl", null, 4),
(33, "vstop", "vst", null, 4),
(34, "help", "h", null, 5),
(35, "helpme", "hm", null, 5),
(36, "debug", "db", null, 5),
(37, "radio", "rd", "radioStation", 6),
(38, "radiostop", "rds", null, 6),
(39, "radioinfo", "ri", null, 6),
(40, "radios", "rda", null, 6);


INSERT INTO command_args (id,name,casted_type,is_required) VALUES
(1, "track", "STRING", true),
(2, "count", "INTEGER", true),
(3, "volume", "INTEGER", true),
(4, "member", "MENTIONABLE", true),
(5, "pos", "INTEGER", true),
(6, "fromPos", "INTEGER", true),
(7, "toPos", "INTEGER", true),
(8, "playlistNameOrId", "STRING", true),
(9, "playlistName", "STRING", true),
(10, "radioStation", "STRING", true);


INSERT INTO commands_args_binding(command_id,arg_id,arg_pos) VALUES
(1, 1, 1),
(4, 2, 1),
(11, 3, 1),
(14, 4, 1),
(16, 5, 1),
(20, 6, 1),
(20, 7, 2),
(22, 8, 1),
(23, 8, 1),
(24, 9, 1),
(25, 8, 1),
(26, 4, 1),
(28, 8, 1),
(31, 5, 1),
(37, 10, 1);


INSERT INTO command_arg_options(id,option_key,command_id,command_arg_id) VALUES
(1, "rmf-fm", 37, 10),
(2, "rmf-maxx", 37, 10),
(3, "zet", 37, 10),
(4, "melo", 37, 10),
(5, "anty", 37, 10);


INSERT INTO radio_stations(id,radio_key,stream_url,proxy_stream_url) VALUES
(1, "rmf-fm", "https://rs101-krk-cyfronet.rmfstream.pl/RMFFM48", null),
(2, "rmf-maxx", "https://rs103-krk-cyfronet.rmfstream.pl/MAXXXWAW", null);
(3, "zet", "https://22533.live.streamtheworld.com/RADIO_ZETAAC.aac", null);
(4, "melo", "https://27793.live.streamtheworld.com/MELORADIOAAC.aac", null);
(5, "anty", "https://25483.live.streamtheworld.com/ANTYRADIOAAC.aac", null, "anty.jpg");


INSERT INTO key_features (id,name,is_active) VALUES
(1, "commands", true),
(2, "audioPlayer", true),
(3, "radioSource", true),
(4, "votingSystem", false),
(5, "remotePlayback", false),
(6, "playlists", false),
(7, "management", false);


INSERT INTO global_configs (id,prop_key,prop_value,type) VALUES
(1, "guild.voting-percentage-ratio", "50", "Int"),
(2, "guild.time-to-finish-voting-sec", "50", "Long"),
(3, "guild.dj-role-name", "DJwizard", "String"),
(4, "guild.max-repeats-of-track", "30", "Int"),
(5, "guild.leave-empty-channel-sec", "120", "Long"),
(6, "guild.leave-no-tracks-channel-sec", "120", "Long"),
(7, "guild.default-volume", "100", "Int"),
(8, "guild.random-auto-choose-track", "true", "Boolean"),
(9, "guild.time-after-auto-choose-sec", "30", "Long"),
(10, "guild.tracks-to-choose-max", "10", "Int");


INSERT INTO jda_permission_flags (id, flag_name, is_active) VALUES
(1, "MANAGE_CHANNEL", true),
(2, "MANAGE_SERVER", false),
(3, "VIEW_AUDIT_LOGS", false),
(4, "VIEW_CHANNEL", true),
(5, "VIEW_GUILD_INSIGHTS", false),
(6, "MANAGE_ROLES", true),
(7, "MANAGE_PERMISSIONS", false),
(8, "MANAGE_WEBHOOKS", false),
(9, "MANAGE_GUILD_EXPRESSIONS", false),
(10, "MANAGE_EVENTS", false),
(11, "USE_EMBEDDED_ACTIVITIES", false),
(12, "VIEW_CREATOR_MONETIZATION_ANALYTICS", false),
(13, "CREATE_GUILD_EXPRESSIONS", false),
(14, "CREATE_SCHEDULED_EVENTS", false),
(15, "CREATE_INSTANT_INVITE", false),
(16, "KICK_MEMBERS", false),
(17, "BAN_MEMBERS", false),
(18, "NICKNAME_CHANGE", false),
(19, "NICKNAME_MANAGE", false),
(20, "MODERATE_MEMBERS", false),
(21, "MESSAGE_ADD_REACTION", true),
(22, "MESSAGE_SEND", true),
(23, "MESSAGE_TTS", false),
(24, "MESSAGE_MANAGE", true),
(25, "MESSAGE_EMBED_LINKS", true),
(26, "MESSAGE_ATTACH_FILES", true),
(27, "MESSAGE_HISTORY", true),
(28, "MESSAGE_MENTION_EVERYONE", false),
(29, "MESSAGE_EXT_EMOJI", true),
(30, "USE_APPLICATION_COMMANDS", true),
(31, "MESSAGE_EXT_STICKER", false),
(32, "MESSAGE_ATTACH_VOICE_MESSAGE", false),
(33, "MESSAGE_SEND_POLLS", false),
(34, "USE_EXTERNAL_APPLICATIONS", false),
(35, "MANAGE_THREADS", false),
(36, "CREATE_PUBLIC_THREADS", false),
(37, "CREATE_PRIVATE_THREADS", false),
(38, "MESSAGE_SEND_IN_THREADS", false),
(39, "PRIORITY_SPEAKER", false),
(40, "VOICE_STREAM", false),
(41, "VOICE_CONNECT", true),
(42, "VOICE_SPEAK", true),
(43, "VOICE_MUTE_OTHERS", false),
(44, "VOICE_DEAF_OTHERS", true),
(45, "VOICE_MOVE_OTHERS", false),
(46, "VOICE_USE_VAD", false),
(47, "VOICE_USE_SOUNDBOARD", false),
(48, "VOICE_USE_EXTERNAL_SOUNDS", false),
(49, "VOICE_SET_STATUS", false),
(50, "REQUEST_TO_SPEAK", false),
(51, "ADMINISTRATOR", false);
