/*
 * Copyright (C) 2015 Igalia S.L.
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

#if !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <webkit/webkit-web-process-extension.h> can be included directly."
#endif

#ifndef WebKitConsoleMessage_h
#define WebKitConsoleMessage_h

#include <glib-object.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_CONSOLE_MESSAGE (webkit_console_message_get_type())

/**
 * WebKitConsoleMessageSource:
 * @WEBKIT_CONSOLE_MESSAGE_SOURCE_JAVASCRIPT: Message produced by JavaScript.
 * @WEBKIT_CONSOLE_MESSAGE_SOURCE_NETWORK: Network messages.
 * @WEBKIT_CONSOLE_MESSAGE_SOURCE_CONSOLE_API: Messages produced by console API.
 * @WEBKIT_CONSOLE_MESSAGE_SOURCE_SECURITY: Security messages.
 * @WEBKIT_CONSOLE_MESSAGE_SOURCE_OTHER: Other messages.
 *
 * Enum values used to denote the various sources of console messages.
 *
 * Since: 2.12
 */
typedef enum {
    WEBKIT_CONSOLE_MESSAGE_SOURCE_JAVASCRIPT,
    WEBKIT_CONSOLE_MESSAGE_SOURCE_NETWORK,
    WEBKIT_CONSOLE_MESSAGE_SOURCE_CONSOLE_API,
    WEBKIT_CONSOLE_MESSAGE_SOURCE_SECURITY,
    WEBKIT_CONSOLE_MESSAGE_SOURCE_OTHER
} WebKitConsoleMessageSource;

/**
 * WebKitConsoleMessageLevel:
 * @WEBKIT_CONSOLE_MESSAGE_LEVEL_INFO: Information message.
 * @WEBKIT_CONSOLE_MESSAGE_LEVEL_LOG: Log message.
 * @WEBKIT_CONSOLE_MESSAGE_LEVEL_WARNING: Warning message.
 * @WEBKIT_CONSOLE_MESSAGE_LEVEL_ERROR: Error message.
 * @WEBKIT_CONSOLE_MESSAGE_LEVEL_DEBUG: Debug message.
 *
 * Enum values used to denote the various levels of console messages.
 *
 * Since: 2.12
 */
typedef enum {
    WEBKIT_CONSOLE_MESSAGE_LEVEL_INFO,
    WEBKIT_CONSOLE_MESSAGE_LEVEL_LOG,
    WEBKIT_CONSOLE_MESSAGE_LEVEL_WARNING,
    WEBKIT_CONSOLE_MESSAGE_LEVEL_ERROR,
    WEBKIT_CONSOLE_MESSAGE_LEVEL_DEBUG
} WebKitConsoleMessageLevel;

typedef struct _WebKitConsoleMessage WebKitConsoleMessage;

extern GType
webkit_console_message_get_type      (void);

extern WebKitConsoleMessage *
webkit_console_message_copy          (WebKitConsoleMessage *console_message);

extern void
webkit_console_message_free          (WebKitConsoleMessage *console_message);

extern WebKitConsoleMessageSource
webkit_console_message_get_source    (WebKitConsoleMessage *console_message);

extern WebKitConsoleMessageLevel
webkit_console_message_get_level     (WebKitConsoleMessage *console_message);

extern const gchar *
webkit_console_message_get_text      (WebKitConsoleMessage *console_message);

extern guint
webkit_console_message_get_line      (WebKitConsoleMessage *console_message);

extern const gchar *
webkit_console_message_get_source_id (WebKitConsoleMessage *console_message);



#endif /* WebKitConsoleMessage_h */
