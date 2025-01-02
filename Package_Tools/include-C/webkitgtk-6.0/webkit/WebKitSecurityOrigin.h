/*
 * Copyright (C) 2017 Igalia S.L.
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

#if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit.h> can be included directly."
#endif

#ifndef WebKitSecurityOrigin_h
#define WebKitSecurityOrigin_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_SECURITY_ORIGIN (webkit_security_origin_get_type())

typedef struct _WebKitSecurityOrigin WebKitSecurityOrigin;

extern GType
webkit_security_origin_get_type     (void);

extern WebKitSecurityOrigin *
webkit_security_origin_new          (const gchar          *protocol,
                                     const gchar          *host,
                                     guint16               port);

extern WebKitSecurityOrigin *
webkit_security_origin_new_for_uri  (const gchar          *uri);

extern WebKitSecurityOrigin *
webkit_security_origin_ref          (WebKitSecurityOrigin *origin);

extern void
webkit_security_origin_unref        (WebKitSecurityOrigin *origin);

extern const gchar *
webkit_security_origin_get_protocol (WebKitSecurityOrigin *origin);

extern const gchar *
webkit_security_origin_get_host     (WebKitSecurityOrigin *origin);

extern guint16
webkit_security_origin_get_port     (WebKitSecurityOrigin *origin);


extern gchar *
webkit_security_origin_to_string    (WebKitSecurityOrigin *origin);



#endif /* WebKitSecurityOrigin_h */