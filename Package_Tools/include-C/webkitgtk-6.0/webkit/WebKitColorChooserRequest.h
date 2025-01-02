/*
 * Copyright (C) 2015 Igalia S.L.
 * Copyright (c) 2012, Samsung Electronics
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitColorChooserRequest_h
#define WebKitColorChooserRequest_h

#include <gtk/gtk.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_COLOR_CHOOSER_REQUEST            (webkit_color_chooser_request_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitColorChooserRequest, webkit_color_chooser_request, WEBKIT, COLOR_CHOOSER_REQUEST, GObject)

extern void
webkit_color_chooser_request_get_rgba              (WebKitColorChooserRequest *request,
                                                    GdkRGBA                   *rgba);

extern void
webkit_color_chooser_request_set_rgba              (WebKitColorChooserRequest *request,
                                                    const GdkRGBA             *rgba);

extern void
webkit_color_chooser_request_get_element_rectangle (WebKitColorChooserRequest *request,
                                                    GdkRectangle              *rect);

extern void
webkit_color_chooser_request_finish                (WebKitColorChooserRequest *request);

extern void
webkit_color_chooser_request_cancel                (WebKitColorChooserRequest *request);



#endif
