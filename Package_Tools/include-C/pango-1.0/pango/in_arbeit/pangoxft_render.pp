
unit pangoxft_render;
interface

{
  Automatically converted by H2Pas 1.0.0 from pangoxft_render.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pangoxft_render.h
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
PDisplay  = ^Display;
PPangoColor  = ^PangoColor;
PPangoFont  = ^PangoFont;
PPangoGlyphString  = ^PangoGlyphString;
PPangoLayout  = ^PangoLayout;
PPangoLayoutLine  = ^PangoLayoutLine;
PPangoMatrix  = ^PangoMatrix;
PPangoRenderer  = ^PangoRenderer;
PPangoXftRenderer  = ^PangoXftRenderer;
PPangoXftRendererClass  = ^PangoXftRendererClass;
PPangoXftRendererPrivate  = ^PangoXftRendererPrivate;
PXftColor  = ^XftColor;
PXftDraw  = ^XftDraw;
PXftFont  = ^XftFont;
PXftGlyphSpec  = ^XftGlyphSpec;
PXTrapezoid  = ^XTrapezoid;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pangoxft-render.h: Rendering routines for the Xft library
 *
 * Copyright (C) 2004 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGOXFT_RENDER_H__}
{$define __PANGOXFT_RENDER_H__}
{$include <pango/pango-renderer.h>}

{ was #define dname def_expr }
function PANGO_TYPE_XFT_RENDERER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_XFT_RENDERER(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_XFT_RENDERER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_XFT_RENDERER(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_XFT_RENDERER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_XFT_RENDERER_GET_CLASS(obj : longint) : longint;

{$define _XFT_NO_COMPAT_}
{$include <X11/Xlib.h>}
{$include <X11/Xft/Xft.h>}
{$if defined(XftVersion) && XftVersion >= 20000}
{$else}
{$error "must have Xft version 2 or newer"}
{$endif}
type
{*
 * PangoXftRenderer:
 *
 * `PangoXftRenderer` is a subclass of `PangoRenderer` used for rendering
 * with Pango's Xft backend. It can be used directly, or it can be
 * further subclassed to modify exactly how drawing of individual
 * elements occurs.
 *
 * Since: 1.8
  }
{< private > }
  PPangoXftRenderer = ^TPangoXftRenderer;
  TPangoXftRenderer = record
      parent_instance : TPangoRenderer;
      display : PDisplay;
      screen : longint;
      draw : PXftDraw;
      priv : PPangoXftRendererPrivate;
    end;

{*
 * PangoXftRendererClass:
 * @composite_trapezoids: draw the specified trapezoids using
 *   the current color and other attributes for @part
 * @composite_glyphs: draw the specified glyphs using
 *   the current foreground color and other foreground
 *   attributes
 *
 * The class structure for `PangoXftRenderer`
 *
 * Since: 1.8
  }
{< private > }
{< public > }
  PPangoXftRendererClass = ^TPangoXftRendererClass;
  TPangoXftRendererClass = record
      parent_class : TPangoRendererClass;
      composite_trapezoids : procedure (xftrenderer:PPangoXftRenderer; part:TPangoRenderPart; trapezoids:PXTrapezoid; n_trapezoids:longint);cdecl;
      composite_glyphs : procedure (xftrenderer:PPangoXftRenderer; xft_font:PXftFont; glyphs:PXftGlyphSpec; n_glyphs:longint);cdecl;
    end;


function pango_xft_renderer_get_type:TGType;cdecl;external;
function pango_xft_renderer_new(display:PDisplay; screen:longint):PPangoRenderer;cdecl;external;
procedure pango_xft_renderer_set_draw(xftrenderer:PPangoXftRenderer; draw:PXftDraw);cdecl;external;
procedure pango_xft_renderer_set_default_color(xftrenderer:PPangoXftRenderer; default_color:PPangoColor);cdecl;external;
procedure pango_xft_render(draw:PXftDraw; color:PXftColor; font:PPangoFont; glyphs:PPangoGlyphString; x:Tgint; 
            y:Tgint);cdecl;external;
procedure pango_xft_picture_render(display:PDisplay; src_picture:TPicture; dest_picture:TPicture; font:PPangoFont; glyphs:PPangoGlyphString; 
            x:Tgint; y:Tgint);cdecl;external;
procedure pango_xft_render_transformed(draw:PXftDraw; color:PXftColor; matrix:PPangoMatrix; font:PPangoFont; glyphs:PPangoGlyphString; 
            x:longint; y:longint);cdecl;external;
procedure pango_xft_render_layout_line(draw:PXftDraw; color:PXftColor; line:PPangoLayoutLine; x:longint; y:longint);cdecl;external;
procedure pango_xft_render_layout(draw:PXftDraw; color:PXftColor; layout:PPangoLayout; x:longint; y:longint);cdecl;external;
{$endif}
{ __PANGOXFT_RENDER_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_XFT_RENDERER : longint; { return type might be wrong }
  begin
    PANGO_TYPE_XFT_RENDERER:=pango_xft_renderer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_XFT_RENDERER(object : longint) : longint;
begin
  PANGO_XFT_RENDERER:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_XFT_RENDERER,PangoXftRenderer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_XFT_RENDERER_CLASS(klass : longint) : longint;
begin
  PANGO_XFT_RENDERER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,PANGO_TYPE_XFT_RENDERER,PangoXftRendererClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_XFT_RENDERER(object : longint) : longint;
begin
  PANGO_IS_XFT_RENDERER:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_XFT_RENDERER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_XFT_RENDERER_CLASS(klass : longint) : longint;
begin
  PANGO_IS_XFT_RENDERER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,PANGO_TYPE_XFT_RENDERER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_XFT_RENDERER_GET_CLASS(obj : longint) : longint;
begin
  PANGO_XFT_RENDERER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,PANGO_TYPE_XFT_RENDERER,PangoXftRendererClass);
end;


end.
