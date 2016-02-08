#include "..\script_component.hpp"
params ["_unit", "_array"];

if (typeName (_array select 0) == "ARRAY") then {
    _array = _array call BIS_fnc_selectRandom;
};

_array params ["_gun", ["_attachment0", ""], ["_attachment1", ""], ["_attachment2", ""]];

if (_gun != primaryWeapon _unit) then {
    _unit removeWeapon (primaryWeapon _unit);
    _unit addWeapon _gun;
};

removeAllPrimaryWeaponItems _unit;
{ _unit addPrimaryWeaponItem _x; false } count [_attachment0, _attachment1, _attachment2];