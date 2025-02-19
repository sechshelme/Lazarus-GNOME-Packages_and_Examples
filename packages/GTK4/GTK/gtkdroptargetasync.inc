
{$IFDEF read_interface}

type
  TGtkDropTargetAsync = record // _GtkDropTargetAsync
  end;
  PGtkDropTargetAsync = ^TGtkDropTargetAsync;

  TGtkDropTargetAsyncClass = record // _GtkDropTargetAsyncClass
  end;
  PGtkDropTargetAsyncClass = ^TGtkDropTargetAsyncClass;

function gtk_drop_target_async_get_type: TGType; cdecl; external libgtk4;
function gtk_drop_target_async_new(formats: PGdkContentFormats; actions: TGdkDragAction): PGtkDropTargetAsync; cdecl; external libgtk4;
procedure gtk_drop_target_async_set_formats(self: PGtkDropTargetAsync; formats: PGdkContentFormats); cdecl; external libgtk4;
function gtk_drop_target_async_get_formats(self: PGtkDropTargetAsync): PGdkContentFormats; cdecl; external libgtk4;
procedure gtk_drop_target_async_set_actions(self: PGtkDropTargetAsync; actions: TGdkDragAction); cdecl; external libgtk4;
function gtk_drop_target_async_get_actions(self: PGtkDropTargetAsync): TGdkDragAction; cdecl; external libgtk4;
procedure gtk_drop_target_async_reject_drop(self: PGtkDropTargetAsync; drop: PGdkDrop); cdecl; external libgtk4;

// === Konventiert am: 25-7-24 18:17:53 ===

function GTK_TYPE_DROP_TARGET_ASYNC: TGType;
function GTK_DROP_TARGET_ASYNC(obj: Pointer): PGtkDropTargetAsync;
function GTK_DROP_TARGET_ASYNC_CLASS(klass: Pointer): PGtkDropTargetAsyncClass;
function GTK_IS_DROP_TARGET_ASYNC(obj: Pointer): Tgboolean;
function GTK_IS_DROP_TARGET_ASYNC_CLASS(klass: Pointer): Tgboolean;
function GTK_DROP_TARGET_ASYNC_GET_CLASS(obj: Pointer): PGtkDropTargetAsyncClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_DROP_TARGET_ASYNC: TGType;
begin
  GTK_TYPE_DROP_TARGET_ASYNC := gtk_drop_target_async_get_type;
end;

function GTK_DROP_TARGET_ASYNC(obj: Pointer): PGtkDropTargetAsync;
begin
  Result := PGtkDropTargetAsync(g_type_check_instance_cast(obj, GTK_TYPE_DROP_TARGET_ASYNC));
end;

function GTK_DROP_TARGET_ASYNC_CLASS(klass: Pointer): PGtkDropTargetAsyncClass;
begin
  Result := PGtkDropTargetAsyncClass(g_type_check_class_cast(klass, GTK_TYPE_DROP_TARGET_ASYNC));
end;

function GTK_IS_DROP_TARGET_ASYNC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_DROP_TARGET_ASYNC);
end;

function GTK_IS_DROP_TARGET_ASYNC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_DROP_TARGET_ASYNC);
end;

function GTK_DROP_TARGET_ASYNC_GET_CLASS(obj: Pointer): PGtkDropTargetAsyncClass;
begin
  Result := PGtkDropTargetAsyncClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
