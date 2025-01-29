
unit chafa_util;
interface

{
  Automatically converted by H2Pas 1.0.0 from chafa_util.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    chafa_util.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgint  = ^gint;
PGString  = ^GString;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-  }
{ Copyright (C) 2018-2023 Hans Petter Jansson
 *
 * This file is part of Chafa, a program that shows pictures on text terminals.
 *
 * Chafa is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Chafa is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Chafa.  If not, see <http://www.gnu.org/licenses/>.  }
{$ifndef __CHAFA_UTIL_H__}
{$define __CHAFA_UTIL_H__}
{$if !defined (__CHAFA_H_INSIDE__) && !defined (CHAFA_COMPILATION)}
{$error "Only <chafa.h> can be included directly."}
{$endif}
{ Miscellaneous functions  }

procedure chafa_calc_canvas_geometry(src_width:Tgint; src_height:Tgint; dest_width_inout:Pgint; dest_height_inout:Pgint; font_ratio:Tgfloat; 
            zoom:Tgboolean; stretch:Tgboolean);cdecl;external;
procedure chafa_free_gstring_array(gsa:PPGString);cdecl;external;
{$endif}
{ __CHAFA_UTIL_H__  }

implementation


end.
