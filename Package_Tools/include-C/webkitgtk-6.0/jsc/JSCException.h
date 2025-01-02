/*
 * Copyright (C) 2018 Igalia S.L.
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

#if !defined(__JSC_H_INSIDE__) && !defined(BUILDING_WEBKIT)
#error "Only <jsc/jsc.h> can be included directly."
#endif

#ifndef JSCException_h
#define JSCException_h

#include <glib-object.h>
#include <jsc/JSCDefines.h>



#define JSC_TYPE_EXCEPTION            (jsc_exception_get_type())

JSC_DECLARE_FINAL_TYPE (JSCException, jsc_exception, JSC, EXCEPTION, GObject)

typedef struct _JSCContext JSCContext;

JSC_API JSCException *
jsc_exception_new                   (JSCContext   *context,
                                     const char   *message);

JSC_API JSCException *
jsc_exception_new_printf            (JSCContext   *context,
                                     const char   *format,
                                     ...) G_GNUC_PRINTF (2, 3);

JSC_API JSCException *
jsc_exception_new_vprintf           (JSCContext   *context,
                                     const char   *format,
                                     va_list       args) G_GNUC_PRINTF(2, 0);

JSC_API JSCException *
jsc_exception_new_with_name         (JSCContext   *context,
                                     const char   *name,
                                     const char   *message);

JSC_API JSCException *
jsc_exception_new_with_name_printf  (JSCContext   *context,
                                     const char   *name,
                                     const char   *format,
                                     ...) G_GNUC_PRINTF (3, 4);

JSC_API JSCException *
jsc_exception_new_with_name_vprintf (JSCContext   *context,
                                     const char   *name,
                                     const char   *format,
                                     va_list       args) G_GNUC_PRINTF (3, 0);

JSC_API const char *
jsc_exception_get_name              (JSCException *exception);

JSC_API const char *
jsc_exception_get_message           (JSCException *exception);

JSC_API guint
jsc_exception_get_line_number       (JSCException *exception);

JSC_API guint
jsc_exception_get_column_number     (JSCException *exception);

JSC_API const char *
jsc_exception_get_source_uri        (JSCException *exception);

JSC_API const char *
jsc_exception_get_backtrace_string  (JSCException *exception);

JSC_API char *
jsc_exception_to_string             (JSCException *exception);

JSC_API char *
jsc_exception_report                (JSCException *exception);



#endif /* JSCException_h */
