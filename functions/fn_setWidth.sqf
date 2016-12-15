#include "..\dialog\ui_toolkit.hpp"
#include "..\dialog\defines.hpp"

params ["_totalWidth"];
_width = (_totalWidth/150) max 1;

_fnc_setPos = {
    params ["_ctrl", "_w"];
    _pos = ctrlPosition _ctrl;
    _pos set [0,CENTER(1,_w)];
    _pos set [2,_w];
    _ctrl ctrlSetPosition _pos;
    _ctrl ctrlCommit 0;
};

_display = findDisplay grad_scoreboard_DIALOG;
if (isNull _display) exitWith {};

[_display displayCtrl grad_scoreboard_TITLEBAR, _width] call _fnc_setPos;
[_display displayCtrl grad_scoreboard_MAINBACKGROUND, _width] call _fnc_setPos;
[_display displayCtrl grad_scoreboard_SBTITLEBACKGROUND, _width] call _fnc_setPos;
[_display displayCtrl grad_scoreboard_MYSTATSTITLE, _width] call _fnc_setPos;
[_display displayCtrl grad_scoreboard_MYSTATSBACKGROUND, _width] call _fnc_setPos;

[_display displayCtrl grad_scoreboard_LISTNBOXTITLE, _width] call _fnc_setPos;
[_display displayCtrl grad_scoreboard_LISTNBOX, _width] call _fnc_setPos;
