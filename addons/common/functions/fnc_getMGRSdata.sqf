/*
 * Author: VKing
 * Gets the current map's MGRS grid zone designator and 100km square.
 * Also gets longitude, latitude and altitude offset for the map.
 * Writes return values to GVAR(MGRS_data) if run on the current map.
 *
 * Argument:
 * 0: Map name (default: worldName) <STRING>
 *
 * Return Value:
 * 0: Grid zone designator <STRING>
 * 1: 100km square <STRING>
 * 2: GZD + 100km sq. as a single string <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_map", worldName]];

private _long = getNumber (configFile >> "CfgWorlds" >> _map >> "longitude");
private _lat =  getNumber (configFile >> "CfgWorlds" >> _map >> "latitude");
private _altitude =  getNumber (configFile >> "CfgWorlds" >> _map >> "elevationOffset");

_map = toLower _map;
if (_map in ["abbottabad"]) then { _lat = 34; _altitude = 1256; };    //Abbottabad elevation 1256m (Wikipedia)
if (_map in ["abramia"]) then { _lat = 60; _altitude = 0; };
if (_map in ["af_kandahar_province"]) then { _lat = 42; _altitude = 0; };
if (_map in ["altis"]) then { _lat = 40; _altitude = 0; };
if (_map in ["angel"]) then { _lat = 38; _altitude = 0; };
if (_map in ["anim_helvantis_v2"]) then { _lat = 50; _altitude = 0; };
if (_map in ["australia"]) then { _lat = -25; _altitude = 0; };
if (_map in ["bootcamp_acr"]) then { _lat = 50; _altitude = 0; };
if (_map in ["bornholm"]) then { _lat = 55; _altitude = 0; };
if (_map in ["bozcaada"]) then { _lat = 40; _altitude = 0; };
if (_map in ["caribou"]) then { _lat = 68; _altitude = 0; };
if (_map in ["catalina"]) then { _lat = 33; _altitude = 0; };
if (_map in ["chernarus", "chernarus_summer", "chernarus_winter"]) then { _lat = 50; _altitude = 0; };
if (_map in ["chernobylzone", "chernobylzonea2"]) then { _lat = 51; _altitude = 0; };
if (_map in ["clafghan"]) then { _lat = 34; _altitude = 640; };
if (_map in ["dakrong"]) then { _lat = 17; _altitude = 0; };    //Unsung Mod
if (_map in ["desert_e"]) then { _lat = 40; _altitude = 800; };
if (_map in ["dya"]) then { _lat = 34; _altitude = 110; };    //Diyala Iraq - default elevationOffset
if (_map in ["esseker"]) then { _lat = 43; _altitude = 2000; };
if (_map in ["evergreen"]) then { _lat = 41; _altitude = 0; };    //Burgazada, Turkey - default elevationOffset
if (_map in ["fallujah"]) then { _lat = 33; _altitude = 0; };
if (_map in ["fata"]) then { _lat = 33; _altitude = 1347; };
if (_map in ["gorgona"]) then { _lat = 43; _altitude = 0; };
if (_map in ["hellskitchen", "hellskitchens"]) then { _lat = 32; _altitude = 900; };    //Sangin summer, Sangin winter - Sangin elevation 888m (Wikipedia)
if (_map in ["hindukush"]) then { _lat = 36; _altitude = 0; };
if (_map in ["imrali", "imralispring"]) then { _lat = 40; _altitude = 0; };
if (_map in ["intro"]) then { _lat = 40; _altitude = 0; };
if (_map in ["isladuala3"]) then { _lat = -19; _altitude = 0; };
if (_map in ["jacobi"]) then { _lat = 34; _altitude = 2000; };    //default elevationOffset     
if (_map in ["kapaulio"]) then { _lat = 0; _altitude = 0; };
if (_map in ["kerama"]) then { _lat = 26; _altitude = 0; };    //Kerama Islands, Japan - default elevationOffset
if (_map in ["kholm"]) then { _lat = 36; _altitude = 0; };
if (_map in ["koplic"]) then { _lat = 42; _altitude = 0; };
if (_map in ["kunduz"]) then { _lat = 37; _altitude = 0; };
if (_map in ["lingor", "lingor3"]) then { _lat = -4; _altitude = 0; };
if (_map in ["lost", "lostw"]) then { _lat = 60; _altitude = 0; };
if (_map in ["mcn_aliabad"]) then { _lat = 36; _altitude = 0; };
if (_map in ["malvinas"]) then { _lat = -52; _altitude = 0; };
if (_map in ["namalsk"]) then { _lat = 65; _altitude = 0; };
if (_map in ["mef_alaska"]) then { _lat = 60; _altitude = 5; };
if (_map in ["mountains_acr"]) then { _lat = 35; _altitude = 2000; };
if (_map in ["napf", "napfwinter"]) then { _lat = 47; _altitude = 0; };
if (_map in ["panthera3"]) then { _lat = 46; _altitude = 0; };
if (_map in ["pianosa_aut"]) then { _lat = 43; _altitude = 0; };    //Pianosa, Italy - default elevationOffset
if (_map in ["pja305"]) then { _lat = 0; _altitude = 0; };    //G.O.S N'Ziwasogo
if (_map in ["pja306"]) then { _lat = 35; _altitude = 0; };    //G.O.S Kalu Khan
if (_map in ["pja307"]) then { _lat = 17; _altitude = 0; };    //F.S.F Daryah
if (_map in ["pja308"]) then { _lat = 36; _altitude = 0; };    //G.O.S Gunkizli
if (_map in ["pja310"]) then { _lat = 36; _altitude = 0; };    //G.O.S Al Rayak
if (_map in ["pja312"]) then { _lat = 16; _altitude = 0; };    //G.O.S Song Bin Tanh
if (_map in ["porquerolles"]) then { _lat = 43; _altitude = 0; };
if (_map in ["porto"]) then { _lat = 40; _altitude = 0; };
if (_map in ["provinggrounds_pmc"]) then { _lat = 35; _altitude = 100; };
if (_map in ["reshmaan"]) then { _lat = 35; _altitude = 2000; };
if (_map in ["sara", "sara_dbe1"]) then { _lat = 40; _altitude = 0; };
if (_map in ["saralite"]) then { _lat = 40; _altitude = 0; };
if (_map in ["sb3"]) then { _lat = 53; _altitude = 25; };    //TrpUebPl Einfelde Nord (Munster North Training Area, Germany) - default elevationOffset
if (_map in ["shapur_baf"]) then { _lat = 35; _altitude = 100; };
if (_map in ["sfp_sturko"]) then { _lat = 56; _altitude = 0; };
if (_map in ["sfp_wamako"]) then { _lat = 14; _altitude = 0; };
if (_map in ["stratis"]) then { _lat = 40; _altitude = 0; };
if (_map in ["sugarlake"]) then { _lat = 29; _altitude = 0; };
if (_map in ["takistan"]) then { _lat = 35; _altitude = 2000; };
if (_map in ["thirsk"]) then { _lat = 65; _altitude = 0; };
if (_map in ["tilos"]) then { _lat = 36; _altitude = 0; };
if (_map in ["utes"]) then { _lat = 50; _altitude = 0; };
if (_map in ["vt5"]) then { _lat = 61; _altitude = 100; };    //Vt5, Suomi Finland - default elevationOffset
if (_map in ["wake"]) then { _lat = 19; _altitude = 0; };
if (_map in ["waziristan"]) then { _lat = 33; _altitude = 0; };
if (_map in ["wintermap"]) then { _lat = 61; _altitude = 0; };    //Nordkvingo - default elevationOffset
if (_map in ["wintertown", "wintertowna3"]) then { _lat = 39; _altitude = 600; };    //U.S. state Kansas mean elevation 610m (Wikipedia)
if (_map in ["woodland_acr"]) then { _lat = 50; _altitude = 0; };
if (_map in ["xcam_prototype"]) then { _lat = 35; _altitude = 0; };
if (_map in ["zargabad"]) then { _lat = 35; _altitude = 2000; };

private _UTM = [_long,_lat] call BIS_fnc_posDegToUTM;
private _easting = _UTM select 0;
private _northing = _UTM select 1;
//private _zone = _UTM select 2;
TRACE_4("",_UTM,_easting,_northing,_zone);

/*
private _band = switch (true) do {
    case (_lat<-72): {"C"};
    case (_lat<-64): {"D"};
    case (_lat<-56): {"E"};
    case (_lat<-48): {"F"};
    case (_lat<-40): {"G"};
    case (_lat<-32): {"H"};
    case (_lat<-24): {"J"};
    case (_lat<-16): {"K"};
    case (_lat<-8): {"L"};
    case (_lat<0): {"M"};
    case (_lat>72): {"X"};
    case (_lat>64): {"W"};
    case (_lat>56): {"V"};
    case (_lat>48): {"U"};
    case (_lat>40): {"T"};
    case (_lat>32): {"S"};
    case (_lat>24): {"R"};
    case (_lat>16): {"Q"};
    case (_lat>8): {"P"};
    case (_lat>=0): {"N"};
};
*/

