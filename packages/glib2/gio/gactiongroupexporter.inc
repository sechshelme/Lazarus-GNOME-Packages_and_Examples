
{$IFDEF read_interface}

function g_dbus_connection_export_action_group(connection: PGDBusConnection; object_path: Pgchar; action_group: PGActionGroup; error: PPGError): Tguint; cdecl; external libgio2;
procedure g_dbus_connection_unexport_action_group(connection: PGDBusConnection; export_id: Tguint); cdecl; external libgio2;

// === Konventiert am: 20-8-24 15:49:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
