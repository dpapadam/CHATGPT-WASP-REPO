/* 
	Original Author: Marty
	Name: Common_CreateMarker.sqf
	Parameters:
	0 - _markerName 		: string - correspond to the name of the marker to create.
	1 - _position			: array or position object - correspond to the coordinates of the marker position
	2 - _markerType 		: string - the marker type shape. See cfgMarkers on wiki offcial dans check the list.
	3 - _markerText 		: string - the text label that will be displayed on map.
	4 - _markerColor		: string - marker color name. See CfgMarkerColors on wiki official to check the list.
	5 - _side_who_see_marker : side object - can be east or west.
	6 - _markerNameElipse 	: string - optional parameter. It's the name of the elipse marker to be drawn on the map on top of the general marker.
	7 - _markerRadius		: number - optional parameter. correspond to the elipse radius to be draw.

	Description: This function is meant to create a marker only visible for specific side (west or east).
	    
*/
private ["_MARKER_infos","_marker_name", "_markerPosition","_markerType","_markerText","_markerColor","_side_who_see_marker","_markerNameElipse","_markerRadius"];

// Extract the value from the array to get specific infos for the marker creation :
_markerName 			= _this select 0;
_markerPosition			= _this select 1;
_markerType				= _this select 2;
_markerText				= _this select 3;
_markerColor			= _this select 4;
_side_who_see_marker 	= _this select 5;

//optional parameters
if (count _this > 6) then 
{
	_markerNameElipse 	= _this select 6;
	_markerRadius		= _this select 7;

};

// We need to create a global marker and not a local one, because it must be visible on others clients and also to clients who are not already online ! At this point the marker is still not visible and we'll decide later who can see it selectively.
_markerName = createMarker [_markerName, _markerPosition]; 

if (playerSide == _side_who_see_marker) then 
{
	// Construction of the marker : 
	_markerName setMarkerTypeLocal _markerType; // this make visible the marker at this point.
	_markerName setMarkerTextLocal _markerText;
	_markerName setMarkerColorLocal _markerColor;

	// Drawing a circle marker on the map with the corresponding radius in case the optional parameter _markerNameElipse is send when calling the create marker function.
	if (!isNil {_markerNameElipse}) then 
	{
		_markerNameElipse = createMarker [_markerNameElipse, _markerPosition];
		_markerNameElipse setMarkerShapeLocal "ELLIPSE";
		_markerNameElipse setMarkerSizeLocal [_markerRadius, _markerRadius];
		_markerNameElipse setMarkerColorLocal _markerColor; 
		_markerNameElipse setMarkerAlphaLocal 0.5; // 50% de transparancy
		_markerNameElipse setMarkerBrushLocal "Solid"; 
	};
};

_MARKER_infos =  _this ; // get the array containing all the value given during the call of the function.

missionNamespace setVariable ["MARKER_CREATION", _MARKER_infos];
publicVariable "MARKER_CREATION"; // will trigger the MARKER_CREATION addPublicVariableEventHandler 
