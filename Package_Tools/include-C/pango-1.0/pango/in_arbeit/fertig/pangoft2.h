/* Pango
 * pangoft2.h:
 *
 * Copyright (C) 1999 Red Hat Software
 * Copyright (C) 2000 Tor Lillqvist
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
 */

#ifndef __PANGOFT2_H__
#define __PANGOFT2_H__

#include <fontconfig/fontconfig.h>

#include <ft2build.h>
#include FT_FREETYPE_H

#include <pango/pangofc-fontmap.h>
#include <pango/pango-layout.h>
#include <pango/pangofc-font.h>

#define PANGO_TYPE_FT2_FONT_MAP              (pango_ft2_font_map_get_type ())
#define PANGO_FT2_FONT_MAP(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FT2_FONT_MAP, PangoFT2FontMap))
#define PANGO_FT2_IS_FONT_MAP(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FT2_FONT_MAP))



#ifndef __GI_SCANNER__

#ifndef PANGO_DISABLE_DEPRECATED
/**
 * PANGO_RENDER_TYPE_FT2: (skip)
 *
 * A string constant that was used to identify shape engines that work
 * with the FreeType backend. See %PANGO_RENDER_TYPE_FC for the replacement.
 */
#define PANGO_RENDER_TYPE_FT2 "PangoRenderFT2"
#endif

#endif /* __GI_SCANNER__ */

typedef struct _PangoFT2FontMap      PangoFT2FontMap;

/**
 * PangoFT2SubstituteFunc:
 * @pattern: the FcPattern to tweak.
 * @data: user data.
 *
 * Function type for doing final config tweaking on prepared FcPatterns.
 */
typedef void (*PangoFT2SubstituteFunc) (FcPattern *pattern,
				        gpointer   data);

/* Calls for applications */

extern
void pango_ft2_render             (FT_Bitmap         *bitmap,
				   PangoFont         *font,
				   PangoGlyphString  *glyphs,
				   gint               x,
				   gint               y);
extern
void pango_ft2_render_transformed (FT_Bitmap         *bitmap,
				   const PangoMatrix *matrix,
				   PangoFont         *font,
				   PangoGlyphString  *glyphs,
				   int                x,
				   int                y);

extern
void pango_ft2_render_layout_line          (FT_Bitmap        *bitmap,
					    PangoLayoutLine  *line,
					    int               x,
					    int               y);
extern
void pango_ft2_render_layout_line_subpixel (FT_Bitmap        *bitmap,
					    PangoLayoutLine  *line,
					    int               x,
					    int               y);
extern
void pango_ft2_render_layout               (FT_Bitmap        *bitmap,
					    PangoLayout      *layout,
					    int               x,
					    int               y);
extern
void pango_ft2_render_layout_subpixel      (FT_Bitmap        *bitmap,
					    PangoLayout      *layout,
					    int               x,
					    int               y);

extern
GType pango_ft2_font_map_get_type (void) ;

extern
PangoFontMap *pango_ft2_font_map_new                    (void);
extern
void          pango_ft2_font_map_set_resolution         (PangoFT2FontMap        *fontmap,
							 double                  dpi_x,
							 double                  dpi_y);
#ifndef PANGO_DISABLE_DEPRECATED
extern
void          pango_ft2_font_map_set_default_substitute (PangoFT2FontMap        *fontmap,
							 PangoFT2SubstituteFunc  func,
							 gpointer                data,
							 GDestroyNotify          notify);
extern
void          pango_ft2_font_map_substitute_changed     (PangoFT2FontMap         *fontmap);
extern
PangoContext *pango_ft2_font_map_create_context         (PangoFT2FontMap         *fontmap);
#endif


/* API for rendering modules
 */
#ifndef PANGO_DISABLE_DEPRECATED
extern
PangoContext      *pango_ft2_get_context          (double dpi_x,
						   double dpi_y);
extern
PangoFontMap      *pango_ft2_font_map_for_display (void);
extern
void               pango_ft2_shutdown_display     (void);

extern
PangoGlyph     pango_ft2_get_unknown_glyph (PangoFont       *font);
extern
int            pango_ft2_font_get_kerning  (PangoFont       *font,
					    PangoGlyph       left,
					    PangoGlyph       right);
extern
FT_Face        pango_ft2_font_get_face     (PangoFont       *font);
extern
PangoCoverage *pango_ft2_font_get_coverage (PangoFont       *font,
					    PangoLanguage   *language);
#endif /* PANGO_DISABLE_DEPRECATED */



#endif /* __PANGOFT2_H__ */