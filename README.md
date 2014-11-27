@XLA_FixedArsenal
================

This is a mod for Arma3. 
This mod 'fixes' a few issues with the default Virtual Arsenal. 
The Virtual Arsenal has a 'whitelisting' feature that allows scripters to determine what items are or are not available. 
By default, saved outfits that contain non-whitelisted equipment cannot be loaded.
This mod introduces partial loading, i.e. loading all whitelisted parts of a saved outfit.

It also changes the whitelisting behaviour slightly. In the default arsenal, any item that a player has in his current inventory is 'whitelisted' by default. The mod disables this so that everybody sees the same arsenal, no matter what gear they wear when they access it.
By default, the arsenal also does not mesh together too well with composite weapons, i.e. weapons that have attachments by default. There is an issue on the ArmA3 feedback tracker that can be seen here. The bug prevents you from loading a loadout that contains a composite weapon, even if the weapon is whitelisted. This mod includes a simple workaround for this issue, allowing you to save and load composite weapons properly.

This mod is designed to work together in conjunction with my XLA_RestrictedArsenal.sqf script. To test that script, try my sample mission CO8_WhitelistedArsenalShowcase on steam.
