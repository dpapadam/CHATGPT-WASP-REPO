/* 
	Original Author: 
	Contributors : Marty
	Name: radzone.sqf
	Parameters:
	  0 - _target	: object - Used as a coordinates location for impact.
	Description:
	    This script is run on server side. It's generate damage to objects within the radiation range and broadcast 
		a public variable when object is a player in order to play a radiation sound effect on client side.
*/
Private ['_target','_z'];

_target = _this select 0;
[_target] Spawn {
	Private ["_radiation_range","_array","_target"];
	_radiation_range = missionNamespace getVariable "ICBM_RADIATION_RADIUS";
	_target = _this select 0;
	for [{_z = 0},{_z < 100},{_z = _z + 1}] do {
		_array = _target nearEntities [["Man","Car","Motorcycle","Tank","Ship","Air","StaticWeapon"], _radiation_range];
		{
			_x setDammage (getDammage _x +  0.03);
			{_x setDammage  (getDammage _x + 0.05)} forEach crew _x;

			//Playing radiation sound on client when object is a player :
			if (isPlayer _x) then 
			{
				//Broadcast the player radiated to clients to play radiation sound effect. Sounds must be played on client side and not on server side (here we are on server side, that's why we use public variable event handler).
				_PLAYER_Radiated = _x;
				missionNamespace setVariable ["PLAYER_RADIATED", _PLAYER_Radiated];
				publicVariable "PLAYER_RADIATED"; // will trigger the PLAYER_RADIATED addPublicVariableEventHandler.
			};
			
		} forEach _array;
		sleep (5 + random 5);
	};
	deleteVehicle _target;
};