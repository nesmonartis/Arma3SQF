//[_unt,_wpn,0,0,_ammo,0,_obj] spawn aa_fnc_fragmentation;
aa_fnc_fragmentation = 
{
	_wpn = _this select 1;
	_ammo = _this select 4;
	_obj = _this select 6;
	_eff = (getText (configfile >> "CfgAmmo" >> _ammo >> "CraterEffects"));
	_fc = switch _eff do {
		case "GrenadeCrater": {((floor (random 120)) + 180)};
		case "HEShellCrater": {((floor (random 180)) + 420)};
		case "ArtyShellCrater": {((floor (random 300)) + 600)};
		case "HERocketCrater": {((floor (random 110)) + 210)};
		case "MK82_Smoke": {((floor (random 130)) + 135)};
		default {0};
	};
	if !((_this select 0) hasWeapon _wpn) then {_fc = _fc * 0.3};
	//hint (_eff + "\n" + str _fc);
	if ((_fc > 0) && (!isNull _obj)) then
	{
		private "_pos";
		_time = time;
		_fps = round diag_fpsMin;
		_fpsArr = [];
		for "_n" from 0 to 32 do {_fpsArr pushBack (_fps * _n)};
		waitUntil {if !isNull _obj then {_pos = getPosASL _obj}; isNull _obj};
		_pos = _pos vectorAdd [0,0,0.1];
		//systemChat str ((_this select 0) distance _pos);  //debug
		if ((_time + 19) < time) exitWith {hint str (time - _time)};
		for "_i" from 0 to _fc do
		{
			if (_i in _fpsArr) then {sleep 0.001}; //China
			_type = "BulletBase";
			//if (_i < _fps) then {_type = "B_12Gauge_Pellets"};
			[_type,_pos] spawn 
			{
				_shp = (_this select 0) createVehicle [0,0,0]; //"B_pr","BulletBase","B_12Gauge_Slug","B_9x21_Ball","B_12Gauge_Pellets"
				_shp setPosASL (_this select 1);
				//_shp setVelocity ([(random 100 - random 100),(random 100 - random 100),(random 100 - random 100)]);
				_shp setVectorDirAndUp [[random 1 - random 1,random 1 - random 1, random 1 - random 1],[random 1 - random 1,random 1 - random 1,random 1 - random 1]];
				sleep 0.001;
				_shp setVelocityModelSpace [0,720,0];
				sleep 0.001;
				_shp setVelocity ((velocity _shp) vectorMultiply 0.4);
				sleep 0.1;
				_shp setVelocity ((velocity _shp) vectorMultiply 0.2);
			}
		}
	}
};
waitUntil {time > 0};
waitUntil //endless loop
{
	sleep 1;
	{
		sleep 0.01;
		if (local _x && isNil {_x getVariable "aa_frags"}) then 
		{
			_x setVariable ["aa_frags",true];
			sleep 0.1;
			_x addEventHandler ["FiredMan",{_this spawn aa_fnc_fragmentation}]
		}
	} count allUnits;
	false
};