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

#ifndef JSCVirtualMachine_h
#define JSCVirtualMachine_h

#include <glib-object.h>
#include <jsc/JSCDefines.h>
#include <jsc/JSCValue.h>



#define JSC_TYPE_VIRTUAL_MACHINE            (jsc_virtual_machine_get_type())

JSC_DECLARE_FINAL_TYPE (JSCVirtualMachine, jsc_virtual_machine, JSC, VIRTUAL_MACHINE, GObject)

JSC_API JSCVirtualMachine *
jsc_virtual_machine_new (void);



#endif /* JSCVirtualMachine_h */
