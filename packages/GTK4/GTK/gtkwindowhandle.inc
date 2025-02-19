
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkWindowHandle, gtk_window_handle, GTK, WINDOW_HANDLE, GtkWidget) }
type
  TGtkWindowHandle = record
  end;
  PGtkWindowHandle = ^TGtkWindowHandle;

  TGtkWindowHandleClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkWindowHandleClass = ^TGtkWindowHandleClass;

function gtk_window_handle_get_type: TGType; cdecl; external libgtk4;
function gtk_window_handle_new: PGtkWidget; cdecl; external libgtk4;
function gtk_window_handle_get_child(self: PGtkWindowHandle): PGtkWidget; cdecl; external libgtk4;
procedure gtk_window_handle_set_child(self: PGtkWindowHandle; child: PGtkWidget); cdecl; external libgtk4;

// === Konventiert am: 27-7-24 19:22:58 ===

function GTK_TYPE_WINDOW_HANDLE: TGType;
function GTK_WINDOW_HANDLE(obj: Pointer): PGtkWindowHandle;
function GTK_IS_WINDOW_HANDLE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_WINDOW_HANDLE: TGType;
begin
  Result := gtk_window_handle_get_type;
end;

function GTK_WINDOW_HANDLE(obj: Pointer): PGtkWindowHandle;
begin
  Result := PGtkWindowHandle(g_type_check_instance_cast(obj, GTK_TYPE_WINDOW_HANDLE));
end;

function GTK_IS_WINDOW_HANDLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_WINDOW_HANDLE);
end;




{$ENDIF read_implementation}
