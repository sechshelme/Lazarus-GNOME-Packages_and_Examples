
{$IFDEF read_interface}

function GDK_XID_TO_POINTER(xid: Tguint): Pointer;
function GDK_POINTER_TO_XID(p: Pointer): Tguint;


// === Konventiert am: 3-8-24 17:51:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GDK_XID_TO_POINTER(xid: Tguint): Pointer;
begin
  Result := Pointer(xid);
end;

function GDK_POINTER_TO_XID(p: Pointer): Tguint;
begin
  GDK_POINTER_TO_XID := Tguint(p);
end;


{$ENDIF read_implementation}
