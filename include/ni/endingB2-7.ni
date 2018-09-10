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