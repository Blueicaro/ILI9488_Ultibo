{
 ILI9488 TFT LCD Driver.

Copyright (C) 2024

Arch
====

 <All>

Boards
======

 <All>

Licence
=======

 LGPLv2.1 with static linking exception (See COPYING.modifiedLGPL.txt)

Credits
=======

 Information for this unit was obtained from:

 https://github.com/jaretburkett/ILI9488/blob/master/ILI9488.h

References
==========
 https://ultibo.org/forum/viewtopic.php?f=13&t=1787


 ILI9488
==============



}

{$mode delphi}{Default to Delphi compatible syntax}
{$H+}{Default to AnsiString}
{$inline on}{Allow use of Inline procedures}
unit ILI9488;

{$mode ObjFPC}{$H+}

interface

uses GlobalConfig, GlobalConst, GlobalTypes, Platform, Threads, Devices,
  GPIO, SPI, Framebuffer, TFTFramebuffer, SysUtils;

{==============================================================================}
{Global definitions}
{$INCLUDE ..\core\GlobalDefines.inc}

{==============================================================================}
const
  {ILI9488 specific constants}
  ILI9488_FRAMEBUFFER_DESCRIPTION = 'ILI9488 TFT LCD';
  {Description of ILI9488 device}
  ILI9488_SPI_RATE = 32000000; {Default SPI clock rate}

  {ILI9488 Command constants}

  ILI9488_TFTWIDTH = 320;
  ILI9488_TFTHEIGHT = 480;

  ILI9488_NOP = $00;
  ILI9488_SWRESET = $01;
  ILI9488_RDDID = $04;
  ILI9488_RDDST = $09;

  ILI9488_SLPIN = $10;
  ILI9488_SLPOUT = $11;
  ILI9488_PTLON = $12;
  ILI9488_NORON = $13;

  ILI9488_RDMODE = $0A;
  ILI9488_RDMADCTL = $0B;
  ILI9488_RDPIXFMT = $0C;
  ILI9488_RDIMGFMT = $0D;
  ILI9488_RDSELFDIAG = $0F;

  ILI9488_INVOFF = $20;
  ILI9488_INVON = $21;
  ILI9488_GAMMASET = $26;
  ILI9488_DISPOFF = $28;
  ILI9488_DISPON = $29;

  ILI9488_CASET = $2A;
  ILI9488_PASET = $2B;
  ILI9488_RAMWR = $2C;
  ILI9488_RAMRD = $2E;

  ILI9488_PTLAR = $30;
  ILI9488_MADCTL = $36;
  ILI9488_PIXFMT = $3A;

  ILI9488_FRMCTR1 = $B1;
  ILI9488_FRMCTR2 = $B2;
  ILI9488_FRMCTR3 = $B3;
  ILI9488_INVCTR = $B4;
  ILI9488_DFUNCTR = $B6;

  ILI9488_PWCTR1 = $C0;
  ILI9488_PWCTR2 = $C1;
  ILI9488_PWCTR3 = $C2;
  ILI9488_PWCTR4 = $C3;
  ILI9488_PWCTR5 = $C4;
  ILI9488_VMCTR1 = $C5;
  ILI9488_VMCTR2 = $C7;

  ILI9488_RDID1 = $DA;
  ILI9488_RDID2 = $DB;
  ILI9488_RDID3 = $DC;
  ILI9488_RDID4 = $DD;

  ILI9488_GMCTRP1 = $E0;
  ILI9488_GMCTRN1 = $E1;

  { Color definitions     }
  ILI9488_BLACK = $0000;    //   0,   0,   0
  ILI9488_NAVY = $000F;    //   0,   0, 128
  ILI9488_DARKGREEN = $03E0;    //   0, 128,   0
  ILI9488_DARKCYAN = $03EF;    //   0, 128, 128
  ILI9488_MAROON = $7800;    // 128,   0,   0
  ILI9488_PURPLE = $780F;    // 128,   0, 128
  ILI9488_OLIVE = $7BE0;    // 128, 128,   0
  ILI9488_LIGHTGREY = $C618;    // 192, 192, 192
  ILI9488_DARKGREY = $7BEF;    // 128, 128, 128
  ILI9488_BLUE = $001F;    //   0,   0, 255
  ILI9488_GREEN = $07E0;    //   0, 255,   0
  ILI9488_CYAN = $07FF;    //   0, 255, 255
  ILI9488_RED = $F800;    // 255,   0,   0
  ILI9488_MAGENTA = $F81F;    // 255,   0, 255
  ILI9488_YELLOW = $FFE0;    // 255, 255,   0
  ILI9488_WHITE = $FFFF;    // 255, 255, 255
  ILI9488_ORANGE = $FD20;    // 255, 165,   0
  ILI9488_GREENYELLOW = $AFE5;    // 173, 255,  47
  ILI9488_PINK = $F81F;

{==============================================================================}
type
  {ILI9448 specific types}
  PILI9448Framebuffer = ^TILI9448Framebuffer;

  TILI9448Framebuffer = record
    {TFT Properties}
    TFT: TTFTFramebuffer;
    {ILI9448 Properties}
  end;

{==============================================================================}
{var}
{ILI9340 specific variables}

{==============================================================================}
{Initialization Functions}

{==============================================================================}
{ILI9340 Functions}
function ILI9488FramebufferCreate(SPI: PSPIDevice; ChipSelect: word;
  const Name: string; Rotation, Width, Height: longword;
  RST, DC, BL: PGPIOInfo): PFramebufferDevice;

function ILI9488FramebufferDestroy(Framebuffer: PFramebufferDevice): longword;

implementation

end.
