
{$IFDEF read_interface}

function gdk_pixbuf_get_from_surface(surface:Pcairo_surface_t; src_x:longint; src_y:longint; width:longint; height:longint):PGdkPixbuf;cdecl;external libgtk4;
function gdk_pixbuf_get_from_texture(texture:PGdkTexture):PGdkPixbuf;cdecl;external libgtk4;

// === Konventiert am: 2-8-24 17:32:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
