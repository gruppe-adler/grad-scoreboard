#include "node_modules\grad-scoreboard\dialog\defines.hpp"

params ["_scoreArray","_dialogTitle","_showRank"];

disableSerialization;

//add rank numbers
if (_showRank) then {
    {
        _scoreArray set [_forEachIndex, if (_forEachIndex == 0) then {["RANK"] + _x} else {[_forEachIndex] + _x}];
    } forEach _scoreArray;
};

//create dialog
createDialog "grad_scoreboard";
_display = findDisplay grad_scoreboard_DIALOG;
_titleCtrl = _display displayCtrl grad_scoreboard_TITLEBAR;
_listnboxCtrl = _display displayCtrl grad_scoreboard_LISTNBOX;
_listnboxTitleCtrl = _display displayCtrl grad_scoreboard_LISTNBOXTITLE;


//fill dialog
_titleCtrl ctrlSetText (toUpper _dialogTitle);
_totalWidth = [_scoreArray, _listnboxCtrl, _listnboxTitleCtrl] call grad_scoreboard_fnc_setColumnsPos;
[_totalWidth] call grad_scoreboard_fnc_setWidth;
[_scoreArray, _listnboxCtrl, _listnboxTitleCtrl] call grad_scoreboard_fnc_fillListNBox;
[_scoreArray, _listnboxCtrl] call grad_scoreboard_fnc_selectOwnName;
