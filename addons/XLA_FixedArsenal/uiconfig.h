class RscActivePicture;
class RscButton;
class RscButtonMenu;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscEdit;
class RscFrame;
class RscListBox;
class RscListNBox;
class RscMessageBox;
class RscProgress;
class RscText;
class RscTitle;

class RscButtonFixedArsenal: RscButtonMenu
{
 animTextureNormal = "#(argb,8,8,3)color(1,1,1,0.8)";
 animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1.0)";
 animTextureOver = "#(argb,8,8,3)color(1,1,1,1.0)";
 animTextureFocused = "#(argb,8,8,3)color(1,1,1,1.0)";
 animTexturePressed = "#(argb,8,8,3)color(1,1,1,1.0)";
 animTextureDefault = "#(argb,8,8,3)color(1,1,1,0.8)";
 color[] = {1,1,1,1};
 color2[] = {1,1,1,1};
 colorFocused[] = {1,1,1,1};
 colorDisabled[] = {1,1,1,1};
 colorBackground[] = {0,0,0,1};
 colorBackground2[] = {0,0,0,1};
 colorBackgroundFocused[] = {0,0,0,1};
 shadow = 0;
 style = 2;
 class ShortcutPos
 {
  left = 0;
  top = 0;
  w = 0;
  h = 0;
 };
 class TextPos
 {
  left = 0;
  top = 0;
  right = 0;
  bottom = 0;
 };
};

