/*
 * Author: Jonpas
 * Sets advanced visible element of the UI using displays and controls.
 *
 * Arguments:
 * 0: Element Name <STRING>
 * 1: Show/Hide Element <BOOL>
 * 2: Show Hint <BOOL>
 * 3: Force change even when disallowed <BOOL> (default: false)
 *
 * Return Value:
 * Successfully Set <BOOL>
 *
 * Example:
 * ["ace_ui_ammoCount", true, false] call ace_ui_fnc_setAdvancedElement
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_element", "_show", ["_showHint", false, [true]], ["_force", false, [true]] ];

if (!_force && {!GVAR(allowSelectiveUI)}) exitWith {
    [LSTRING(Disallowed), 2] call EFUNC(common,displayTextStructured);
    false
};

private _config = configFile >> "ACE_UI" >> _element;

// Exit if main vehicle type condition not fitting
private _location = getNumber (_config >> "location"); // (0-both, 1-ground, 2-vehicle)
private _currentLocation = ACE_player == vehicle ACE_player;
if ((_currentLocation && _location == 2) || (!_currentLocation && _location == 1)) exitWith {false};

private _idd = getNumber (_config >> "idd");
private _elements = getArray (_config >> "elements");

// Get setting from config API
{
    private _condition = call compile (getText _x);
    if !(_condition) exitWith {
        TRACE_2("Condition False",_element,_x);
        // Display and print info which component forced the element except for default vehicle check
        if (_showHint) then {
            [LSTRING(Disabled), 2] call EFUNC(common,displayTextStructured);
        };
        _show = false;
    };
} forEach (configProperties [_config >> "conditions"]);

// Get setting from scripted API
if (!_force) then {
    private _index = GVAR(elementsSet) find [_element, _show];
    if (_index == -1) then {
        _index = GVAR(elementsSet) find [_element, !_show];
        if (_index != -1) then {
            if (_showHint) then {
                [LSTRING(Disabled), 2] call EFUNC(common,displayTextStructured);
            };
            _show = ((GVAR(elementsSet)) select _index) select 1;
        };
    };
};

_show = [1, 0] select _show;

// Disable/Enable elements
private _success = false;
{
    private _idc = _x;

    // Loop through IGUI displays as they can be present several times for some reason
    {
        if (_idd == ctrlIDD _x) then {
            //TRACE_3("Setting Element Visibility",_show,_idd,_idc);

            (_x displayCtrl _idc) ctrlSetFade _show;
            (_x displayCtrl _idc) ctrlCommit 0;

            _success = true;
        };
    } forEach (uiNamespace getVariable "IGUI_displays");
} forEach _elements;

_success
