@XLA_FixedArsenal
================

This is a mod for Arma3. 
This mod improves the way the virtual arsenal works when using 'whitelisting' mode. 
The 'white listing' feature of the (vanilla) arsenal allows scripters to determine what items are or are not available. 
However, the vanilla white-listing has a few issues. E.g. by default, saved outfits that contain non-whitelisted equipment cannot be loaded. 
This mod introduces partial loading, i.e. loading all whitelisted parts of a saved outfit. It also includes fixes and improvements related to the white-listing feature.

USE ACE3 ARSENAL INSTEAD
=============
As of version 3.12.0, the popular ACE3 mod now includes an arsenal that has partial loading/etc but also includes many additional improvements. https://github.com/acemod/ACE3 

Partial Loading
================
Partial Loading means that outfits that contain non-whitelisted or non-existing (classname not found) items can still be loaded, but any item that is non-whitelisted/not found will be skipped. 
If the non-whitelisted item is a uniform, backpack or vest, the currently equipped uniform,backpack or vest (respectively) will be kept.
Outfits that contain non-available (either due to classname-not-found or non-whitelisted) will be greyed-out in the virtual arsenal's "load" view.

Side-based white/blacklisting
=================
In addition the usual system of whitelisting items by classname, you can also white/blacklist specific sides.
This relies on the item having either a "side", "faction" or "XLA_arsenal_side" attribute in their config.
For all vanilla items this has been done as part of the mod, however modded content will usually not have this set.
(Or, worse, it will have it set/inherited in non-sensible ways). To fix this, compatibility pbos will eventually be made available for popular mods.

(Optional) Semantics Change
================
In the vanilla arsenal, any item currently equipped by the soldier is automatically available in the arsenal. (Effectively, the white-list was computed as the white list + any current equipment the soldier had). This has two effects: Firstly, it allows players to duplicate items like grenades even if they are not part of the white-list. Secondly, it makes it hard for players and mission designers to predict what items will be available when a certain player visits the arsenal.
With v2 of FixedArsenal you can enable or disable this. Disabling is highly recommended since it makes the semantics of loadouts much easier to understand.

Usage
=============
If you don't want to use the side/blacklisting features, this works exactly like the vanilla arsenal.
Just use "xla_fnc_arsenal" instead of "bis_fnc_arsenal".
Documentation on the advanced features will be completed soon TM.

Showcase
===========
This mod includes a simple showcase and debugging mission under Play -> Showcases -> XLA | Arsenal Showcase.


Usage
===========
You can find some more-or-less complete, potentially outdated and most defintively WIP documentation [here](https://www.mediawiki.org/wiki/User:ImperialAlex/Sandbox)


Feedback
==========
Feel free to use this mod's [issue tracker](https://github.com/ImperialAlex/XLA_FixedArsenal/issues) or head over to the [BI forums thread](http://forums.bistudio.com/showthread.php?184838-quot-Fixed-quot-Arsenal-an-Arsenal-improving-workaround/) to discuss this mod.
