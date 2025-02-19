
{$IFDEF read_interface}

type
  TGtkSpinner = record // _GtkSpinner
  end;
  PGtkSpinner = ^TGtkSpinner;

function gtk_spinner_get_type: TGType; cdecl; external libgtk4;
function gtk_spinner_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_spinner_start(spinner: PGtkSpinner); cdecl; external libgtk4;
procedure gtk_spinner_stop(spinner: PGtkSpinner); cdecl; external libgtk4;
procedure gtk_spinner_set_spinning(spinner: PGtkSpinner; spinning: Tgboolean); cdecl; external libgtk4;
function gtk_spinner_get_spinning(spinner: PGtkSpinner): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 23-7-24 13:37:49 ===

function GTK_TYPE_SPINNER: TGType;
function GTK_SPINNER(obj: Pointer): PGtkSpinner;
function GTK_IS_SPINNER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_SPINNER: TGType;
begin
  GTK_TYPE_SPINNER := gtk_spinner_get_type;
end;

function GTK_SPINNER(obj: Pointer): PGtkSpinner;
begin
  Result := PGtkSpinner(g_type_check_instance_cast(obj, GTK_TYPE_SPINNER));
end;

function GTK_IS_SPINNER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SPINNER);
end;



{$ENDIF read_implementation}
