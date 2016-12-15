//IDCs =========================================================================
#define grad_scoreboard_DIALOG              31000
#define grad_scoreboard_TITLEBAR            31001
#define grad_scoreboard_MAINBACKGROUND      31002
#define grad_scoreboard_SBTITLEBACKGROUND   31003
#define grad_scoreboard_MYSTATSTITLE        31004
#define grad_scoreboard_MYSTATSBACKGROUND   31005

#define grad_scoreboard_LISTNBOXTITLE       31100
#define grad_scoreboard_LISTNBOX            31101


//COORDS AND DIMS ==============================================================
#define grad_scoreboard_rowH (0.025 * Y_SCALE)




#define lb_cellW (0.075 * X_SCALE)
#define lb_cellH (0.025 * Y_SCALE)

#define lb_elementPaddingY (0.005 * Y_SCALE)

#define lb_cellPaddingX (0.01 * X_SCALE)
#define lb_cellPaddingY (0.01 * Y_SCALE)

#define lb_numberOfRows 10
#define lb_numberOfColumns 10

#define lb_titleH (0.025 * Y_SCALE)
#define lb_mainW ((lb_numberOfColumns * lb_cellW) + ((lb_numberOfColumns+1) * lb_cellPaddingX))
#define lb_mainH (lb_cellPaddingY + lb_titleH + lb_cellPaddingY + ((lb_cellH + lb_cellPaddingY) * lb_numberOfRows))
#define lb_mystatsH (lb_cellPaddingY + lb_titleH + lb_cellPaddingY + lb_cellH + lb_cellPaddingY)

#define lb_mainX CENTER(1, lb_mainW)
#define lb_titleY CENTER(Y_SCALE, lb_titleH + lb_mainH + lb_titleH + lb_mystatsH)
#define lb_mainY (lb_titleY + lb_titleH + lb_elementPaddingY)

#define lb_mystatsTitleY (lb_mainY + lb_mainH + 2*lb_elementPaddingY)
#define lb_mystatsY (lb_mystatsTitleY + lb_titleH + lb_elementPaddingY)