private _zone = 1 + (floor ((_long + 180) / 6));
private _band = "Z";

if (_lat <= -80) then {
    _band = "A";
} else {
    if (_lat < 84) then {
        _band = "CDEFGHJKLMNPQRSTUVWXX" select [(floor ((_lat / 8) + 10)), 1];
    };
};

if (_map == "VR") then {_zone = 0; _band = "RV";};

private _GZD = format ["%1%2",_zone,_band];
TRACE_3("",_zone,_band,_GZD);

private ["_metaE", "_metaN", "_letterE", "_letterN"];

private _set1 = [1,7,13,19,25,31,37,43,49,55];
private _set2 = [2,8,14,20,26,32,38,44,50,56];
private _set3 = [3,9,15,21,27,33,39,45,51,57];
private _set4 = [4,10,16,22,28,34,40,46,52,58];
private _set5 = [5,11,17,23,29,35,41,47,53,59];
private _set6 = [6,12,18,24,30,36,42,48,54,60];

switch (true) do {
    case (_zone in _set1): {_metaE = 1; _metaN = 1;};
    case (_zone in _set2): {_metaE = 2; _metaN = 2;};
    case (_zone in _set3): {_metaE = 3; _metaN = 1;};
    case (_zone in _set4): {_metaE = 1; _metaN = 2;};
    case (_zone in _set5): {_metaE = 2; _metaN = 1;};
    case (_zone in _set6): {_metaE = 3; _metaN = 2;};
};
TRACE_2("",_metaE,_metaN);

