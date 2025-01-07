/*
 * Copyright (C) 2018 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include "adw-preferences-row.h"



#define ADW_TYPE_ACTION_ROW (adw_action_row_get_type())

extern
G_DECLARE_DERIVABLE_TYPE (AdwActionRow, adw_action_row, ADW, ACTION_ROW, AdwPreferencesRow)

/**
 * AdwActionRowClass
 * @parent_class: The parent class
 * @activate: Activates the row to trigger its main action.
 */
struct _AdwActionRowClass
{
  AdwPreferencesRowClass parent_class;

  void (*activate) (AdwActionRow *self);

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adw_action_row_new (void) ;

extern
void adw_action_row_add_prefix (AdwActionRow *self,
                                GtkWidget    *widget);
extern
void adw_action_row_add_suffix (AdwActionRow *self,
                                GtkWidget    *widget);
extern
void adw_action_row_remove     (AdwActionRow *self,
                                GtkWidget    *widget);

extern
const char  *adw_action_row_get_subtitle (AdwActionRow *self);
extern
void         adw_action_row_set_subtitle (AdwActionRow *self,
                                          const char   *subtitle);

ADW_DEPRECATED_IN_1_3_FOR (adw_action_row_add_prefix)
const char  *adw_action_row_get_icon_name (AdwActionRow *self);
ADW_DEPRECATED_IN_1_3_FOR (adw_action_row_add_prefix)
void         adw_action_row_set_icon_name (AdwActionRow *self,
                                           const char   *icon_name);

extern
GtkWidget *adw_action_row_get_activatable_widget (AdwActionRow *self);
extern
void       adw_action_row_set_activatable_widget (AdwActionRow *self,
                                                  GtkWidget    *widget);

extern
int  adw_action_row_get_title_lines (AdwActionRow *self);
extern
void adw_action_row_set_title_lines (AdwActionRow *self,
                                     int           title_lines);

extern
int  adw_action_row_get_subtitle_lines (AdwActionRow *self);
extern
void adw_action_row_set_subtitle_lines (AdwActionRow *self,
                                        int           subtitle_lines);
ADW_AVAILABLE_IN_1_3
gboolean
adw_action_row_get_subtitle_selectable (AdwActionRow *self);
ADW_AVAILABLE_IN_1_3
void
adw_action_row_set_subtitle_selectable (AdwActionRow *self,
                                        gboolean      subtitle_selectable);

extern
void adw_action_row_activate (AdwActionRow *self);


