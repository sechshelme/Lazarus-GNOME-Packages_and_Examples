
{$IFDEF read_interface}

type
  TGdkCursor = record
  end;
  PGdkCursor = ^TGdkCursor;

function gdk_cursor_get_type: TGType; cdecl; external libgtk4;
function gdk_cursor_new_from_texture(texture: PGdkTexture; hotspot_x: longint; hotspot_y: longint; fallback: PGdkCursor): PGdkCursor; cdecl; external libgtk4;
function gdk_cursor_new_from_name(Name: PChar; fallback: PGdkCursor): PGdkCursor; cdecl; external libgtk4;
function gdk_cursor_get_fallback(cursor: PGdkCursor): PGdkCursor; cdecl; external libgtk4;
function gdk_cursor_get_name(cursor: PGdkCursor): PChar; cdecl; external libgtk4;
function gdk_cursor_get_texture(cursor: PGdkCursor): PGdkTexture; cdecl; external libgtk4;
function gdk_cursor_get_hotspot_x(cursor: PGdkCursor): longint; cdecl; external libgtk4;
function gdk_cursor_get_hotspot_y(cursor: PGdkCursor): longint; cdecl; external libgtk4;

// === Konventiert am: 2-8-24 15:10:26 ===

function GDK_TYPE_CURSOR: TGType;
function GDK_CURSOR(obj: Pointer): PGdkCursor;
function GDK_IS_CURSOR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_CURSOR: TGType;
begin
  GDK_TYPE_CURSOR := gdk_cursor_get_type;
end;

function GDK_CURSOR(obj: Pointer): PGdkCursor;
begin
  Result := PGdkCursor(g_type_check_instance_cast(obj, GDK_TYPE_CURSOR));
end;

function GDK_IS_CURSOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_CURSOR);
end;



{$ENDIF read_implementation}