class RscDisplayFixedArsenal
{
 idd = -1;
 enableSimulation = 1;
 scriptName = "RscDisplayFixedArsenal";
 scriptPath = "FixedArsenal";
 onLoad = "[""onLoad"",_this,""RscDisplayFixedArsenal"",'GUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
 onUnload = "[""onUnload"",_this,""RscDisplayFixedArsenal"",'GUI'] call  (uinamespace getvariable 'BIS_fnc_initDisplay')";
 icon = "\A3\Ui_f\data\Logos\a_64_ca.paa";
 logo = "\A3\Ui_f\data\Logos\arsenal_1024_ca.paa";
 class ControlsBackground
 {
  class BlackLeft: RscText
  {
   colorBackground[] = {0,0,0,1};
   x = "safezoneXAbs";
   y = "safezoneY";
   w = "safezoneXAbs - safezoneX";
   h = "safezoneH";
  };
  class BlackRight: BlackLeft
  {
   x = "safezoneX + safezoneW";
  };
  class MouseArea: RscText
  {
   idc = 899;
   style = 16;
   x = "safezoneX";
   y = "safezoneY";
   w = "safezoneW";
   h = "safezoneH";
  };
 };
 class Controls
 {
  class ArrowLeft: RscButton
  {
   idc = 992;
   text = "-";
   x = -1;
   y = -1;
   w = "1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
  };
  class ArrowRight: ArrowLeft
  {
   idc = 993;
   text = "+";
   x = -1;
   y = -1;
   w = "1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
  };
  class BackgroundLeft: RscText
  {
   fade = 1;
   idc = 994;
   x = "safezoneX + (1 + 1.5 *  1) *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0.5};
  };
  class BackgroundRight: BackgroundLeft
  {
   idc = 995;
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
  };
  class LineIcon: RscFrame
  {
   fade = 1;
   idc = 1803;
   x = -1;
   y = -1;
   w = 0;
   h = 0;
   colorText[] = {0,0,0,1};
  };
  class LineTabLeft: RscText
  {
   fade = 1;
   idc = 1804;
   x = -1;
   y = -1;
   w = "0.6 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,1};
  };
  class LineTabLeftSelected: RscText
  {
   idc = 1805;
   x = "safezoneX";
   y = -1;
   w = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0.8};
  };
  class LineTabRight: LineTabLeft
  {
   idc = 1806;
  };
  class Tabs: RscFrame
  {
   fade = 1;
   idc = 1800;
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "1.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "40 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorText[] = {0,0,0,0};
  };
  class FrameLeft: RscFrame
  {
   fade = 1;
   idc = 1801;
   x = "safezoneX + (1 + 1.5 *  1) *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorText[] = {0,0,0,1};
  };
  class FrameRight: FrameLeft
  {
   fade = 1;
   idc = 1802;
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
  };
  class Load: RscProgress
  {
   idc = 990; //same as in vanilla arsenal
   texture = "#(argb,8,8,3)color(1,1,1,1)";
   colorBar[] = {1,1,1,1};
    colorFrame[] = {0,0,0,0.5};
    x = "safezoneX + 18 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
    y = "safezoneY + 0.5 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    w = "safezoneW - 36 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
  };
  class LoadText: RscText
  {
    shadow = 0;
    colorShadow[] = {1,1,1,1.0};
    idc = 997;
    x = "safezoneX + 18 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
    y = "safezoneY + 0.5 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    w = "safezoneW - 36 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
    h = "1 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    colorText[] = {0,0,0,1};
    colorBackground[] = {1,1,1,0.1};
    sizeEx = "0.8 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

  };
  class LoadCargo: Load
  {
   fade = 1;
   idc = 991;
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 15.5 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
  };
  class Message: RscText
  {
   fade = 1;
   idc = 996;
   x = "safezoneX + (0.5 * safezoneW) - (0.5 * ((safezoneW - 36 *       (     ((safezoneW / safezoneH) min 1.2) / 40)) max 0.4))";
   y = "21.5 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +      (safezoneY + safezoneH -      (     ((safezoneW / safezoneH) min 1.2) / 1.2))";
   w = "((safezoneW - 36 *      (     ((safezoneW / safezoneH) min 1.2) / 40)) max 0.4)";
   h = "1.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0.7};
   style = 2;
   shadow = 0;
   text = "";
   sizeEx = "0.8 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
  };
  class ControlBar: RscControlsGroupNoScrollbars
  {
   w = "safezoneW";
   idc = 44046;
   x = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40) +       (safezoneX)";
   y = "23.5 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +      (safezoneY + safezoneH -      (     ((safezoneW / safezoneH) min 1.2) / 1.2))";
   h = "1 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   class controls
   {
    class ButtonClose: RscButtonMenu
    {
     idc = 44448;
     text = "$STR_DISP_CLOSE";
     x = "0 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "0 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "((safezoneW - 1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)) * 0.2) - 0.1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "1 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     shortcuts[] = {"0x00050000 + 1"};
     tooltip = "$STR_A3_RscDisplayArsenal_ButtonClose_tooltip";
    };
    class ButtonInterface: ButtonClose
    {
     idc = 44151;
     text = "$STR_CA_HIDE";
     x = "2 *   ((safezoneW - 1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)) * 0.1)";
     w = "((safezoneW - 1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)) * 0.1) - 0.1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     tooltip = "$STR_A3_RscDisplayArsenal_ButtonInterface_tooltip";
    };
    class ButtonRandom: ButtonInterface
    {
     idc = 44150;
     text = "$STR_A3_RscDisplayArsenal_ButtonRandom";
     x = "3 *   ((safezoneW - 1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)) * 0.1)";
     tooltip = "$STR_A3_RscDisplayArsenal_ButtonRandom_tooltip";
    };
    class ButtonSave: ButtonInterface
    {
     idc = 44146;
     text = "$STR_DISP_INT_SAVE";
     x = "4 *   ((safezoneW - 1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)) * 0.1)";
     tooltip = "$STR_A3_RscDisplayArsenal_ButtonSave_tooltip";
    };
    class ButtonLoad: ButtonInterface
    {
     idc = 44147;
     text = "$STR_DISP_INT_LOAD";
     x = "5 *   ((safezoneW - 1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)) * 0.1)";
     tooltip = "$STR_A3_RscDisplayArsenal_ButtonLoad_tooltip";
    };
    class ButtonExport: ButtonInterface
    {
     idc = 44148;
     text = "$STR_A3_RscDisplayArsenal_ButtonExport";
     x = "6 *   ((safezoneW - 1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)) * 0.1)";
     tooltip = "$STR_A3_RscDisplayArsenal_ButtonExport_tooltip";
    };
    class ButtonImport: ButtonInterface
    {
     idc = 44149;
     text = "$STR_A3_RscDisplayArsenal_ButtonImport";
     x = "7 *   ((safezoneW - 1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)) * 0.1)";
     tooltip = "$STR_A3_RscDisplayArsenal_ButtonImport_tooltip";
    };
    class ButtonOK: ButtonClose
    {
     idc = 44346;
     text = "$STR_A3_RscDisplayArsenal_ButtonOK";
     x = "8 *   ((safezoneW - 1 *       (     ((safezoneW / safezoneH) min 1.2) / 40)) * 0.1)";
     tooltip = "$STR_A3_RscDisplayArsenal_ButtonOK_tooltip";
     shortcuts[] = {"0x00050000 + 0",28,57,156};
    };
   };
  };
  class Info: RscControlsGroup
  {
   x = "safezoneX + safezoneW - 20.1 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + safezoneH - 4.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   fade = 1;
   idc = 25815;
   w = "17.6 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "3 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   class controls
   {
    class InfoBackground: RscText
    {
     idc = 24515;
     x = "2.6 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "0 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorBackground[] = {0,0,0,1};
    };
    class InfoName: RscText
    {
     idc = 24516;
     x = "2.6 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "0 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "1.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     sizeEx = "1.5 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class InfoAuthor: RscText
    {
     idc = 24517;
     x = "2.6 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "1 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "1.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorText[] = {1,1,1,0.5};
     sizeEx = "0.8 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class DLCBackground: RscText
    {
     fade = 1;
     idc = 24518;
     x = "0 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "0 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorBackground[] = {0,0,0,0.5};
    };
    class DLCIcon: RscActivePicture
    {
     enabled = 0;
     fade = 1;
     color[] = {1,1,1,1};
     colorActive[] = {1,1,1,1};
     idc = 24715;
     text = "#(argb,8,8,3)color(1,1,1,1)";
     x = "0 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "0 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
   };
  };
  class Stats: RscControlsGroupNoScrollbars
  {
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + safezoneH - 10.6 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   fade = 1;
   enable = 0;
   idc = 28644;
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "6 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   class controls
   {
    class StatsBackground: RscText
    {
     idc = 27347;
     x = "0 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "0 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "6 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorBackground[] = {0,0,0,0.5};
    };
    class Stat1: RscProgress
    {
     colorBar[] = {1,1,1,1.0};
     colorFrame[] = {0,0,0,0};
     idc = 27348;
     x = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "14 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "0.9 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class Stat2: Stat1
    {
     idc = 27349;
     x = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "1.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "14 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "0.9 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class Stat3: Stat1
    {
     idc = 27350;
     x = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "14 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "0.9 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class Stat4: Stat1
    {
     idc = 27351;
     x = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "3.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "14 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "0.9 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class Stat5: Stat1
    {
     idc = 27352;
     x = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "4.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "14 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "0.9 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class StatText1: RscText
    {
     shadow = 0;
     colorShadow[] = {1,1,1,1.0};
     idc = 27353;
     x = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "14 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "0.9 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorText[] = {0,0,0,1};
     colorBackground[] = {1,1,1,0.1};
     sizeEx = "0.8 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class StatText2: StatText1
    {
     idc = 27354;
     x = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "1.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "14 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "0.9 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorText[] = {0,0,0,1};
     colorBackground[] = {1,1,1,0.1};
     sizeEx = "0.8 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class StatText3: StatText1
    {
     idc = 27355;
     x = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "14 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "0.9 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorText[] = {0,0,0,1};
     colorBackground[] = {1,1,1,0.1};
     sizeEx = "0.8 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class StatText4: StatText1
    {
     idc = 27356;
     x = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "3.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "14 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "0.9 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorText[] = {0,0,0,1};
     colorBackground[] = {1,1,1,0.1};
     sizeEx = "0.8 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class StatText5: StatText1
    {
     idc = 27357;
     x = "0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "4.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "14 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "0.9 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorText[] = {0,0,0,1};
     colorBackground[] = {1,1,1,0.1};
     sizeEx = "0.8 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
   };
  };
  class MouseBlock: RscText
  {
   idc = 898;
   style = 16;
   x = "safezoneX";
   y = "safezoneY";
   w = "safezoneW";
   h = "safezoneH";
  };
  class Template: RscControlsGroup
  {
   fade = 1;
   idc = 35919;
   x = "10 *          (     ((safezoneW / safezoneH) min 1.2) / 40) +     (safezoneX + (safezoneW -           ((safezoneW / safezoneH) min 1.2))/2)";
   y = "0.9 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +    (safezoneY + (safezoneH -           (     ((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
   w = "20 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "22.2 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   class controls
   {
    class Title: RscTitle
    {
     style = 0;
     colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
     idc = 34619;
     text = "";
     x = "0 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "0 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "20 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "1 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class MainBackground: RscText
    {
     idc = 34622;
     x = "0 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "1.1 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "20 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "20 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorBackground[] = {0,0,0,0.8};
    };
    class Column1: RscText
    {
     idc = 34620;
     x = "0.5 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "1.6 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "19 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "17.5 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorBackground[] = {1,1,1,0.2};
    };
    class Column2: RscText
    {
     idc = 34623;
     x = "9.05 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "1.6 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "1.9 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "17.5 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorBackground[] = {1,1,1,0.1};
    };
    class Column3: RscText
    {
     idc = 34624;
     x = "12.85 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "1.6 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "1.9 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "17.5 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorBackground[] = {1,1,1,0.1};
    };
    class Column4: RscText
    {
     idc = 34625;
     x = "15.7 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "1.6 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "0.95 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "17.5 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorBackground[] = {1,1,1,0.1};
    };
    class Column5: RscText
    {
     idc = 34626;
     x = "17.6 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "1.6 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "0.95 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "17.5 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorBackground[] = {1,1,1,0.1};
    };
    class TextName: RscText
    {
     style = 1;
     idc = 34621;
     text = "$STR_DISP_GAME_NAME";
     x = "0.5 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "19.6 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "5.5 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "1 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     colorBackground[] = {0,0,0,0.2};
     sizeEx = "0.8 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class EditName: RscEdit
    {
     idc = 35020;
     x = "6 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "19.6 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "13.5 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "1 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     sizeEx = "0.8 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class ValueName: RscListNBox
    {
     columns[] = {0.0,0.45,0.55,0.65,0.75,0.8,0.85,0.9,0.95};
     idc = 35119;
     x = "0.5 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "1.6 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "19 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "17.5 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     sizeEx = "0.8 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class ButtonOK: RscButtonMenu
    {
     idc = 36019;
     text = "$STR_DISP_OK";
     x = "15 *          (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "21.2 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "5 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "1 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class ButtonCancel: RscButtonMenu
    {
     idc = 36020;
     text = "$STR_DISP_CANCEL";
     x = "0 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "21.2 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "5 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "1 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
    class ButtonDelete: RscButtonMenu
    {
     idc = 36021;
     text = "$STR_DISP_DELETE";
     x = "9.9 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     y = "21.2 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
     w = "5 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
     h = "1 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    };
   };
  };
  class MessageBox: RscMessageBox{};
  class TabPrimaryWeapon: RscButtonFixedArsenal
  {
   idc = "930 +             0";
   idcx = 930;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 0 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_PrimaryWeapon";
  };
  class IconPrimaryWeapon: TabPrimaryWeapon
  {
   idc = "900 +             0";
   idcx = 900;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListPrimaryWeapon: RscListBox
  {
   idc = "960 +           0";
   idcx = 960;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabSecondaryWeapon: RscButtonFixedArsenal
  {
   idc = "930 +         1";
   idcx = 931;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 1.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_SecondaryWeapon";
  };
  class IconSecondaryWeapon: TabSecondaryWeapon
  {
   idc = "900 +         1";
   idcx = 901;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListSecondaryWeapon: RscListBox
  {
   idc = "960 +       1";
   idcx = 961;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabHandgun: RscButtonFixedArsenal
  {
   idc = "930 +             2";
   idcx = 932;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 3 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Handgun";
  };
  class IconHandgun: TabHandgun
  {
   idc = "900 +             2";
   idcx = 902;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListHandgun: RscListBox
  {
   idc = "960 +           2";
   idcx = 962;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabUniform: RscButtonFixedArsenal
  {
   idc = "930 +             3";
   idcx = 933;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Uniform_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 4.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Uniform";
  };
  class IconUniform: TabUniform
  {
   idc = "900 +             3";
   idcx = 903;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListUniform: RscListBox
  {
   idc = "960 +           3";
   idcx = 963;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabVest: RscButtonFixedArsenal
  {
   idc = "930 +                 4";
   idcx = 934;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Vest_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 6 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Vest";
  };
  class IconVest: TabVest
  {
   idc = "900 +                 4";
   idcx = 904;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListVest: RscListBox
  {
   idc = "960 +               4";
   idcx = 964;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabBackpack: RscButtonFixedArsenal
  {
   idc = "930 +             5";
   idcx = 935;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Backpack_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 7.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Backpack";
  };
  class IconBackpack: TabBackpack
  {
   idc = "900 +             5";
   idcx = 905;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListBackpack: RscListBox
  {
   idc = "960 +           5";
   idcx = 965;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabHeadgear: RscButtonFixedArsenal
  {
   idc = "930 +             6";
   idcx = 936;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Headgear_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 9 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Headgear";
  };
  class IconHeadgear: TabHeadgear
  {
   idc = "900 +             6";
   idcx = 906;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListHeadgear: RscListBox
  {
   idc = "960 +           6";
   idcx = 966;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabGoggles: RscButtonFixedArsenal
  {
   idc = "930 +             7";
   idcx = 937;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Goggles_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 10.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Goggles";
  };
  class IconGoggles: TabGoggles
  {
   idc = "900 +             7";
   idcx = 907;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListGoggles: RscListBox
  {
   idc = "960 +           7";
   idcx = 967;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabNVGs: RscButtonFixedArsenal
  {
   idc = "930 +                 8";
   idcx = 938;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\NVGs_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 12 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_NVGs";
  };
  class IconNVGs: TabNVGs
  {
   idc = "900 +                 8";
   idcx = 908;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListNVGs: RscListBox
  {
   idc = "960 +               8";
   idcx = 968;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabBinoculars: RscButtonFixedArsenal
  {
   idc = "930 +             9";
   idcx = 939;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Binoculars_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 13.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Binoculars";
  };
  class IconBinoculars: TabBinoculars
  {
   idc = "900 +             9";
   idcx = 909;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListBinoculars: RscListBox
  {
   idc = "960 +           9";
   idcx = 969;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabMap: RscButtonFixedArsenal
  {
   idc = "930 +                 10";
   idcx = 940;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Map_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 15 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Map";
  };
  class IconMap: TabMap
  {
   idc = "900 +                 10";
   idcx = 910;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListMap: RscListBox
  {
   idc = "960 +               10";
   idcx = 970;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabGPS: RscButtonFixedArsenal
  {
   idc = "930 +                 11";
   idcx = 941;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\GPS_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 16.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_GPS";
  };
  class IconGPS: TabGPS
  {
   idc = "900 +                 11";
   idcx = 911;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListGPS: RscListBox
  {
   idc = "960 +               11";
   idcx = 971;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabRadio: RscButtonFixedArsenal
  {
   idc = "930 +                 12";
   idcx = 942;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Radio_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 18 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Radio";
  };
  class IconRadio: TabRadio
  {
   idc = "900 +                 12";
   idcx = 912;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListRadio: RscListBox
  {
   idc = "960 +               12";
   idcx = 972;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabCompass: RscButtonFixedArsenal
  {
   idc = "930 +             13";
   idcx = 943;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Compass_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 19.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Compass";
  };
  class IconCompass: TabCompass
  {
   idc = "900 +             13";
   idcx = 913;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListCompass: RscListBox
  {
   idc = "960 +           13";
   idcx = 973;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabWatch: RscButtonFixedArsenal
  {
   idc = "930 +                 14";
   idcx = 944;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Watch_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 21 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Watch";
  };
  class IconWatch: TabWatch
  {
   idc = "900 +                 14";
   idcx = 914;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListWatch: RscListBox
  {
   idc = "960 +               14";
   idcx = 974;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabFace: RscButtonFixedArsenal
  {
   idc = "930 +                 15";
   idcx = 945;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Face_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 22.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Face";
  };
  class IconFace: TabFace
  {
   idc = "900 +                 15";
   idcx = 915;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListFace: RscListBox
  {
   idc = "960 +               15";
   idcx = 975;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabVoice: RscButtonFixedArsenal
  {
   idc = "930 +                 16";
   idcx = 946;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Voice_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 24 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Voice";
  };
  class IconVoice: TabVoice
  {
   idc = "900 +                 16";
   idcx = 916;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListVoice: RscListBox
  {
   idc = "960 +               16";
   idcx = 976;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabInsignia: RscButtonFixedArsenal
  {
   idc = "930 +             17";
   idcx = 947;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Insignia_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + 0.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 25.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_Insignia";
  };
  class IconInsignia: TabInsignia
  {
   idc = "900 +             17";
   idcx = 917;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListInsignia: RscListBox
  {
   idc = "960 +           17";
   idcx = 977;
   x = "safezoneX + 2.5 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "safezoneH - 2.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabItemOptic: RscButtonFixedArsenal
  {
   idc = "930 +             18";
   idcx = 948;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + safezoneW - 2 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 0 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_ItemOptic";
  };
  class IconItemOptic: TabItemOptic
  {
   idc = "900 +             18";
   idcx = 918;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListItemOptic: RscListBox
  {
   idc = "960 +           18";
   idcx = 978;
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "15 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabItemAcc: RscButtonFixedArsenal
  {
   idc = "930 +             19";
   idcx = 949;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemAcc_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + safezoneW - 2 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 1.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_ItemAcc";
  };
  class IconItemAcc: TabItemAcc
  {
   idc = "900 +             19";
   idcx = 919;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListItemAcc: RscListBox
  {
   idc = "960 +           19";
   idcx = 979;
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "15 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabItemMuzzle: RscButtonFixedArsenal
  {
   idc = "930 +             20";
   idcx = 950;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemMuzzle_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + safezoneW - 2 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 3 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_ItemMuzzle";
  };
  class IconItemMuzzle: TabItemMuzzle
  {
   idc = "900 +             20";
   idcx = 920;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListItemMuzzle: RscListBox
  {
   idc = "960 +           20";
   idcx = 980;
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "15 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabItemBipod: RscButtonFixedArsenal
  {
   idc = "930 +             25";
   idcx = 955;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemBipod_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + safezoneW - 2 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 4.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_ItemBipod";
  };
  class IconItemBipod: TabItemBipod
  {
   idc = "900 +             25";
   idcx = 925;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListItemBipod: RscListBox
  {
   idc = "960 +           25";
   idcx = 985;
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "15 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   colorBackground[] = {0,0,0,0};
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorPictureSelected[] = {1,1,1,1};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
   colorPictureRightSelected[] = {1,1,1,1};
  };
  class TabCargoMag: RscButtonFixedArsenal
  {
   idc = "930 +             21";
   idcx = 951;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMag_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + safezoneW - 2 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 0 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_CargoMag";
  };
  class IconCargoMag: TabCargoMag
  {
   idc = "900 +             21";
   idcx = 921;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListCargoMag: RscListNBox
  {
   idc = "960 +           21";
   idcx = 981;
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "15 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   columns[] = {0.07,0.15,0.75};
   drawSideArrows = 1;
   idcLeft = 992;
   idcRight = 993;
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
  };
  class TabCargoThrow: RscButtonFixedArsenal
  {
   idc = "930 +             22";
   idcx = 952;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoThrow_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + safezoneW - 2 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 1.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_CargoThrow";
  };
  class IconCargoThrow: TabCargoThrow
  {
   idc = "900 +             22";
   idcx = 922;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListCargoThrow: RscListNBox
  {
   idc = "960 +           22";
   idcx = 982;
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "15 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   columns[] = {0.07,0.15,0.75};
   drawSideArrows = 1;
   idcLeft = 992;
   idcRight = 993;
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
  };
  class TabCargoPut: RscButtonFixedArsenal
  {
   idc = "930 +             23";
   idcx = 953;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoPut_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + safezoneW - 2 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 3 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_CargoPut";
  };
  class IconCargoPut: TabCargoPut
  {
   idc = "900 +             23";
   idcx = 923;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListCargoPut: RscListNBox
  {
   idc = "960 +           23";
   idcx = 983;
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "15 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   columns[] = {0.07,0.15,0.75};
   drawSideArrows = 1;
   idcLeft = 992;
   idcRight = 993;
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
  };
  class TabCargoMisc: RscButtonFixedArsenal
  {
   idc = "930 +             24";
   idcx = 954;
   text = "<img image='\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa' align='center' size='1.2' />";
   x = "safezoneX + safezoneW - 2 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 * 0.04 + 4.5 * 0.04";
   w = "1.4 *       (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "1.4 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   tooltip = "$STR_A3_RscDisplayArsenal_tab_CargoMisc";
  };
  class IconCargoMisc: TabCargoMisc
  {
   idc = "900 +             24";
   idcx = 924;
   x = -1;
   y = -1;
   animTextureNormal = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDisabled = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureOver = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureFocused = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTexturePressed = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   animTextureDefault = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\icon_ca.paa";
   color[] = {1,1,1,0.7};
  };
  class ListCargoMisc: RscListNBox
  {
   idc = "960 +           24";
   idcx = 984;
   x = "safezoneX + safezoneW - 17.5 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   y = "safezoneY + 0.5 *       (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   w = "15 *      (     ((safezoneW / safezoneH) min 1.2) / 40)";
   h = "15 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   sizeEx = "1.4 *      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
   columns[] = {0.07,0.15,0.75};
   drawSideArrows = 1;
   idcLeft = 992;
   idcRight = 993;
   colorSelectBackground[] = {1,1,1,0.5};
   colorSelectBackground2[] = {1,1,1,0.5};
   colorSelect[] = {1,1,1,1};
   colorSelect2[] = {1,1,1,1};
  };
 };
};