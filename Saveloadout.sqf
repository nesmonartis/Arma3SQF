	_weapons=weapons player;
	_Vest=Vest player;
	_Uniform=Uniform player;
	_items=items player;
	_magazines=magazines player;
	_backpack=Backpack player;
	_helmet=headgear player;
	_goggles=Goggles player;
	_WepAt=primaryWeaponItems player;
	_handAt=handgunItems player;
	_backpackUnit = unitBackpack player;
	

	
	_InventoryArray=[_weapons,_Vest,_Uniform,_Magazines,_items,_backpack,_helmet,_goggles,_WepAt,_handAt];
profileNamespace setVariable["InventoryArray",_InventoryArray];
saveProfileNamespace;		
_GHtext="<t shadow='2'><t size='1.5'>--Loadout Saved--                                          </t></t>";

hint parseText _ghText;