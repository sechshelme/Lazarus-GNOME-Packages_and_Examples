
unit WebKitWebViewBase;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWebViewBase.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWebViewBase.h
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
PWebKitWebViewBaseClass  = ^WebKitWebViewBaseClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2010 Apple Inc. All rights reserved.
 * Portions Copyright (c) 2010 Motorola Mobility, Inc.  All rights reserved.
 * Copyright (C) 2011 Igalia S.L.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY APPLE INC. AND ITS CONTRIBUTORS ``AS IS''
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL APPLE INC. OR ITS CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitWebViewBase_h}
{$define WebKitWebViewBase_h}
{$include <gtk/gtk.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_VIEW_BASE : longint; { return type might be wrong }

{WEBKIT_DECLARE_DERIVABLE_TYPE (WebKitWebViewBase, webkit_web_view_base, WEBKIT, WEB_VIEW_BASE, GtkWidget) }
type
  PWebKitWebViewBaseClass = ^TWebKitWebViewBaseClass;
  TWebKitWebViewBaseClass = record
      parentClass : TGtkWidgetClass;
      _webkit_reserved0 : procedure ;cdecl;
      _webkit_reserved1 : procedure ;cdecl;
      _webkit_reserved2 : procedure ;cdecl;
      _webkit_reserved3 : procedure ;cdecl;
    end;

{$endif}
{ WebKitWebViewBase_h  }

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_VIEW_BASE : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WEB_VIEW_BASE:=webkit_web_view_base_get_type;
  end;


end.
