/* 
	Original Author: Marty
	Name: Common_UpdateMarker.sqf
	Parameters:
	0 - _markerObject 	: object - corresponds to the object we want to track the position.
	1 - _markerName		: string - correspond to the name of the marker we want to update.
	2 - _markerType		: string - the marker type shape. See cfgMarkers on wiki offcial dans check the list.
	3 - _markerText		: string - the text label that will be displayed on map.
	4 - _markerColor	: string - marker color name. See CfgMarkerColors on wiki official to check the list.
	
	Description: This function is meant to update the marker position on map attached to a moving object (car, wreck, etc...)
	    
*/

_markerObject 	= _this select 0;
_markerName		= _this select 1;
_markerType 	= _this select 2;
_markerText		= _this select 3;
_markerColor 	= _this select 4;

_markerName setMarkerTypeLocal _markerType; 
_markerName setMarkerTextLocal _markerText;
_markerName setMarkerColorLocal _markerColor;
_markerPosition = getPos _markerObject ;
//_markerName setMarkerPos _markerPosition ;
_markerName setMarkerPosLocal _markerPosition ;