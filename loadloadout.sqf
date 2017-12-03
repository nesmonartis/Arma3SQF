
_InventoryArray=ProfileNamespace getVariable "InventoryArray";


_weapons=_InventoryArray select 0;
_Vest=_InventoryArray select 1;
_Uniform=_InventoryArray select 2;
_Magazines=_InventoryArray select 3;
_Items=_InventoryArray select 4;
_Backpack=_InventoryArray select 5;
_helmet=_InventoryArray select 6;
_goggles=_InventoryArray select 7;
_WepAt=_InventoryArray select 8;
_handAt=_InventoryArray select 9;
_Backpackweap=_InventoryArray select 10;

removeBackpack player;
if(_backpack!="")then{
player addBackpack _Backpack};
removeAllWeapons player;
removeHeadgear player;
removeGoggles player;
removeVest player;
removeUniform player;
removeAllItems player;
_CurBackpack= unitBackpack player;

{player addWeapon _x }forEach _weapons;
player addVest _Vest;
player forceadduniform _Uniform;
{player addMagazine _x }forEach _magazines;
{player addItem _x}forEach _items;
{
	if(_x != "" )then{
	player addPrimaryWeaponItem _x
	};
}forEach _WepAt;
{
	if(_x != "" )then{
	player addHandgunItem _x
	};
}forEach _handAt;
player addheadgear _helmet;
player addgoggles _goggles;
player setVehicleAmmo 1;
player selectWeapon primaryWeapon player;
reload player;
player enableFatigue false;
