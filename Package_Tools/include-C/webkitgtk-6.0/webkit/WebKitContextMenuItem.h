/*
 * Copyright (C) 2012 Igalia S.L.
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

#ifndef WebKitContextMenuItem_h
#define WebKitContextMenuItem_h

#include <gio/gio.h>
#include <webkit/WebKitDefines.h>
#include <webkit/WebKitContextMenu.h>
#include <webkit/WebKitContextMenuActions.h>

#include <gtk/gtk.h>



#define WEBKIT_TYPE_CONTEXT_MENU_ITEM            (webkit_context_menu_item_get_type())

WEBKIT_DECLARE_FINAL_TYPE (WebKitContextMenuItem, webkit_context_menu_item, WEBKIT, CONTEXT_MENU_ITEM, GInitiallyUnowned)


extern WebKitContextMenuItem *
webkit_context_menu_item_new_from_gaction                 (GAction                *action,
                                                           const gchar            *label,
                                                           GVariant               *target);

extern WebKitContextMenuItem *
webkit_context_menu_item_new_from_stock_action            (WebKitContextMenuAction action);

extern WebKitContextMenuItem *
webkit_context_menu_item_new_from_stock_action_with_label (WebKitContextMenuAction action,
                                                           const gchar            *label);

extern WebKitContextMenuItem *
webkit_context_menu_item_new_with_submenu                 (const gchar            *label,
                                                           WebKitContextMenu      *submenu);

extern WebKitContextMenuItem *
webkit_context_menu_item_new_separator                    (void);


extern GAction *
webkit_context_menu_item_get_gaction                      (WebKitContextMenuItem  *item);

extern WebKitContextMenuAction
webkit_context_menu_item_get_stock_action                 (WebKitContextMenuItem  *item);

extern gboolean
webkit_context_menu_item_is_separator                     (WebKitContextMenuItem  *item);

extern void
webkit_context_menu_item_set_submenu                      (WebKitContextMenuItem  *item,
                                                           WebKitContextMenu      *submenu);

extern WebKitContextMenu *
webkit_context_menu_item_get_submenu                      (WebKitContextMenuItem  *item);



#endif