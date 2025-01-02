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

#ifndef JSCContext_h
#define JSCContext_h

#include <glib-object.h>
#include <jsc/JSCDefines.h>
#include <jsc/JSCException.h>
#include <jsc/JSCClass.h>
#include <jsc/JSCValue.h>
#include <jsc/JSCVirtualMachine.h>



#define JSC_TYPE_CONTEXT            (jsc_context_get_type())


JSC_DECLARE_FINAL_TYPE (JSCContext, jsc_context, JSC, CONTEXT, GObject)

typedef void (* JSCExceptionHandler) (JSCContext   *context,
                                      JSCException *exception,
                                      gpointer      user_data);

typedef enum {
    JSC_CHECK_SYNTAX_MODE_SCRIPT,
    JSC_CHECK_SYNTAX_MODE_MODULE
} JSCCheckSyntaxMode;

typedef enum {
    JSC_CHECK_SYNTAX_RESULT_SUCCESS,
    JSC_CHECK_SYNTAX_RESULT_RECOVERABLE_ERROR,
    JSC_CHECK_SYNTAX_RESULT_IRRECOVERABLE_ERROR,
    JSC_CHECK_SYNTAX_RESULT_UNTERMINATED_LITERAL_ERROR,
    JSC_CHECK_SYNTAX_RESULT_OUT_OF_MEMORY_ERROR,
    JSC_CHECK_SYNTAX_RESULT_STACK_OVERFLOW_ERROR,
} JSCCheckSyntaxResult;

JSC_API JSCContext *
jsc_context_new                      (void);

JSC_API JSCContext *
jsc_context_new_with_virtual_machine (JSCVirtualMachine  *vm);

JSC_API JSCVirtualMachine *
jsc_context_get_virtual_machine      (JSCContext         *context);

JSC_API JSCException *
jsc_context_get_exception            (JSCContext         *context);

JSC_API void
jsc_context_throw                    (JSCContext         *context,
                                      const char         *error_message);

JSC_API void
jsc_context_throw_printf             (JSCContext         *context,
                                      const char         *format,
                                      ...) G_GNUC_PRINTF (2, 3);

JSC_API void
jsc_context_throw_with_name          (JSCContext         *context,
                                      const char         *error_name,
                                      const char         *error_message);

JSC_API void
jsc_context_throw_with_name_printf   (JSCContext         *context,
                                      const char         *error_name,
                                      const char         *format,
                                      ...) G_GNUC_PRINTF (3, 4);

JSC_API void
jsc_context_throw_exception          (JSCContext         *context,
                                      JSCException       *exception);

JSC_API void
jsc_context_clear_exception          (JSCContext         *context);

JSC_API void
jsc_context_push_exception_handler   (JSCContext         *context,
                                      JSCExceptionHandler handler,
                                      gpointer            user_data,
                                      GDestroyNotify      destroy_notify);

JSC_API void
jsc_context_pop_exception_handler    (JSCContext         *context);

JSC_API JSCContext *
jsc_context_get_current              (void);

JSC_API JSCValue *
jsc_context_evaluate                 (JSCContext         *context,
                                      const char         *code,
                                      gssize              length) G_GNUC_WARN_UNUSED_RESULT;

JSC_API JSCValue *
jsc_context_evaluate_with_source_uri (JSCContext         *context,
                                      const char         *code,
                                      gssize              length,
                                      const char         *uri,
                                      guint               line_number) G_GNUC_WARN_UNUSED_RESULT;

JSC_API JSCValue *
jsc_context_evaluate_in_object       (JSCContext         *context,
                                      const char         *code,
                                      gssize              length,
                                      gpointer            object_instance,
                                      JSCClass           *object_class,
                                      const char         *uri,
                                      guint               line_number,
                                      JSCValue          **object) G_GNUC_WARN_UNUSED_RESULT;

JSC_API JSCCheckSyntaxResult
jsc_context_check_syntax             (JSCContext         *context,
                                      const char         *code,
                                      gssize              length,
                                      JSCCheckSyntaxMode  mode,
                                      const char         *uri,
                                      unsigned            line_number,
                                      JSCException      **exception);

JSC_API JSCValue *
jsc_context_get_global_object        (JSCContext         *context);

JSC_API void
jsc_context_set_value                (JSCContext         *context,
                                      const char         *name,
                                      JSCValue           *value);

JSC_API JSCValue *
jsc_context_get_value                (JSCContext         *context,
                                      const char         *name);

JSC_API JSCClass *
jsc_context_register_class           (JSCContext         *context,
                                      const char         *name,
                                      JSCClass           *parent_class,
                                      JSCClassVTable     *vtable,
                                      GDestroyNotify      destroy_notify);



#endif /* JSCContext_h */
