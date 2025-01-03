
unit WebKitBackForwardListItem;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitBackForwardListItem.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitBackForwardListItem.h
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
Pgchar  = ^gchar;
PWebKitBackForwardListItem  = ^WebKitBackForwardListItem;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2011 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitBackForwardListItem_h}
{$define WebKitBackForwardListItem_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_BACK_FORWARD_LIST_ITEM : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitBackForwardListItem, webkit_back_forward_list_item, WEBKIT, BACK_FORWARD_LIST_ITEM, GInitiallyUnowned) }
(* Const before type ignored *)
function webkit_back_forward_list_item_get_uri(list_item:PWebKitBackForwardListItem):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_back_forward_list_item_get_title(list_item:PWebKitBackForwardListItem):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_back_forward_list_item_get_original_uri(list_item:PWebKitBackForwardListItem):Pgchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_BACK_FORWARD_LIST_ITEM : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_BACK_FORWARD_LIST_ITEM:=webkit_back_forward_list_item_get_type;
  end;


end.
