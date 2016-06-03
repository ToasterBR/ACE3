#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// settings
[QUOTE(ADDON), QGVAR(showNames), "LIST", [localize CSTRING(showNames), localize CSTRING(showNames_Desc)], [
    [0,1,2,3,4],
    [localize ECSTRING(common,Disabled), localize ECSTRING(common,Enabled), localize CSTRING(OnlyCursor), localize CSTRING(OnlyKeypress), localize CSTRING(OnlyCursorAndKeypress)],
    1
], nil, FUNC(updateSettings)] call CBA_settings_fnc_create;

[QUOTE(ADDON), QGVAR(defaultNametagColor), "COLOR", localize CSTRING(DefaultNametagColor), [0.77,0.51,0.08,1]] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(showRanks), "BOOLEAN", localize CSTRING(showRanks), true] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(showSoundWaves), "LIST", [localize CSTRING(showSoundWaves), localize CSTRING(showSoundWaves_Desc)], [
    [0,1,2],
    [localize ECSTRING(common,Disabled), localize CSTRING(NameTagSettings), localize CSTRING(AlwaysShowAll)],
    1
]] call CBA_settings_fnc_create;

[QUOTE(ADDON), QGVAR(showVehicleCrewInfo), "BOOLEAN", localize CSTRING(showVehicleCrewInfo), true] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(showNamesForAI), "BOOLEAN", localize CSTRING(showNamesForAI), false] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(tagSize), "LIST", [localize CSTRING(TagSize_Name), localize CSTRING(TagSize_Description)], [
    [0,1,2,3,4],
    [localize "$str_very_small", localize "$str_small", localize "$str_medium", localize "$str_large", localize "$str_very_large"],
    2
]] call CBA_settings_fnc_create;

[QUOTE(ADDON), QGVAR(showCursorTagForVehicles), "BOOLEAN", nil, false, ["Server", "Mission"]] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(playerNamesViewDistance), "SLIDER", nil, [0, 50, 5], ["Server", "Mission"]] call CBA_settings_fnc_create;
[QUOTE(ADDON), QGVAR(playerNamesMaxAlpha), "SLIDER", nil, [0, 1, 0.8, 2], ["Server", "Mission"]] call CBA_settings_fnc_create;

ADDON = true;
