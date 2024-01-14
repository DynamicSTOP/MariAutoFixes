# What is this mod?

This mod is about fixing car parts that are usually not allowed to be fixed.
With default settings some operations are risky! **Pay close attention to the tooltips.**

The overall idea came from having modded cars and not being able to use any of them since most of them was in a terrible
condition. Shoutout to [KI5](https://steamcommunity.com/id/KI5/myworkshopfiles/?appid=108600) mods, I freaking love
those models!
Also, shoutout to The Indie Stone studio that made this wonderful game into reality! You guys and gals are awesome!

This is also my first mod and I haven't touched LUA in a while so expect some bugs.

### This mod is adding\changing ingame items\recipes and could injure and potentially kill player character. I don't take responsibility for any kind of damages. You are using it on your own risk. Make backups.

## How do I do ... ?

### Windshields

Before we start make sure you have the following items:

- a pair of Vanilla **Leather Gloves** on you (having holes in them doesn't matter... for now)
- **medkit** (at the very least something to bandage yourself with)
- some sort of **hammer**
- some sort of **sledgehammer**
- vanilla **empty tin can** (having full belly moodle is also a big yes)
- Mortar and Pestle
- some **glass** "source": reading glasses, empty whiskey bottles, vine glasses. You could always just break neighbours
  window....
- some regular **glue** (wooden one wouldn't work)

The simplest process should look like so.

1. Get the tin cans full of glass shards. You should be able to find recipes using "glass" search.
2. Further crush glass into sand with the sledgehammer
3. Mix the solution with glue
4. At this point you should have **Glass Fix Mix**
5. Uninstall car window (installed doesn't work... for now)
6. Right click on car window and use the context menu. No option in context menu? Check FAQ bellow.

## Planned

### Glass

- **planned** pro repair kits. restore up to 90% with mechanic 10
- **planned** temperature effect. repair during cold weather will result in low repair quality.
- **planned** heat Glass Fix Mix step and get burns.

### Tuning kits

- **planned** with high enough mechanic\electronic\metalworking making engine tuning kit. Similar to glue mixes but for
  engine. Should not give more than 70% quality.

### Seats

- **planned** with sewing\metalworking\carpentry allow making seats.

### Tires

- **planned** chopping existing tires and applying patches with a torch
- **planned** tapping trees during hot months for resin (new resin trees?)

### More Glass Working

- **planned** getting clay from sand tiles near rivers. Making kiln (need to check blender).
- **planned** having clay molds allowing to reach 90% glass quality \ starting fire near kiln \ temperature effect on
  result

### More Auto Working Structures

- **planned** some 3d models for working on tires, windshields giving bonus to repair rolls.

### Overall

- **planned** explore TimedActions and Animations
- **planned** restoring burned cars?

## FAQ

### I have an idea!

Nice! Check the ideas.md file and if it's not there post it as an issue or open pull request on github. I would also
read steam mod comments from time to time.

### I found a bug!

Oof.. sorry about that. Same as ideas, post it on github as an issue or down into the comments.

### How does injuries work?

If you don't wear gloves it's at least 30% chance to cut yourself. With gloves on it's down to 1%. Only vanilla leather
gloves are supported. Some Traits and Professions affect the chance, but the chance is always at least 1%.
Moodles greatly affect the chance of getting injury. Your best bet is to wear leather gloves, have a full belly and no
bad moodles.
DO NOT EVEN TRY TO DO RISKY OPERATIONS WHILE YOU HAVE BAD MOODLES. Unless you want to level up first aid this way...
psycho...

### Can it fix modded car parts?

As long as experimental setting is ON mod would try to guess if it is fixable vehicle part.

### I still don't see context submenu option for the item!

If you don't see fix option note following possibilities:

- with experimental OFF - only vanilla is supported but you can add more types in settings
- with experimental ON - the item type doesn't have "Windshield" or "SideWindow" in it's name or has "Armor"
- the item condition is too good (more then 80% by default, mechanic skill adds 1% per level)
- the item condition is too bad (0% by default, but will be ~10% in the future. mechanics skill drops the value by 1%
  per level)

If it's none of the above you can try running game in the [DEBUG](https://pzwiki.net/wiki/Debug_mode#Items_List) mode
and check if item name doesn't suffice conditions as well as experiment there if you could summon the menu.
Still nothing? Report a bug.

### Why it doesn't fix all the way to 100% ? Why there are getting injury risks?

Everytime you go into the game you see "This is how you died". I believe there is enough mods that walk you by the hand
and I wanted to have some of that dopamine challenge.

### What's the point if gasoline isn't infinite?

Oh well... another day another mod? Also some people have garages full of cars, but they can only drive one at time you
know?

### Can I include it in my modpack?

As long as you don't modify the mod beyond settings values and give some credits you have my permission.

### Can I edit something in the mod?

If don't plan to upload the result anywhere why do you even ask? How would I know edits were made?
For everything else consider making a pull request in github repo.

### It's not working with current version, can I fix it and upload to the steam workshop?

If this mod isn't compatible with latest version of the Project Zomboid game for **more than 3 months**
and **I don't give any ETA** on making it compatible again or any other kind of response
then you have my permission to fix it and upload under your steam account into workshop.
But you have to give credits on the mod page to the original one.

### Can I upload it somewhere other than steam?

No. Respect the copyrights. You may ask me to upload there but no promises I'll do that.
