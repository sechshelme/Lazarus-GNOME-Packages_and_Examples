/* GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Alexander Larsson <alexl@redhat.com>
 */

#ifndef __G_UNIX_INPUT_STREAM_H__
#define __G_UNIX_INPUT_STREAM_H__

#include <gio/gio.h>


#define G_TYPE_UNIX_INPUT_STREAM         (g_unix_input_stream_get_type ())
#define G_UNIX_INPUT_STREAM(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), G_TYPE_UNIX_INPUT_STREAM, GUnixInputStream))
#define G_UNIX_INPUT_STREAM_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST((k), G_TYPE_UNIX_INPUT_STREAM, GUnixInputStreamClass))
#define G_IS_UNIX_INPUT_STREAM(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), G_TYPE_UNIX_INPUT_STREAM))
#define G_IS_UNIX_INPUT_STREAM_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), G_TYPE_UNIX_INPUT_STREAM))
#define G_UNIX_INPUT_STREAM_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), G_TYPE_UNIX_INPUT_STREAM, GUnixInputStreamClass))

typedef struct _GUnixInputStream         GUnixInputStream;
typedef struct _GUnixInputStreamClass    GUnixInputStreamClass;
typedef struct _GUnixInputStreamPrivate  GUnixInputStreamPrivate;


struct _GUnixInputStream
{
  GInputStream parent_instance;

  /*< private >*/
  GUnixInputStreamPrivate *priv;
};

struct _GUnixInputStreamClass
{
  GInputStreamClass parent_class;

  /*< private >*/
  /* Padding for future expansion */
  void (*_g_reserved1) (void);
  void (*_g_reserved2) (void);
  void (*_g_reserved3) (void);
  void (*_g_reserved4) (void);
  void (*_g_reserved5) (void);
};


GType          g_unix_input_stream_get_type     (void) ;


GInputStream * g_unix_input_stream_new          (gint              fd,
                                                 gboolean          close_fd);

void           g_unix_input_stream_set_close_fd (GUnixInputStream *stream,
                                                 gboolean          close_fd);

gboolean       g_unix_input_stream_get_close_fd (GUnixInputStream *stream);

gint           g_unix_input_stream_get_fd       (GUnixInputStream *stream);


#endif /* __G_UNIX_INPUT_STREAM_H__ */
