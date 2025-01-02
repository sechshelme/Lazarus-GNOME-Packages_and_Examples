/*
 * Copyright (C) 2022 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
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

#ifndef WebKitWebFormManager_h
#define WebKitWebFormManager_h

#include <glib-object.h>
#include <jsc/jsc.h>
#include <webkit/WebKitDefines.h>



#define WEBKIT_TYPE_WEB_FORM_MANAGER            (webkit_web_form_manager_get_type())
#define WEBKIT_WEB_FORM_MANAGER(obj)            (G_TYPE_CHECK_INSTANCE_CAST((obj), WEBKIT_TYPE_WEB_FORM_MANAGER, WebKitWebFormManager))
#define WEBKIT_IS_WEB_FORM_MANAGER(obj)         (G_TYPE_CHECK_INSTANCE_TYPE((obj), WEBKIT_TYPE_WEB_FORM_MANAGER))
#define WEBKIT_WEB_FORM_MANAGER_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST((klass),  WEBKIT_TYPE_WEB_FORM_MANAGER, WebKitWebFormManagerClass))
#define WEBKIT_IS_WEB_FORM_MANAGER_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass),  WEBKIT_TYPE_WEB_FORM_MANAGER))
#define WEBKIT_WEB_FORM_MANAGER_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS((obj),  WEBKIT_TYPE_WEB_FORM_MANAGER, WebKitWebFormManagerClass))

typedef struct _WebKitWebFormManager        WebKitWebFormManager;
typedef struct _WebKitWebFormManagerClass   WebKitWebFormManagerClass;

struct _WebKitWebFormManager {
    GObject parent;
};

struct _WebKitWebFormManagerClass {
    GObjectClass parent_class;
};

extern GType
webkit_web_form_manager_get_type                     (void);

extern gboolean
webkit_web_form_manager_input_element_is_user_edited (JSCValue             *element);

extern void
webkit_web_form_manager_input_element_auto_fill      (JSCValue             *element,
                                                      const char           *value);

extern gboolean
webkit_web_form_manager_input_element_is_auto_filled (JSCValue             *element);



#endif
