
{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkPicture, gtk_picture, GTK, PICTURE, GtkWidget) }
type
  TGtkPicture = record
  end;
  PGtkPicture = ^TGtkPicture;

  TGtkPictureClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkPictureClass = ^TGtkPictureClass;

function gtk_picture_get_type: TGType; cdecl; external libgtk4;
function gtk_picture_new: PGtkWidget; cdecl; external libgtk4;
function gtk_picture_new_for_paintable(paintable: PGdkPaintable): PGtkWidget; cdecl; external libgtk4;
function gtk_picture_new_for_pixbuf(pixbuf: PGdkPixbuf): PGtkWidget; cdecl; external libgtk4; deprecated 'GDK_DEPRECATED_IN_4_12_FOR(gtk_pixbuf_new_for_paintable)';
function gtk_picture_new_for_file(_file: PGFile): PGtkWidget; cdecl; external libgtk4;
function gtk_picture_new_for_filename(filename: PChar): PGtkWidget; cdecl; external libgtk4;
function gtk_picture_new_for_resource(resource_path: PChar): PGtkWidget; cdecl; external libgtk4;
procedure gtk_picture_set_paintable(self: PGtkPicture; paintable: PGdkPaintable); cdecl; external libgtk4;
function gtk_picture_get_paintable(self: PGtkPicture): PGdkPaintable; cdecl; external libgtk4;
procedure gtk_picture_set_file(self: PGtkPicture; _file: PGFile); cdecl; external libgtk4;
function gtk_picture_get_file(self: PGtkPicture): PGFile; cdecl; external libgtk4;
procedure gtk_picture_set_filename(self: PGtkPicture; filename: PChar); cdecl; external libgtk4;
procedure gtk_picture_set_resource(self: PGtkPicture; resource_path: PChar); cdecl; external libgtk4;
procedure gtk_picture_set_pixbuf(self: PGtkPicture; pixbuf: PGdkPixbuf); cdecl; external libgtk4; deprecated 'GDK_DEPRECATED_IN_4_12_FOR(gtk_picture_set_paintable)';
procedure gtk_picture_set_keep_aspect_ratio(self: PGtkPicture; keep_aspect_ratio: Tgboolean); cdecl; external libgtk4; deprecated 'GDK_DEPRECATED_IN_4_8_FOR(gtk_picture_set_content_fit)';
function gtk_picture_get_keep_aspect_ratio(self: PGtkPicture): Tgboolean; cdecl; external libgtk4; deprecated 'GDK_DEPRECATED_IN_4_8_FOR(gtk_picture_get_content_fit)';
procedure gtk_picture_set_can_shrink(self: PGtkPicture; can_shrink: Tgboolean); cdecl; external libgtk4;
function gtk_picture_get_can_shrink(self: PGtkPicture): Tgboolean; cdecl; external libgtk4;
procedure gtk_picture_set_content_fit(self: PGtkPicture; content_fit: TGtkContentFit); cdecl; external libgtk4;
function gtk_picture_get_content_fit(self: PGtkPicture): TGtkContentFit; cdecl; external libgtk4;
procedure gtk_picture_set_alternative_text(self: PGtkPicture; alternative_text: PChar); cdecl; external libgtk4;
function gtk_picture_get_alternative_text(self: PGtkPicture): PChar; cdecl; external libgtk4;

// === Konventiert am: 28-7-24 15:26:44 ===

function GTK_TYPE_PICTURE: TGType;
function GTK_PICTURE(obj: Pointer): PGtkPicture;
function GTK_IS_PICTURE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_PICTURE: TGType;
begin
  Result := gtk_picture_get_type;
end;

function GTK_PICTURE(obj: Pointer): PGtkPicture;
begin
  Result := PGtkPicture(g_type_check_instance_cast(obj, GTK_TYPE_PICTURE));
end;

function GTK_IS_PICTURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PICTURE);
end;




{$ENDIF read_implementation}
