#include "..\dialog\defines.hpp"

private ["_additionalWidth"];
params ["_scoreArray","_dialogTitle",["_showRank",false],["_duration", -1],["_additionalArray",[]],["_additionalTitle",""],["_additionalShowRank",false]];

disableSerialization;


//add rank numbers
if (_showRank) then {
    {
        _scoreArray set [_forEachIndex, if (_forEachIndex == 0) then {["RANK"] + _x} else {[_forEachIndex] + _x}];
    } forEach _scoreArray;
};
if (_additionalShowRank) then {
    {
        _additionalArray set [_forEachIndex, if (_forEachIndex == 0) then {["RANK"] + _x} else {[_forEachIndex] + _x}];
    } forEach _additionalArray;
};


//create dialog
createDialog "grad_scoreboard";
_display = findDisplay grad_scoreboard_DIALOG;
_titleCtrl = _display displayCtrl grad_scoreboard_TITLEBAR;
_listnboxCtrl = _display displayCtrl grad_scoreboard_MAINLISTNBOX;
_listnboxTitleCtrl = _display displayCtrl grad_scoreboard_MAINLISTNBOXTITLE;
_additionalTitleCtrl = _display displayCtrl grad_scoreboard_MYSTATSTITLE;
_additionalListnboxCtrl = _display displayCtrl grad_scoreboard_MYSTATSLISTNBOX;
_additionalListnboxTitleCtrl = _display displayCtrl grad_scoreboard_MYSTATSLISTNBOXTITLE;
_additionalBackground = _display displayCtrl grad_scoreboard_MYSTATSBACKGROUND;
_additionalTitleBackground = _display displayCtrl grad_scoreboard_MSTITLEBACKGROUND;


//disable ESC key
if (_duration > 0) then {
    [_display,true] call grad_scoreboard_fnc_disableESC;
    [{
        [_display, false] call grad_scoreboard_fnc_disableESC;
        _this closeDisplay 2;
    }, _display, _duration] call CBA_fnc_waitAndExecute;
};


//fill main dialog
_titleCtrl ctrlSetText (toUpper _dialogTitle);
_mainWidth = [_scoreArray, _listnboxCtrl, _listnboxTitleCtrl] call grad_scoreboard_fnc_setColumnsPos;
[_scoreArray, _listnboxCtrl, _listnboxTitleCtrl] call grad_scoreboard_fnc_fillListNBox;
[_scoreArray, _listnboxCtrl] call grad_scoreboard_fnc_selectOwnName;


//fill additional dialog
if (count _additionalArray > 0) then {
    _additionalTitleCtrl ctrlSetText (toUpper _additionalTitle);
    _additionalWidth = [_additionalArray, _additionalListnboxCtrl, _additionalListnboxTitleCtrl] call grad_scoreboard_fnc_setColumnsPos;
    [_additionalArray, _additionalListnboxCtrl, _additionalListnboxTitleCtrl] call grad_scoreboard_fnc_fillListNBox;
    [_additionalTitleCtrl,_additionalListnboxCtrl,_additionalListnboxTitleCtrl,_additionalBackground,_additionalTitleBackground] call grad_scoreboard_fnc_ctrlShowEach;
} else {
    _additionalWidth = 0;
};


//set dialog width
[_mainWidth max _additionalWidth] call grad_scoreboard_fnc_setWidth;
