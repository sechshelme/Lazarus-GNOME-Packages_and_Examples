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

#ifndef WebKitWebsiteData_h
#define WebKitWebsiteData_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_WEBSITE_DATA (webkit_website_data_get_type())

typedef struct _WebKitWebsiteData WebKitWebsiteData;

typedef enum {
    WEBKIT_WEBSITE_DATA_MEMORY_CACHE                 = 1 << 0,
    WEBKIT_WEBSITE_DATA_DISK_CACHE                   = 1 << 1,
    WEBKIT_WEBSITE_DATA_OFFLINE_APPLICATION_CACHE    = 1 << 2,
    WEBKIT_WEBSITE_DATA_SESSION_STORAGE              = 1 << 3,
    WEBKIT_WEBSITE_DATA_LOCAL_STORAGE                = 1 << 4,
    WEBKIT_WEBSITE_DATA_INDEXEDDB_DATABASES          = 1 << 5,
    WEBKIT_WEBSITE_DATA_COOKIES                      = 1 << 6,
    WEBKIT_WEBSITE_DATA_DEVICE_ID_HASH_SALT          = 1 << 7,
    WEBKIT_WEBSITE_DATA_HSTS_CACHE                   = 1 << 8,
    WEBKIT_WEBSITE_DATA_ITP                          = 1 << 9,
    WEBKIT_WEBSITE_DATA_SERVICE_WORKER_REGISTRATIONS = 1 << 10,
    WEBKIT_WEBSITE_DATA_DOM_CACHE                    = 1 << 11,
    WEBKIT_WEBSITE_DATA_ALL                          = (1 << 12) - 1
} WebKitWebsiteDataTypes;

extern GType
webkit_website_data_get_type      (void);

extern WebKitWebsiteData *
webkit_website_data_ref           (WebKitWebsiteData     *website_data);

extern void
webkit_website_data_unref         (WebKitWebsiteData     *website_data);

extern const char *
webkit_website_data_get_name      (WebKitWebsiteData     *website_data);

extern WebKitWebsiteDataTypes
webkit_website_data_get_types     (WebKitWebsiteData     *website_data);

extern guint64
webkit_website_data_get_size      (WebKitWebsiteData     *website_data,
                                   WebKitWebsiteDataTypes types);



#endif /* WebKitWebsiteData_h */
