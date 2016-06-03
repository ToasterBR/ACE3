#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// settings
[QUOTE(ADDON), QGVAR(showNames), "LIST", [LSTRING(showNames), LSTRING(showNames_Desc)], [
    [0,1,2,3,4],
    [ELSTRING(common,Disabled), ELSTRING(common,Enabled), LSTRING(OnlyCursor), LSTRING(OnlyKeypress), LSTRING(OnlyCursorAndKeypress)],
    1
], nil, FUNC(updateSettings)] call CBA_settings_fnc_create;

[QUOTE(ADDON), QGVAR(defaultNametagColor), "COLOR", LSTRING(DefaultNametagColor), [0.77,0.51,0.08,1]] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(showRanks), "BOOLEAN", LSTRING(showRanks), true] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(showSoundWaves), "LIST", [LSTRING(showSoundWaves), LSTRING(showSoundWaves_Desc)], [
    [0,1,2],
    [ELSTRING(common,Disabled), LSTRING(NameTagSettings), LSTRING(AlwaysShowAll)],
    1
]] call CBA_settings_fnc_create;

[QUOTE(ADDON), QGVAR(showVehicleCrewInfo), "BOOLEAN", LSTRING(showVehicleCrewInfo), true] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(showNamesForAI), "BOOLEAN", LSTRING(showNamesForAI), false] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(tagSize), "LIST", [LSTRING(TagSize_Name), LSTRING(TagSize_Description)], [
    [0,1,2,3,4],
    ["$str_very_small", "$str_small", "$str_medium", "$str_large", "$str_very_large"],
    2
]] call CBA_settings_fnc_create;

[QUOTE(ADDON), QGVAR(showCursorTagForVehicles), "BOOLEAN", nil, false, ["Server", "Mission"]] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(playerNamesViewDistance), "SLIDER", nil, [0, 50, 5], ["Server", "Mission"]] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(playerNamesMaxAlpha), "SLIDER", nil, [0, 1, 0.8, 2], ["Server", "Mission"]] call CBA_settings_fnc_create;

ADDON = true;
