/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gdk_x11_get_xatom_by_name_for_display(display:PGdkDisplay; atom_name:Pchar):TAtom;cdecl;external libgtk4;
function gdk_x11_get_xatom_name_for_display(display:PGdkDisplay; xatom:TAtom):Pchar;cdecl;external libgtk4;

// === Konventiert am: 3-8-24 17:42:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}