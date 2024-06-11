INSERT INTO bot_langs(id,name,tag) VALUES
(1, "Polski", "pl"),
(2, "English", "en");

INSERT INTO command_modules (id,name,desc_pl,desc_en) VALUES
(1, "music", "Muzyka", "Music"),
(2, "dj", "Rola DJ-a", "DJ role"),
(3, "playlist", "Playlisty", "Playlists"),
(4, "vote", "Głosowanie", "Voting"),
(5, "other", "Inne", "Others");


INSERT INTO bot_commands (id,name,alias,arg_desc_pl,arg_desc_en,desc_pl,desc_en,module_id) VALUES
(1, "play", "p", "tytuł|URL", "title|URL", "odtworzenie piosenki i dodanie do kolejki (jeśli jakaś jest w danej chwili odtwarzana)", "play a song and add it to the queue (if any is currently playing)", 1),
(2, "pause", "ps", null, null, "zatrzymanie aktualnie odtwarzanej piosenki przez wysyłającego", "pause current playing song by sender", 1),
(3, "resume", "rs", null, null, "ponowienie odtwarzania aktualnie zatrzymanej piosenki przez wysyłającego", "resume current paused song by sender", 1),
(4, "repeat", "rp", "liczba powtórzeń", "repeats number", "powtórzenie aktualnie odtwarzanej piosenki wybraną ilość razy", "repeat current track selected times", 1),
(5, "repeatcls", "rpcl", null, null, "usunięcie wykonywania powtórzeń aktualnie odtwarzanej piosenki", "clear repeating current track", 1),
(6, "loop", "lp", null, null, "włączenie/wyłączenie nieskończonego powtarzania odtwarzanej piosenki", "turn on/off infinite repeating of current track", 1),
(7, "playing", "cp", null, null, "informacje o aktualnie odtwarzanej piosence (długość, nazwa, wykonawca itp.)", "current playing track info (duration, name, etc.)", 1),
(8, "paused", "cps", null, null, "informacje o aktualnie wstrzymanej piosence (długość, nazwa, wykonawca itp.)", "current paused track info (duration, name, etc.)", 1),
(9, "getvolume", "gvl", null, null, "aktualna głośność odtwarzacza w zakresie od 0 do 150 jednostek", "get the current audio player volume from 0 to 150 units", 1),
(10, "queue", "qt", null, null, "wyświetlenie wszystkich piosenek w kolejce jako wiadomość z paginacją", "show all tracks in queue as pageable message", 1),
(11, "setvolume", "svl", "liczba jednostek [0-150]", "units number [0-150]", "kontrola głośności odtwarzacza w zakresie od 0 do 150 jednostek", "control audio player volume from 0 to 150 units", 2),
(12, "volumecls", "cvl", null, null, "zresetowanie głośności odtwarzacza do wartości domyślnej", "reset audio player volume to default value", 2),
(13, "join", "jchn", null, null, "przeniesienie bota na kanał głosowy na którym znajduje się użytkownik", "move and join bot to voice current voice channel", 2),
(14, "tracksrm", "rtr", "tag użytkownika", "member tag", "usunięcie wszystkich piosenek dodanych przez wybranego użytkownika", "remove all tracks added by selected member to queue", 2),
(15, "shuffle", "shq", null, null, "przetasowanie wszystkich piosenek w kolejce", "shuffle all tracks in current queue", 2),
(16, "skipto", "skt", "pozycja w kolejce", "position number", "pominięcie odtwarzanej piosenki i przejście do wybranej pozycji w kolejce, usuwając poprzednie", "skip current playing track and move to selected position, removed previous", 2),
(17, "skip", "sk", null, null, "pominięcie odtwarzanej piosenki i przejście do następnej w kolejce", "skip current playing track and move to next track in queue", 2),
(18, "clear", "cl", null, null, "usunięcie zawartości kolejki", "remove all tracks from queue", 2),
(19, "stop", "st", null, null, "zatrzymanie odtwarzania piosenki i usunięcie zawartości kolejki", "stopping current playing track and remove all tracks from queue", 2),
(20, "move", "mv", "aktualna pozycja, nowa pozycja", "current position, new position", "przeniesienie piosenki na wybrane miejsce w kolejce odtwarzania", "move track to selected position in queue", 2),
(21, "infinite", "inf", null, null, "włączenie/wyłączenie nieskończonego powtarzania odtwarzanej playlisty", "toggle infinite loop on current playlist", 2),
(22, "addtrackpl", "apt", "nazwa|id playlisty", "playlist name|id", "zapisuje aktualnie odtwarzaną piosenkę do listy odtwarzania", "add current track to the selected playlist", 3),
(23, "addqueuepl", "apq", "nazwa|id playlisty", "playlist name|id", "zapisuje aktualną zawartość kolejki do listy odtwarzania", "add current audio queue content to the selected playlist", 3),
(24, "addplaylist", "addpl", "nazwa playlisty", "playlist name", "umożliwia utworzenie nowej prywatnej playlisty", "create new private playlist", 3),
(25, "playpl", "pl", "nazwa|id playlisty", "playlist name|id", "uruchamia odtwarzanie playlisty", "load and start playing tracks from selected playlist", 3),
(26, "showmempl", "smmpl", "tag użytkownika", "member tag", "pokazuje wszystkie publiczne listy odtwarzania wybranego użytkownika", "show all public playlist from selected user", 3),
(27, "showmypl", "smpl", null, null, "pokazuje wszystkie Twoje listy odtwarzania", "show all playlist from you", 3),
(28, "showplsongs", "splsg", "nazwa|id playlisty", "playlist name|id", "pokazuje wszystkie piosenki z wybranej listy odtwarzania", "show all tracks from selected playlist", 3),
(29, "vshuffle", "vshq", null, null, "głosowanie umożliwiające przetasowanie kolejki", "initiate voting to shuffle current tracks queue", 4),
(30, "vskip", "vsk", null, null, "głosowanie umożliwiające pominięcie odtwarzanej piosenki", "initiate voting to skip current track from queue", 4),
(31, "vskipto", "vsto", "pozycja w kolejce", "position number", "głosowanie umożliwiające pominiecie odtwarzanej piosenki i przejście do wybranej pozycji", "initiate voting to skip current track to selected track position in queue", 4),
(32, "vclear", "vcl", null, null, "głosowanie umożliwiające wyczyszczenie kolejki", "initiate voting to remove all tracks from queue", 4),
(33, "vstop", "vst", null, null, "głosowanie umożliwiające pominięcie odtwarzanej piosenki i wyczyszczenie kolejki", "initiate voting to skip current track and remove all tracks from queue", 4),
(34, "help", "h", null, null, "wyświetlenie wszystkich komend bota", "show all bot commands", 5),
(35, "helpme", "hm", null, null, "wyświetlenie wszystkich komend bota w wiadomości prywatnej", "show all bot commands in private message", 5),
(36, "debug", "db", null, null, "wyświetlenie informacji debugujących (status JRE, ilość zajętej pamięci sterty, itp.)", "show debug information's (JRE, Heap info, audio codec etc.)", 5);


INSERT INTO command_args (id,name,casted_type,is_required,desc_pl,desc_en) VALUES
(1, "track", "STRING", true, "nazwa-lub-url", "name-or-url"),
(2, "count", "INTEGER", true, "ilość", "count"),
(3, "volume", "INTEGER", true, "głośność", "volume"),
(4, "member", "MENTIONABLE", true, "id-użytkownika", "member-id"),
(5, "pos", "INTEGER", true, "pozycja", "position"),
(6, "fromPos", "INTEGER", true, "pozycja-startowa", "start-position"),
(7, "toPos", "INTEGER", true, "pozycja-końcowa", "end-position"),
(8, "playlistNameOrId", "STRING", true, "nazwa-playlisty-lub-id", "playlist-name-or-id"),
(9, "playlistName", "STRING", true, "nazwa-playlisty", "playlist-name");


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
(31, 5, 1);