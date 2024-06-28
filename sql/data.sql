INSERT INTO bot_langs(id,name,tag) VALUES
(1, "Polski", "pl"),
(2, "English", "en");


INSERT INTO command_modules (id,name,desc_pl,desc_en) VALUES
(1, "music", "Muzyka", "Music"),
(2, "dj", "Rola DJ-a", "DJ role"),
(3, "playlist", "Playlisty", "Playlists"),
(4, "vote", "Głosowanie", "Voting"),
(5, "other", "Inne", "Others"),
(6, "radio", "Stacje radiowe", "Radio stations");


INSERT INTO bot_commands (id,name,alias,arg_desc_pl,arg_desc_en,desc_pl,desc_en,module_id) VALUES
(1, "play", "p", "tytuł|URL", "title|URL", "odtworzenie pozycji i dodanie do kolejki (jeśli jakaś jest w danej chwili odtwarzana)", "play audio and add it to the queue (if any is currently playing)", 1),
(2, "pause", "ps", null, null, "zatrzymanie aktualnie odtwarzanej pozycji przez wysyłającego", "pause current playing audio by sender", 1),
(3, "resume", "rs", null, null, "ponowienie odtwarzania aktualnie zatrzymanej pozycji przez wysyłającego", "resume current paused audio by sender", 1),
(4, "repeat", "rp", "liczba powtórzeń", "repeats number", "powtórzenie aktualnie odtwarzanej pozycji wybraną ilość razy", "repeat current audio selected times", 1),
(5, "repeatcls", "rpcl", null, null, "usunięcie wykonywania powtórzeń aktualnie odtwarzanej pozycji", "clear repeating current audio", 1),
(6, "loop", "lp", null, null, "włączenie/wyłączenie nieskończonego powtarzania odtwarzanej pozycji", "turn on/off infinite repeating of current audio", 1),
(7, "playing", "cp", null, null, "informacje o aktualnie odtwarzanej pozycji (długość, nazwa, wykonawca itp.)", "current playing audio info (duration, name, etc.)", 1),
(8, "paused", "cps", null, null, "informacje o aktualnie wstrzymanej pozycji (długość, nazwa, wykonawca itp.)", "current paused audio info (duration, name, etc.)", 1),
(9, "getvolume", "gvl", null, null, "aktualna głośność odtwarzacza w zakresie od 0 do 150 jednostek", "get the current audio player volume from 0 to 150 units", 1),
(10, "queue", "qt", null, null, "wyświetlenie wszystkich pozycji w kolejce jako wiadomość z paginacją", "show all audios in queue as pageable message", 1),
(11, "setvolume", "svl", "liczba jednostek [0-150]", "units number [0-150]", "kontrola głośności odtwarzacza w zakresie od 0 do 150 jednostek", "control audio player volume from 0 to 150 units", 2),
(12, "volumecls", "cvl", null, null, "zresetowanie głośności odtwarzacza do wartości domyślnej", "reset audio player volume to default value", 2),
(13, "join", "jchn", null, null, "przeniesienie bota na kanał głosowy na którym znajduje się użytkownik", "move and join bot to voice current voice channel", 2),
(14, "tracksrm", "rtr", "tag użytkownika", "member tag", "usunięcie wszystkich pozycji dodanych przez wybranego użytkownika", "remove all audios added by selected member to queue", 2),
(15, "shuffle", "shq", null, null, "przetasowanie wszystkich pozycji w kolejce", "shuffle all audios in current queue", 2),
(16, "skipto", "skt", "pozycja w kolejce", "position number", "pominięcie i przejście do wybranej pozycji w kolejce, usuwając poprzednie", "skip current playing audio and move to selected position, removed previous", 2),
(17, "skip", "sk", null, null, "pominięcie i przejście do następnej pozycji w kolejce", "skip current playing audio and move to next track in queue", 2),
(18, "clear", "cl", null, null, "usunięcie zawartości kolejki", "remove all positions from queue", 2),
(19, "stop", "st", null, null, "zatrzymanie odtwarzania i usunięcie zawartości kolejki", "stopping current playing audio and remove all positions from queue", 2),
(20, "move", "mv", "aktualna pozycja, nowa pozycja", "current position, new position", "przeniesienie pozycji na wybrane miejsce w kolejce odtwarzania", "move audio to selected position in queue", 2),
(21, "infinite", "inf", null, null, "włączenie/wyłączenie nieskończonego powtarzania odtwarzanej kolejki", "toggle infinite loop on current queue", 2),
(22, "addtrackpl", "apt", "nazwa|id playlisty", "playlist name|id", "zapisuje aktualnie odtwarzaną pozycję do listy odtwarzania", "add current audio to the selected playlist", 3),
(23, "addqueuepl", "apq", "nazwa|id playlisty", "playlist name|id", "zapisuje aktualną zawartość kolejki do listy odtwarzania", "add current audio queue content to the selected playlist", 3),
(24, "addplaylist", "addpl", "nazwa playlisty", "playlist name", "umożliwia utworzenie nowej prywatnej listy odtwarzania", "create new private playlist", 3),
(25, "playpl", "pl", "nazwa|id playlisty", "playlist name|id", "ładuje i uruchamia zapisaną listę odtwarzania", "load and start playing audios from selected playlist", 3),
(26, "showmempl", "smmpl", "tag użytkownika", "member tag", "pokazuje wszystkie publiczne listy odtwarzania wybranego użytkownika", "show all public playlist from selected user", 3),
(27, "showmypl", "smpl", null, null, "pokazuje wszystkie Twoje listy odtwarzania", "show all playlist from you", 3),
(28, "showplsongs", "splsg", "nazwa|id playlisty", "playlist name|id", "pokazuje wszystkie pozycje z wybranej listy odtwarzania", "show all audios from selected playlist", 3),
(29, "vshuffle", "vshq", null, null, "głosowanie umożliwiające przetasowanie kolejki", "initiate voting to shuffle current queue", 4),
(30, "vskip", "vsk", null, null, "głosowanie umożliwiające pominięcie odtwarzanej pozycji", "initiate voting to skip current audio from queue", 4),
(31, "vskipto", "vsto", "pozycja w kolejce", "position number", "głosowanie umożliwiające pominiecie i przejście do wybranej pozycji", "initiate voting to skip and move to selected position in queue", 4),
(32, "vclear", "vcl", null, null, "głosowanie umożliwiające wyczyszczenie kolejki", "initiate voting to remove all positions from queue", 4),
(33, "vstop", "vst", null, null, "głosowanie umożliwiające pominięcie odtwarzania i wyczyszczenie kolejki", "initiate voting to skip current audio and remove all tracks from queue", 4),
(34, "help", "h", null, null, "wyświetlenie wszystkich komend bota", "show all bot commands", 5),
(35, "helpme", "hm", null, null, "wyświetlenie wszystkich komend bota w wiadomości prywatnej", "show all bot commands in private message", 5),
(36, "debug", "db", null, null, "wyświetlenie informacji debugujących (status JRE, ilość zajętej pamięci sterty, itp.)", "show debug information's (JRE, Heap info, audio codec etc.)", 5),
(37, "radio", "rd", "stacja radiowa", "radio station", "uruchomienie odtwarzania wybranej stacji radiowej", "start playback of the selected radio station", 6),
(38, "radiostop", "rds", null, null, "zatrzymanie odtwarzania stacji radiowej", "stop playing a radio station", 6),
(39, "radioinfo", "ri", null, null, "wyświetlenie informacji o aktualnie odtwarzanej stacji radiowej", "display of information's about the currently playing radio station", 6),
(40, "radios", "rda", null, null, "wyświetlenie wszystkich dostępnych stacji radiowych na serwerze", "display of all available radio stations on the server", 6);