switch (true) do {
    case (_zone == 0): {_letterE = "E"};
    case (_easting > 800000): {LOG("E8"); switch (_metaE) do {case 1: {_letterE="H"}; case 2: {_letterE="R"}; case 3: {_letterE="Z"}; }; };
    case (_easting > 700000): {LOG("E7"); switch (_metaE) do {case 1: {_letterE="G"}; case 2: {_letterE="Q"}; case 3: {_letterE="Y"}; }; };
    case (_easting > 600000): {LOG("E6"); switch (_metaE) do {case 1: {_letterE="F"}; case 2: {_letterE="P"}; case 3: {_letterE="X"}; }; };
    case (_easting > 500000): {LOG("E5"); switch (_metaE) do {case 1: {_letterE="E"}; case 2: {_letterE="N"}; case 3: {_letterE="W"}; }; };
    case (_easting > 400000): {LOG("E4"); switch (_metaE) do {case 1: {_letterE="D"}; case 2: {_letterE="M"}; case 3: {_letterE="V"}; }; };
    case (_easting > 300000): {LOG("E3"); switch (_metaE) do {case 1: {_letterE="C"}; case 2: {_letterE="L"}; case 3: {_letterE="U"}; }; };
    case (_easting > 200000): {LOG("E2"); switch (_metaE) do {case 1: {_letterE="B"}; case 2: {_letterE="K"}; case 3: {_letterE="T"}; }; };
    case (_easting > 100000): {LOG("E1"); switch (_metaE) do {case 1: {_letterE="A"}; case 2: {_letterE="J"}; case 3: {_letterE="S"}; }; };
    default {_letterE="@"};
};
TRACE_1("",_letterE);

