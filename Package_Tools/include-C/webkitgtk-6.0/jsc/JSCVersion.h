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

#ifndef JSCVersion_h
#define JSCVersion_h

#include <jsc/JSCDefines.h>



/**
 * JSC_MAJOR_VERSION:
 *
 * Like jsc_get_major_version(), but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
#define JSC_MAJOR_VERSION (2)

/**
 * JSC_MINOR_VERSION:
 *
 * Like jsc_get_minor_version(), but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
#define JSC_MINOR_VERSION (46)

/**
 * JSC_MICRO_VERSION:
 *
 * Like jsc_get_micro_version(), but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
#define JSC_MICRO_VERSION (4)

/**
 * JSC_CHECK_VERSION:
 * @major: major version (e.g. 1 for version 1.2.5)
 * @minor: minor version (e.g. 2 for version 1.2.5)
 * @micro: micro version (e.g. 5 for version 1.2.5)
 *
 * Check the version of JSC header files at compile time.
 *
 * Returns: %TRUE if the version of the JavaScriptCore header files
 * is the same as or newer than the passed-in version.
 */
#define JSC_CHECK_VERSION(major, minor, micro) \
    (JSC_MAJOR_VERSION > (major) || \
    (JSC_MAJOR_VERSION == (major) && JSC_MINOR_VERSION > (minor)) || \
    (JSC_MAJOR_VERSION == (major) && JSC_MINOR_VERSION == (minor) && \
     JSC_MICRO_VERSION >= (micro)))

JSC_API guint
jsc_get_major_version (void);

JSC_API guint
jsc_get_minor_version (void);

JSC_API guint
jsc_get_micro_version (void);



#endif /* JSCVersion_h */
