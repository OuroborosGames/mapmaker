"The New Mapmaker" by Ouroboros Games

[ TODO:
	- music
	- cover
	- playtesting
	- reconsider dialog system (menu-based instead of parser-based?)
	- maybe some feelies (preface? pictures?)
	- maybe links in sidebar
	- maybe better names ]

Volume 0 - Internals
[ This is the place for all the configuration stuff and global data which would be out of place in the game proper. ]

Chapter 1 - Clobal Variables and General Rules
[ Things that apply to the whole game: viewpoint/tense, generic descriptions etc. ]

Section 1 - Unconditional Includes
[ Those libraries will be included in both the debug and release builds. ]

[ Inform 7 extensions are not my favorite module system. For all the (deservedly) bad things you could say about npm or homebrew or whatever else package manager you hate, Inform has it worse.

First you have extensions which break compilation when you only import them, or when you import them in a bad order. Sometimes, examples from module's documentation don't work and break your build. Most of those are extensions from outside of the 'public library' and you need to pull them from github, so at least you know they're unstable. Of course, the assumption that things in the public library are stable falls apart when you download an extension from the public library and it complains about you not having its dependency, which is not in public library.

And here's another problem: the complaining. Inform 7 resolves dependencies by telling you about them.  If you don't have a needed extension or have a wrong version, Inform will tell you. There's no automatic download (even from public library), and because dependencies often have their own dependencies, welcome to the .dll (or rather .i7x) hell. ]

Include Glulx Text Effects by Emily Short.
Include Exit Lister by Eric Eve.
Include Footnotes by Stephen Granade.
Include Questions by Michael Callaghan

Section 2 - Global Settings

Instead of going nowhere: 
  say "I couldn't go that way. ";
  list the exits.

When play begins:
	now the story viewpoint is first person singular;
	now the story tense is past tense.

Section 3 - Footnote settings

Footnotes are on.
Footnotes are given repeatedly.

Section 4 - Sidebar - For release only
[ Sidebar is disabled in debug builds because I don't want to see the prompt at every restart, and also I want to focus on the text and gameplay - and uncluttered UI helps with that. ]

Include Common Commands Sidebar by Alice Grove.

When play begins:
	prepare the command sidebar, on the right, with fixed letter spacing, divided with stars;
	choose row 16 in Table of Default Sidebar commands;
	now displayed command entry is "Tell/Ask X about Y";
	repeat with i running from 17 to 19:
		choose row i in Table of Default Sidebar commands;
		blank out the whole row;
	choose row 22 in Table of Default Sidebar commands;
	now displayed command entry is "Again (G)";
	choose row 23 in Table of Default Sidebar commands;
	now displayed command entry is "Note # - read footnote";
	repeat with i running from 24 to 25:
		choose row i in Table of Default Sidebar commands;
		blank out the whole row.
	
The background color of the sidebar is "#666666".
The text color of the sidebar is "#ffffff".
The sidebar is disabling debugging in the not-for-release version.

Chapter 2 - Release

Section 1 - Bibliographic data

Story title is "The New Mapmaker".
Story author is "Ouroboros Games".
Story headline is "A practical exercise in cartographic occultism".
Story genre is "Surreal". [ I'm not sure if this qualifies as surreal, it might be a bit too grounded in reality. Still, I don't think it qualifies as 'fantasy' either, and from what I've read it seems that the 'other' tag is for formal experiments which it isn't, and the 'fiction' tag is for 'literary fiction', and I'm not quite pretentious enough to use that term. I'm just gonna say that it's magic realism and magic realism is related to surrealism and leave it at that. ]
Story description is "A scholar's journey of (re)discovery in a world which doesn't want to be known.".
Story creation year is 2018.
Release number is 0. [ There's no real possibility of doing semver here because the release number can't be a string or a real number, only integer. So I'm using 0 to mark beta versions and anything higher than that is a release. ]

Section 2 - Title Screen - For release only
[ Configuration of the title screen; not compiled into debug builds for ease of restarting. ]

Include Title Page by Jon Ingold.

To say quotation:
	say "[story headline]

	Writing and code: <%= @author %>[line break]
	Worldbuilding concept: <%= @worldbuilding %>[line break]
	Beta testing: <%= @testers %>".

Section 3 - Release settings - For release only

Release along with an interpreter, library card and source text.

Chapter 3 - Debugging - Not for release
[ Functionality I'm using to debug the game; not compiled into release builds to not break the immersion. ]

Every turn:
	 say  [ monospaced so that it stands out ]
	"[fixed letter spacing]DEBUG:[line break]";
	showme the contents of Table of Mapped Terrain;
	say "dominant terrain: [dominant terrain][line break]";
	say "desolation: [desolation][line break]";
	say "danger: [danger][line break]";
	say "turn: [turn count][line break]
your position: [location of player][line break]
[roman type][line break]".

Volume 1 - The game proper
[ Things that happen during the game, organized by timeframe. ]

Chapter 1 - University Politics

Section 1 - My office
[ Static stuff about the office: books, furniture etc. ]

My office is a room. "<%= @room_looktext %>"

Office door is a closed, openable door. Office door is south of my office and north of hallway. "<%= @door_looktext %>". The description of the office door is "<%= @door_description %>"

There is a desk in my office. "<%= @desk_looktext %>". Description of desk is "<%= @desk_description %>" Understand "wooden desk" as desk. Desk is a supporter.

A book is a kind of thing. Symbolic Cartography, 1243 Atlas of The Known World, Principles of Geography, Travels of Prudent Men and Towards the New Mapmaking are books. All books are on the bookshelf. Bookshelf is in my office. "<%= @bookshelf_looktext %>" Description of the bookshelf is "<%= @bookshelf_description %>"

<%= @describe_books %>

Hallway is a room. "I shouldn't be able to get into this room. It must be the programmer's fault".

University is a region.  My office and hallway are in University. 

Table of Footnotes (continued)
Name	Note
principles	"<%= @note_principles %>"

Section 2 - Passing time
[ Things to do before the plot-relevant events kick in - mostly just trying to work ]

Instead of going to hallway, say "<%= @dont_leave %>".

Understand "read [book]" as taking.

Instead of taking a book, say "<%= @dont_read %>"

Working is an action applying to nothing. Understand "work", "study" and "write" as working.
Carry out working in my office:
	say "<%= @work1 %>".
Instead of doing it for the second time, say "<%= @work2 %>".
Instead of doing it for the third time, say "<%= @work3 %>".
Instead of doing it for the fourth time, say "<%= @work4 %>".

Instead of sleeping, say "<%= @dont_sleep %>"

Section 3 - Receiving a map from professor Lapis

Meeting the professor is a scene. Meeting the professor begins when the player is in my office for the fifth turn. Meeting the professor ends when the player carries map of Noninsula.

Map of Noninsula is a thing. Description of map of Noninsula is "Map showing a location of an island called Noninsula on the Vast Sea, southwest of the Navigator's Bay."
Understand "map" as Map of Noninsula.

Professor Lapis is a man. He is in the hallway. He carries the map of Noninsula and a suitcase. He wears a gray coat and a hat.

Understand "professor", "Lapis", "mentor" and "philosopher" as professor Lapis.

When meeting the professor begins:
	try silently opening the office door;
	move professor Lapis to my office;
	try silently closing the office door;
	say "<%= @professor_arrives %>";
	say "<%= @on_pragmatism %>".

Instead of telling professor Lapis about something, try asking professor Lapis about it.  Before asking professor Lapis about something for the first time:
	say "<%= @conversation_intro %>";
	move map of Noninsula to desk.

After asking the professor about a topic listed in the Table of First Conversation, say reply entry.

<%= @conversation_table_1 %>

<%= @footnote_table_1 %>

When meeting the professor ends:
	say "<%= @professor_exit %>";
	try silently opening the office door;
	move professor Lapis to hallway;
	expedition begins in one turn from now;
	try silently closing the office door.
	
Chapter 2 - Intermission

At the time when expedition begins:
	say "<%= @intermission %>";
	move player to coast of Noninsula.
	
Table of Footnotes (continued)
Name	Note
wave-merchant	"<%= @merchant %>"
vevvas	"<%= @vevvas %>"


Chapter 3 - Noninsula

Section 1 - Exploration rules

[ When moving to a place we don't know, we're asked what to put on the map. This determines the description of this place. ]

Unknown place is a kind of room. Unknown place has some text called terrain type. Terrain type of unknown place is "unknown".

Desolation and danger are numbers that vary.

Cartography rules is a rulebook. After going to unknown place, follow the cartography rules.

A cartography rule:
	if the player is in wilderness:
		if the terrain type of location of the player is "unknown":
			say "<%= @unknown_location %>";
			now the current question is "<%= @location_question %>";
			now current question menu is {"Field", "Forest", "Hill", "Mountain", "Lake", "Desert"};
			ask a closed question, in menu mode;
	if the player is in Aeripolis:
		if the terrain type of location of the player is "unknown":
			say "<%= @unknown_aeripolis %>";
			now the current question is "<%= @aeripolis_question %>";
			now current question menu is {"...friendly", "...hostile", "...abandoned"};
			ask a closed question, in menu mode.
			
After going from wilderness to Coast of Noninsula:
	[ Returning to the coast allows us to go back to the mainland. This is allowed even if we didn't explore anything - in fact, the 'No Island' ending depends on the unexplored territory being more common than any other type of terrain. ]
	now the current question is "<%= @coast_question %>";
	now the current question menu is {"I waited for the ship back home.", "I looked at the Vast Sea."};
	ask a closed question, in menu mode.

A menu question rule:
	if the current question is "<%= @location_question %>":
		choose row the number understood in Table of Mapped Terrain;
		now the count entry is the count entry + 1;
		now the terrain type of location of player is the terrain type entry;
		now danger is danger + danger entry;
		now desolation is desolation + desolation entry;
		let idx be count entry; [ we need this temp variable, or parser goes crazy juggling 2 tables at the same time ]
		let temptab be descriptions entry;
		choose row idx in temptab;
		say "[line break][line break][value entry]";
		now the description of location of player is value entry;
		choose row with a terrain type of "unknown" in Table of Mapped Terrain;
		now the count entry is the count entry - 1;
	if the current question is "<%= @aeripolis_question %>":
		choose row the number understood in Table of Aeripolis;
		now the terrain type of location of the player is the terrain type entry;
		say "[line break][line break][town description entry]";
		now the description of location of the player is the town description entry;
	if the current question is "<%= @coast_question %>":
		if the number understood is 1:
			say "<%= @returning_home %>";
			move player to Cafe Campus.
		
Instead of examining in the wilderness, say "<%= @wilderness_examine %>". 

Exploration is a scene. Exploration begins when player is in Island of Noninsula. Exploration ends when player is not in Island of Noninsula.

<%= @footnote_table_2 %>

Section 2 - Data-driven dynamic geography

[ When we put something on the map, we increase the count and assign the next value from a relevant description table. Those tables are laid out so that the more of a certain feature we add, the more extreme it becomes. If certain feature dominates the majority of an island, the narrator/protagonist will note how common (or omnipresent) it is. ]

Table of Mapped Terrain
Terrain Type	Count	Descriptions	Desolation	Danger
"Field"	0	Table of Field Descriptions	3	0
"Forest"	0	Table of Forest Descriptions	0	1
"Hill"	0	Table of Hill Descriptions	1	0
"Mountain"	0	Table of Mountain Descriptions	2	4
"Lake"	0	Table of Lake Descriptions	0	1
"Desert"	0	Table of Desert Descriptions	4	4
"unknown"	9	--	--	--

<%= @geography_tables %>

		
Section 3 - Static Geography

[ entrypoint ]
Coast of Noninsula is a room. "<%= @coast_looktext %>".

[ south ]
South Noninsula is an unknown place. South Noninsula is north of Coast of Noninsula.  Southwest Noninsula is an unknown place. Southwest Noninsula is northwest of Coast of Noninsula and west of South Noninsula. Southeast Noninsula is an unknown place. Southeast Noninsula is northeast of Coast of Noninsula and east of South Noninsula.

[ center ]
Central Noninsula is an unknown place. Central Noninsula is north of South Noninsula, northwest of Southeast Noninsula and northeast of Southwest Noninsula. West Noninsula is an unknown place. It is northwest of South Noninsula and north of Southwest Noninsula. East Noninsula is an unknown place. It is northeast of South Noninsula, north of Southeast Noninsula and east of Central Noninsula. Aeripolis is an unknown place. Aeripolis is east of West Noninsula and west of Central Noninsula. Copper mine is a room. "<%= @mine_looktext %>". It is north of Aeripolis.

[ north ]
North Noninsula is an unknown place. It is north of Central Noninsula, northwest of East Noninsula and northeast of West Noninsula. Northwest Noninsula is an unknown place. It is north of West Noninsula, west of North Noninsula and northwest of Central Noninsula. Northeast Noninsula is an unknown place. It is north of East Noninsula, east of North Noninsula and northeast of Central Noninsula.

[ all ]
The wilderness is a region. Coast of Noninsula, South Noninsula, Southwest Noninsula, 
Southeast Noninsula, Central Noninsula, West Noninsula, East Noninsula, North Noninsula, Northwest Noninsula and Northeast Noninsula are parts of The wilderness.

Inhabited area is a region. Aeripolis and Copper mine are parts of inhabited area.

The island of Noninsula is a region. The wilderness and inhabited are parts of the island of Noninsula.

Instead of sleeping in the Island of Noninsula, say "<%= @island_sleep %>"

[ Mine-specific items ]
Stairs are a thing.  "<%= @stairs_looktext %>". Description of stairs is "Crude stone stairs." Understand "stone stairs "as stairs.

Furnace is a thing. "<%= @furnace_looktext %>" Description of furnace is "<%= @furnace_description %>". Furnace is fixed in place. Understand "smelter" as furnace. Furnace is in copper mine.

Piece of copper is a thing. "<%= @copper_looktext %>" Description of piece of copper is "<%= @copper_description %>" Before taking piece of copper, say "<%= @take_copper %>". Understand "copper piece", "copper cone", "conical piece of copper" and "cone" as piece of copper. Piece of copper is in the copper mine.

Chapter 4 - Endings

[ Ending is divided into part A and B; part A depends entirely on dominant terrain type and whether it makes mining profitable for the University or not (or, if you avoid exploring, there's a special ending A for that too); part B depends on the stats of your terrain, and what they say about you as a player (and there's a hidden ending in which the big lie is revealed) ]

Section 1 - Setting things up

[ This part of ending is decided based on the most common terrain type on the island. Because of the sorting algorithm used by Inform 7, this errs on the side of the "Noninsula Copper Company" ending, with the "No Island" ending being the least likely. ]

Dominant terrain is some text that varies. The dominant terrain is initially "placeholder".

Outdoor university is a region. Cafe Campus is a room. "My return to the University was probably more eventful than my expedition. It was all rather stressful, so I often found myself relaxing at the famous Cafe Campus.". Cafe Campus, university, university grounds and university are in outdoor university. Cafe door is a door. "Cafe Campus was located on the University grounds. It was a place popular with both the students and the professors, and not just because it was the only one there. Rector Wright spared no expenses when buying teas and coffees, as she used this place to make the University seem more prestigious. Part of its charm was also its exclusivity - its doors were open for those who worked and studied here, but everyone else needed an invitation[note invitation]. Even my mentor who used to work here for years wouldn't be able to go there if I didn't invite him.". Cafe door is east of cafe and west of university grounds. Main entrance is a door. Main entrance is north of university grounds and south of hallway.

Coffee table is a supporter. "I sat at a table in the corner, far from the entrance. As I waited for my former mentor, I reflected on what happened after my return". Coffee table is in Cafe Campus. Cup of tea is on coffee table. "The day I met professor Lapis for the last time, I ordered an expensive (far more expensive than what I could afford on a regular basis, but fitting for that particular day) variety of black tea from Igt[note igt]." Understand "cup" and "tea" and "black tea" as cup of tea. Description of cup of tea is "A cup of strong, slightly bitter tea. Expensive, but worth its price."

Instead of going east in Cafe Campus, say "I stayed in Cafe Campus. I had a meeting with professor Lapis there.".

Ending picker is a scene. Ending picker begins when exploration ends. When ending picker begins:
	sort Table of Mapped Terrain in reverse Count order;
	choose row 1 from Table of Mapped Terrain;
	say "Back in the University, I presented my findings to the Institute of the Inanimate. I made sure to focus on the copper deposits and the mine. Predictably, the news of my journey travelled to the rector herself and she decided to organize a large-scale expedition. Several scholars from the Institute of the Societal expressed their desire to study the islanders and their settlements, but their proposals were quickly rejected by Wright who wanted to enforce strict separation between the Institutes. Thus, a university ship [italic type]Mind Voyager[roman type] was filled with geographers, geologists and engineers and sent straight towards Noninsula.";
	now dominant terrain is the terrain type entry.

Ending picker ends inconclusively when dominant terrain is "unknown". Ending picker ends happily when dominant terrain is "Field" or dominant terrain is "Forest" or dominant terrain is "Hill". Ending picker ends sadly when dominant terrain is "Mountain" or dominant terrain is "Lake" or dominant terrain is "Desert".
	
Table of Footnotes (continued)
Name	Note
igt	"A remote town which by then has gained independence from our North-East Colonies and joined the short-lived Zerta Confederation. Nowadays, it is of course a part of the Kirmyan Empire."
invitation	"Written, of course."

Section 2 - Ending A1 - No Island

No Island is a scene. No Island begins when ending picker ends inconclusively. No Island ends when the player has been in campus cafe for more than 1 turn.

When No Island begins:
	say "[italic type]Mind Voyager[roman type] returned from its journey after two weeks. Given that it was much slower than [italic type]Merchant of the Waves[roman type], the short duration of the expedition was rather surprising. More surprising was the story told by the travellers: apparently, they were unable to locate the island. Constantia Wright cursed their incompetence and sent a smaller ship, this time staffed only by the geographers specializing in navigation.

	Once again, the travellers returned with empty hands. Rector decided to send in yet another expedition just to be sure, but the results were predictable: the only thing they found was water.

	Of course, I was the next person to face her anger. I was accused of fabricating the results of my research and threatened with expulsion. I defended myself by mentioning the captain and the crew of [italic type]Merchant of the Waves[roman type] who brought me to and from the island. Unable to paint us all as liars and unwilling to admit to the flaws in her philosophy, she sent us to the Institute of the Animate for a medical examination. The University doctors decided that we suffered from collective hallucinations caused by a combination of autosuggestion, poisoning by spoiled food rations, chronic alcohol abuse and the overdose of Vevvasian Incense. I was forced to go through a few pointless therapy session, given an official reprimand for my lack of scientific rigor and placed on a month-long unpaid leave.

	It wasn't all for nothing though. Most of the doctors knew that the diagnosis they made was just an attempt to sweep the nature of our reality under the rug. This undermined Wright's authority and guaranteed that the schools of thought she fought against would survive. As time went by, the concept of democratic reality became an unofficial basis for the medical theories put forward by the Institute of the Inanimate, and the plague mysticism gained some popularity among students who founded a secret Brotherhood of Noninsula Seekers.".

Section 3 - Ending A2 - Noninsula Copper Company

Noninsula Copper Company is a scene. Noninsula Copper Company begins when ending picker ends happily. Noninsula Copper Company ends when the player has been in campus cafe for more than 1 turn.

When Noninsula Copper Company begins:
	say "The expedition was a great success. After a few months of studies, it turned out that the area can solve our country's copper problems completely, and thus the government established Noninsula Copper Company. Of course, all the glory went to the higher-ups at the Institute of the Inanimate as rector Wright decided to use this situation as an opportunity to create a legend about the exceptional wisdom of our professors. Still, I got a decent paycheck from that and I was allowed to abandon the boring studies of coal mining to write a doctoral dissertation about the unusual geographic features of Noninsula.

	When it comes to the political struggels inside the University itself, the Noninsula expeditions became a common argument in favor of Constantia Wright's leadership. Institute of the Inanimate proceeded with their electrification efforts, and even if they never managed to go beyond the University itself and a few of the largest cities, they managed to expand the rector's vision for the future from rebuilding the world to making it better than it was before the plague. In hindsight, it didn't quite work out, but that idea is still alive in the University.

	Still, as I was sitting in Cafe Campus, I couldn't help but wonder why did professor Lapis give me that map. After Noninsula Copper Company became a thing, interest in the occult experimentation has declined drastically. Did he sacrifice what was left of the plague mystic school of thought to help his former students? Did he know that the time of plague mystics has ended and decided to ensure that there's a place for us in this new University? Or maybe he strategically supported Wright so that there will be no place at the University for the democratic realists and their bookburning ambitions.".

Section 4 - Ending A3 - Coal Not Copper

Coal Not Copper is a scene. Coal Not Copper begins when ending picker ends sadly. Coal Not Copper ends when the player has been in campus cafe for more than 1 turn.

When Coal Not Copper begins:
	say "After [italic type]Mind Voyager[roman type] returned, many reports and analyses were written and even more debates were held. After we turned our knowledge of Noninsula into as many raw numbers as possible, our work was handed to the Institute of the Societal and its economists.

	The economists did not spend as much time on the details as we did. In fact, after less than one week they have gave us their calculation: due to Noninsula's difficult terrain, the costs related to mining, extracting and transporting the copper would be an order of magnitude greater than the possible profits. Noninsula was put on the maps with an annotation describing its copper deposits and unusual geography, but nothing more was done with it as the University had more important work to do.

	The Noninsula expeditions were a failure, but they were a failure for which the University was prepared. As time went by, everything went back to normal and I was reassigned to writing about coal mining in Dusty Mountains. After the eventful journey and hopeful return, the excitement has disappointingly faded and everything - the island, plague mystics, democratic realists, my scholarly ambitions - was dissolved in the boring practicality of everyday work. Constantia Wright's victory was entirely consistent with her worldview - quiet, grounded and inevitable.".

Section 5 - Endings B

Post-Ending is a scene. Post-Ending begins when No Island ends. Post-Ending begins when Noninsula Copper Company ends. Post-Ending begins when Coal Not Copper ends. When Post-Ending begins:
	try silently opening the cafe door;
	move professor Lapis to Campus Cafe;
	try silently closing the cafe door;
	say "My train of thought was interrupted by professor Lapis. I didn't even notice as he entered the cafe and sat at my table with a small cup of strong coffee. We exchanged greetings, and started talking about my journey to Noninsula.".

[ Ending B1 - New Island ]	
Post-Ending ends when professor Lapis carries a piece of copper. When Post-Ending ends:
	say "I showed professor Lapis the strangely heavy piece of copper that I found in the Aeripolis mine. He took it in his hands, looked at it from all sides, noticed its unusual weight. He went quiet for an uncomfortably long period of time. I considered breaking the silence but couldn't bring myself to do it.

	When he spoke again, he told me the truth: the Noninsula expedition was his final experiment, and his last stand against the politics that led to him losing his position. He falsified the map (the original showed a common Vast Sea route to the Western Colonies), adding an island that the University wanted to exist. Noninsula didn't exist before he drew it (or maybe before I went there). The plan was to create an island that would be of interest to the University - adding a piece of plague mysticism to Constantia Wright's attempts at rebuilding the old world.

	The copper cone could have been his argument that the world worked according to his theories (although the same could have probably been said by the adherents of the democratic reality school), but it ended up being something else. He admitted that he didn't really understand it, and while he didn't admit that he was afraid of it, it was quite obvious that he was. He finished his coffee, said that the copper cone will lead him to a new, better theory and left. I never saw him again, and neither did anyone else from the University.

	What I did see was the slow but unavoidable change in the world. I now see that the plague was just the beginning, and that the reality as we know it is either falling apart or mutating beyond our recognition. People at the University still won't admit that, and they will say that the whole plague mysticism drove me to insanity - but deep inside, they know it too. There is chaos ahead of us, and we don't know how to fight it or control it. Maybe we can't. Maybe we can't even survive it.";
	end the story finally. 

After asking the professor about a topic listed in the Table of Second Conversation in Cafe Campus, say reply entry instead.

Instead of asking professor Lapis about "piece of copper", try silently giving a piece of copper to professor Lapis. Instead of asking professor Lapis about "copper piece", try silently giving a piece of copper to professor Lapis. Instead of asking professor Lapis about "copper cone", try silently giving a piece of copper to professor Lapis. Instead of asking professor Lapis about "conical piece of copper", try silently giving a piece of copper to professor Lapis. The block giving rule is not listed in the check giving it to rules.

After asking professor Lapis about something in Cafe Campus for the fifth time:
	if asking professor Lapis about a topic listed in the Table of Second Conversation:
		say reply entry;
	say "After professor Lapis finished his coffee and I finished my tea, we left the Cafe Campus and each of us went his own way. I don't know where did my former mentor go, and neither does anyone at the University. Years later, I still don't know the meaning of the words he said before going through the University Gate for the last time:[line break][line break]";
	if desolation is greater than 21 and danger is greater than 21:
		[ Ending B2 - A Bad Place ]
		say "[quotation mark]That place you've created, it seems evil. I don't think we belong there. Is that how you see our world? You may be right, but I'm not going to give up just yet.[quotation mark]";
	otherwise if desolation is greater than 25:
		[ Ending B3 - Beautiful Void ]
		say "[quotation mark]You have made Noninsula into a void. I understand that, I dislike people too. Maybe I will become a hermit and continue my studies without seeking recognition. You should consider that too, or else this University will eat your soul.[quotation mark]";
	otherwise if danger is greater than 25:
		[ Ending B4 - Adventure ]
		say "[quotation mark]Any other geographer would make Noninsula into a boring piece of land with some unusual rock formation, or something like that. You gave it personality. I don't think that endleslly typing away words about coal or copper is the life for you. You have a spirit of an adventurer, and the world is becoming a good place for adventurers.[quotation mark]";
	otherwise if desolation is less than 5:
		[ Ending B5 - No Rest For The Mystic ]
		say "[quotation mark]It is quite crowded on that island of yours. All the animals and people and no place to rest or hide. You should learn to appreciate emptiness.[quotation mark]";
	otherwise if danger is less than 5:
		[ Ending B6 - An Island ]
		say "[quotation mark]I didn't really expect you to make Noninsula so boring. I think the University life has affected you so much that you just can't imagine there being any other way. I think you should leave this place before it's too late. You don't want to become the next Constantia Wright, do you?[quotation mark]";
	otherwise:
		[ Ending B7 - Good Island ]
		say "[quotation mark]Your island is quite a beautiful place. Maybe not exciting, but I wouldn't mind living there. If you're going to help the University rebuild the world, make sure that it ends up looking a bit like that.[quotation mark]";
	end the story finally. 

Table of Second Conversation
Topic	Reply
"map" or "map of Noninsula"	"I showed my former mentor the map of Noninsula - now filled in with the details I discovered during my journey. He looked at it, smiled and told me that he wasn't sure if this will work, but he's glad that it did."
"Noninsula" or "island"	"I described the island to professor Lapis. He listened carefully and seemed fascinated by it. Was he such a good actor or did he for some reason become interested in completely mundane, non-occult geography? I didn't know."
"journey" or "expedition"	"I told professor Lapis about my seasickness, the hardships of exploring the island, the joy of discovery. He appreciated the adventure, and said that now that he was free of the University-related responsibilities, he might try travelling just to see the world beyond the declining cities and dying schools."
"Merchant of the Waves" or "wave merchant" or "ship"	"We talked about my travels on a clipper ship - the difficulty of leaving home, the relief of returning, the contrast between the living conditions and the expensive cargo bought in Vevvas."
"Aeripolis"	"Professor Lapis was especially interested in the mining town of Aeripolis, and the people who lived there. He was disappointed in how little details I could provide, and hoped that the Institute of the Societal would study the Noninsulan society."
"tea" or "coffee" or "Cafe Campus"	"We shared our appreciation for Cafe Campus. My former mentor admitted that of all the things he could find on the University grounds, good coffee would be the one he will miss the most."
"brotherhood" or "seekers" or "Brotherhood of Noninsula Seekers"	"I told the professor about the Brotherhood of Noninsula Seekers, a small secret society formed by the students with interest in the philosophy of plague mystics. He was intrigued, but pessimistic - he predicted that the group will degenerate into a pretentious club for rich students who disguise their abuse of alcohol as something deeper."