INSERT INTO command_args (id,name,casted_type,is_required,desc_pl,desc_en) VALUES
(1, "track", "STRING", true, "nazwa-lub-url", "name-or-url"),
(2, "count", "INTEGER", true, "ilość", "count"),
(3, "volume", "INTEGER", true, "głośność", "volume"),
(4, "member", "MENTIONABLE", true, "id-użytkownika", "member-id"),
(5, "pos", "INTEGER", true, "pozycja", "position"),
(6, "fromPos", "INTEGER", true, "pozycja-startowa", "start-position"),
(7, "toPos", "INTEGER", true, "pozycja-końcowa", "end-position"),
(8, "playlistNameOrId", "STRING", true, "nazwa-playlisty-lub-id", "playlist-name-or-id"),
(9, "playlistName", "STRING", true, "nazwa-playlisty", "playlist-name"),
(10, "radioStation", "STRING", true, "stacja-radiowa", "radio-station");


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


INSERT INTO command_arg_options(id,raw_value,desc_en,desc_pl,command_id,command_arg_id) VALUES
(1, "rmf-fm", "RMF FM", "RMF FM", 37, 10),
(2, "rmf-maxx", "RMF MAXX", "RMF MAXX", 37, 10),
(3, "zet", "Radio ZET", "Radio ZET", 37, 10),
(4, "melo", "Melo Radio", "Melo Radio", 37, 10),
(5, "anty", "Anty Radio", "Anty Radio", 37, 10);


