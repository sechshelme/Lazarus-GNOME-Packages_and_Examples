/*
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
 */

#if !defined(__WEBKIT_H_INSIDE__) && !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitURIResponse_h
#define WebKitURIResponse_h

#include <gio/gio.h>
#include <libsoup/soup.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_URI_RESPONSE            (webkit_uri_response_get_type())

//WEBKIT_DECLARE_FINAL_TYPE (WebKitURIResponse, webkit_uri_response, WEBKIT, URI_RESPONSE, GObject)

extern const gchar *
webkit_uri_response_get_uri                (WebKitURIResponse    *response);

extern guint
webkit_uri_response_get_status_code        (WebKitURIResponse    *response);

extern guint64
webkit_uri_response_get_content_length     (WebKitURIResponse    *response);

extern const gchar *
webkit_uri_response_get_mime_type          (WebKitURIResponse    *response);

extern const gchar *
webkit_uri_response_get_suggested_filename (WebKitURIResponse    *response);

extern SoupMessageHeaders *
webkit_uri_response_get_http_headers       (WebKitURIResponse    *response);



#endif
