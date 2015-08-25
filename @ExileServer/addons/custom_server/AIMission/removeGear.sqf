// remove all gear from a unit
// Last updated 8/2/15

private["_unit"];
_unit = _this select 0;

removeVest _unit;
//removeHeadgear _this;
removeGoggles _unit;
removeAllItems _unit;
removeAllWeapons _unit;
removeBackpackGlobal _unit;
