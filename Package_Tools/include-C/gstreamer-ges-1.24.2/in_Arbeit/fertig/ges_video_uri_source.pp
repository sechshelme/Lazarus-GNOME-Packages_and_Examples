
unit ges_video_uri_source;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_video_uri_source.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_video_uri_source.h
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
PGESUriSource  = ^GESUriSource;
PGESVideoUriSource  = ^GESVideoUriSource;
PGESVideoUriSourceClass  = ^GESVideoUriSourceClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2009 Edward Hervey <edward.hervey@collabora.co.uk>
 *               2009 Nokia Corporation
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
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-video-source.h>}
{*
 * GESUriSource: (attributes doc.skip=true):
  }
type

{ was #define dname def_expr }
function GES_TYPE_VIDEO_URI_SOURCE : longint; { return type might be wrong }

{GES_DECLARE_TYPE (VideoUriSource, video_uri_source, VIDEO_URI_SOURCE); }
{*
 * GESVideoUriSource:
 *
 * ### Children Properties
 *
 *   libs/GESVideoUriSource-children-props.md 
  }
{< private > }
{ Padding for API extension  }
type
  PGESVideoUriSource = ^TGESVideoUriSource;
  TGESVideoUriSource = record
      parent : TGESVideoSource;
      uri : Pgchar;
      priv : PGESUriSource;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{< private > }
{ Padding for API extension  }
  PGESVideoUriSourceClass = ^TGESVideoUriSourceClass;
  TGESVideoUriSourceClass = record
      parent_class : TGESVideoSourceClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


implementation

{ was #define dname def_expr }
function GES_TYPE_VIDEO_URI_SOURCE : longint; { return type might be wrong }
  begin
    GES_TYPE_VIDEO_URI_SOURCE:=ges_video_uri_source_get_type;
  end;


end.
