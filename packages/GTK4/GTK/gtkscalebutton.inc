
{$IFDEF read_interface}

type
  TGtkScaleButton = record
    parent_instance: TGtkWidget;
  end;
  PGtkScaleButton = ^TGtkScaleButton;

  TGtkScaleButtonClass = record
    parent_class: TGtkWidgetClass;
    value_changed: procedure(button: PGtkScaleButton; Value: Tdouble); cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  PGtkScaleButtonClass = ^TGtkScaleButtonClass;


function gtk_scale_button_get_type: TGType; cdecl; external libgtk4;
function gtk_scale_button_new(min: Tdouble; max: Tdouble; step: Tdouble; icons: PPchar): PGtkWidget; cdecl; external libgtk4;
procedure gtk_scale_button_set_icons(button: PGtkScaleButton; icons: PPchar); cdecl; external libgtk4;
function gtk_scale_button_get_value(button: PGtkScaleButton): Tdouble; cdecl; external libgtk4;
procedure gtk_scale_button_set_value(button: PGtkScaleButton; Value: Tdouble); cdecl; external libgtk4;
function gtk_scale_button_get_adjustment(button: PGtkScaleButton): PGtkAdjustment; cdecl; external libgtk4;
procedure gtk_scale_button_set_adjustment(button: PGtkScaleButton; adjustment: PGtkAdjustment); cdecl; external libgtk4;
function gtk_scale_button_get_plus_button(button: PGtkScaleButton): PGtkWidget; cdecl; external libgtk4;
function gtk_scale_button_get_minus_button(button: PGtkScaleButton): PGtkWidget; cdecl; external libgtk4;
function gtk_scale_button_get_popup(button: PGtkScaleButton): PGtkWidget; cdecl; external libgtk4;
function gtk_scale_button_get_active(button: PGtkScaleButton): Tgboolean; cdecl; external libgtk4;
function gtk_scale_button_get_has_frame(button: PGtkScaleButton): Tgboolean; cdecl; external libgtk4;
procedure gtk_scale_button_set_has_frame(button: PGtkScaleButton; has_frame: Tgboolean); cdecl; external libgtk4;

// === Konventiert am: 12-7-24 19:49:19 ===

function GTK_TYPE_SCALE_BUTTON: TGType;
function GTK_SCALE_BUTTON(obj: Pointer): PGtkScaleButton;
function GTK_SCALE_BUTTON_CLASS(klass: Pointer): PGtkScaleButtonClass;
function GTK_IS_SCALE_BUTTON(obj: Pointer): Tgboolean;
function GTK_IS_SCALE_BUTTON_CLASS(klass: Pointer): Tgboolean;
function GTK_SCALE_BUTTON_GET_CLASS(obj: Pointer): PGtkScaleButtonClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_SCALE_BUTTON: TGType;
begin
  GTK_TYPE_SCALE_BUTTON := gtk_scale_button_get_type;
end;

function GTK_SCALE_BUTTON(obj: Pointer): PGtkScaleButton;
begin
  Result := PGtkScaleButton(g_type_check_instance_cast(obj, GTK_TYPE_SCALE_BUTTON));
end;

function GTK_SCALE_BUTTON_CLASS(klass: Pointer): PGtkScaleButtonClass;
begin
  Result := PGtkScaleButtonClass(g_type_check_class_cast(klass, GTK_TYPE_SCALE_BUTTON));
end;

function GTK_IS_SCALE_BUTTON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SCALE_BUTTON);
end;

function GTK_IS_SCALE_BUTTON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_SCALE_BUTTON);
end;

function GTK_SCALE_BUTTON_GET_CLASS(obj: Pointer): PGtkScaleButtonClass;
begin
  Result := PGtkScaleButtonClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