INSERT INTO radio_stations(id,name,slug,stream_url,proxy_stream_url,cover_image) VALUES
(1, "RMF FM", "rmf-fm", "https://rs101-krk-cyfronet.rmfstream.pl/RMFFM48", null, "rmf-fm.jpg"),
(2, "RMF MAXX", "rmf-maxx", "https://rs103-krk-cyfronet.rmfstream.pl/MAXXXWAW", null, "rmf-maxx.jpg");
(3, "Radio ZET", "zet", "https://22533.live.streamtheworld.com/RADIO_ZETAAC.aac", null, "zet.jpg");
(4, "Melo Radio", "melo", "https://27793.live.streamtheworld.com/MELORADIOAAC.aac", null, "melo.jpg");
(5, "Anty Radio", "anty", "https://25483.live.streamtheworld.com/ANTYRADIOAAC.aac", null, "anty.jpg");


INSERT INTO audio_sources (id,name,desc_pl,desc_en,source_class) VALUES
(1, "youtube", "YouTube", "YouTube", "dev.lavalink.youtube.YoutubeAudioSourceManager"),
(2, "soundcloud", "Soundcloud", "Soundcloud", "com.sedmelluq.discord.lavaplayer.source.soundcloud.SoundCloudAudioSourceManager"),
(3, "bandcamp", "Bandcamp", "Bandcamp", "com.sedmelluq.discord.lavaplayer.source.bandcamp.BandcampAudioSourceManager"),
(4, "vimeo", "Vimeo", "Vimeo", "com.sedmelluq.discord.lavaplayer.source.vimeo.VimeoAudioSourceManager"),
(5, "twitch", "Twitch", "Twitch", "com.sedmelluq.discord.lavaplayer.source.twitch.TwitchStreamAudioSourceManager"),
(6, "local", "Źródła lokalne", "Local sources", "com.sedmelluq.discord.lavaplayer.source.local.LocalAudioSourceManager"),
(7, "radio", "Wybrane stacje radiowe", "Selected radio stations", "com.sedmelluq.discord.lavaplayer.source.http.HttpAudioSourceManager");


INSERT INTO key_features (id,name,title_en,title_pl,desc_en,desc_pl,is_active) VALUES
(1, "commands", "Handling legacy and slash commands", "Obsługa komendy prefiksowe oraz poleceń slash", "Concurrent support for prefix commands (starting with $ by default) and modern slash commands / supporting the same functions.", "Jednoczesna obsługa komend prefiksowych (domyślnie rozpoczynających się od $) oraz nowoczesnych komend slash / obsługujących te same funkcje.", true),
(2, "audioPlayer", "Audio player", "Odtwarzacz muzyczny", "Ability to play, pause, skip and add audio items to a queue. Support for handling audio content from a wide variety of sources, including those marked as NSFW.", "Możliwość odtwarzania, zatrzymywania, pomijania oraz dodawanie elementów audio do kolejki. Wsparcie obsługi treści audio z wielu różnych źródeł, również tych oznaczonych jako NSFW.", true),
(3, "radioSource", "Internet radio", "Radio internetowe", "Ability to receive broadcasts and view currently playing content of selected radio stations. For more information, visit the 'radio' page.", "Możliwość odbioru transmisji oraz podglądu aktualnie odtwarzanych treści wybranych stacji radiowych. Więcej informacji znajdziesz na stronie 'radio'.", true),
(4, "votingSystem", "Voting system", "System głosowania", "Highly customizable voting system that allows skipping the currently playing audio source, shuffling the queue and other audio player actions.", "Wysoce konfigurowalny system głosowania umożliwiający pominięcie aktualnie odtwarzanego źródła dźwięku, przetasowanie kolejki oraz inne akcje odtwarzacza audio.", false),
(5, "remotePlayback", "Remote playback via web browser", "Zdalne odtwarzanie z poziomu przeglądarki", "An innovative system for playing audio content without the need for commands, using a browser interface and the capabilities offered by real-time communication.", "Innowacyjny system odtwarzania treści audio bez potrzeby używania komend, z wykorzystaniem interfejsu przeglądarki oraz możliwości oferowanych przez komunikację w czasie rzeczywistym.", false),
(6, "playlists", "Audio playlists", "Listy odtwarzania", "Save, manage and playback audio content stored in a proprietary playlist system. Interaction through commands and a web browser.", "Zapisywanie, zarządzanie i odtwarzanie treści audio zapisanych w autorskim systemie list odtwarzania. Interakcja poprzez komendy oraz przeglądarkę internetową.", false),
(7, "management", "Guild management system", "System zarządzania gildią", "Manage commands, audio player settings, guild settings, and playlists assigned to a user account through a web browser.", "Zarządzanie komendami, ustawieniami odtwarzacza audio, ustawieniami gildii oraz listami odtwarzania przypisanymi do konta użytkownika poprzez przeglądarkę internetową.", false);