_northing = _northing mod 2000000;
TRACE_1("",_northing);

switch (true) do {
    case (_zone == 0): {_letterN = "N"};
    case (_northing > 1900000): {LOG("N19"); switch (_metaN) do {case 1: {_letterN = "V"}; case 2: {_letterN = "E"}; }; };
    case (_northing > 1800000): {LOG("N18"); switch (_metaN) do {case 1: {_letterN = "U"}; case 2: {_letterN = "D"}; }; };
    case (_northing > 1700000): {LOG("N17"); switch (_metaN) do {case 1: {_letterN = "T"}; case 2: {_letterN = "C"}; }; };
    case (_northing > 1600000): {LOG("N16"); switch (_metaN) do {case 1: {_letterN = "S"}; case 2: {_letterN = "B"}; }; };
    case (_northing > 1500000): {LOG("N15"); switch (_metaN) do {case 1: {_letterN = "R"}; case 2: {_letterN = "A"}; }; };
    case (_northing > 1400000): {LOG("N14"); switch (_metaN) do {case 1: {_letterN = "Q"}; case 2: {_letterN = "V"}; }; };
    case (_northing > 1300000): {LOG("N13"); switch (_metaN) do {case 1: {_letterN = "P"}; case 2: {_letterN = "U"}; }; };
    case (_northing > 1200000): {LOG("N12"); switch (_metaN) do {case 1: {_letterN = "N"}; case 2: {_letterN = "T"}; }; };
    case (_northing > 1100000): {LOG("N11"); switch (_metaN) do {case 1: {_letterN = "M"}; case 2: {_letterN = "S"}; }; };
    case (_northing > 1000000): {LOG("N10"); switch (_metaN) do {case 1: {_letterN = "L"}; case 2: {_letterN = "R"}; }; };
    case (_northing >  900000): {LOG("N09"); switch (_metaN) do {case 1: {_letterN = "K"}; case 2: {_letterN = "Q"}; }; };
    case (_northing >  800000): {LOG("N08"); switch (_metaN) do {case 1: {_letterN = "J"}; case 2: {_letterN = "P"}; }; };
    case (_northing >  700000): {LOG("N07"); switch (_metaN) do {case 1: {_letterN = "H"}; case 2: {_letterN = "N"}; }; };
    case (_northing >  600000): {LOG("N06"); switch (_metaN) do {case 1: {_letterN = "G"}; case 2: {_letterN = "M"}; }; };
    case (_northing >  500000): {LOG("N05"); switch (_metaN) do {case 1: {_letterN = "F"}; case 2: {_letterN = "L"}; }; };
    case (_northing >  400000): {LOG("N04"); switch (_metaN) do {case 1: {_letterN = "E"}; case 2: {_letterN = "K"}; }; };
    case (_northing >  300000): {LOG("N03"); switch (_metaN) do {case 1: {_letterN = "D"}; case 2: {_letterN = "J"}; }; };
    case (_northing >  200000): {LOG("N02"); switch (_metaN) do {case 1: {_letterN = "C"}; case 2: {_letterN = "H"}; }; };
    case (_northing >  100000): {LOG("N01"); switch (_metaN) do {case 1: {_letterN = "B"}; case 2: {_letterN = "G"}; }; };
    case (_northing >       0): {LOG("N00"); switch (_metaN) do {case 1: {_letterN = "A"}; case 2: {_letterN = "F"}; }; };
};
TRACE_1("",_letterN);

private _grid100km = _letterE + _letterN;
TRACE_1("",_grid100km);

if (_map == worldName) then {
    GVAR(MGRS_data) = [_GZD, _grid100km, _GZD + _grid100km];
    GVAR(mapAltitude) = _altitude;
    GVAR(mapLatitude) = _lat;
    GVAR(mapLongitude) = _long;
};

[_GZD, _grid100km, _GZD + _grid100km]
