program project1;

// https://freetype.org/freetype2/docs/tutorial/step1.html
// https://chromium.googlesource.com/chromium/src/third_party/freetype2/+/VER-2-BETA2/include/fterrors.h

// https://freetype.org/freetype2/docs/tutorial/example2.cpp

uses
  ctypes,
  fp_FreeType2;

const
  Width = 160;
  Height = 160;
var
  image: array [0..Height - 1, 0..Width] of char;

  procedure draw_bitmap(bitmap: PFT_Bitmap; x: TFT_Int; y: TFT_Int);
  var
    x_max, y_max, i, j, p, q: TFT_Int;
  begin
    x_max := x + bitmap^.Width;
    y_max := y + bitmap^.rows;

    i := x;
    p := 0;
    while (i < x_max) do begin
      Inc(i);
      Inc(p);

      j := y;
      q := 0;
      while (j < y_max) do begin
        Inc(j);
        Inc(q);

        if (i < 0) or (j < 0) or (i >= Width) or (j >= Height) then begin
          Continue;
        end;

        image[j, i] := char(bitmap^.buffer[q * bitmap^.Width + p]);
      end;
    end;
  end;

  procedure show_image;
  var
    i, j: Integer;
    ch: Char;
  begin
    for i := 0 to Height - 1 do begin
      for j := 0 to Width - 1 do begin
        case image[i,j] of
        #0 :ch:= ' ';
        #1..#127 :ch:= '+';
        #128..#255 :ch:= '*';
        end;
        Write(ch);
      end;
    end;
  end;

  procedure main;
  const
//    fileName = '/usr/share/fonts/truetype/freefont/FreeMono.ttf';
        fileName = '/usr/share/wine/fonts/courier.ttf';
    Text: PChar = 'Hello World';
  var
    lib: TFT_Library;
    face: TFT_Face;
    slot: TFT_GlyphSlot;

    pen: TFT_Vector;
    matrix: TFT_Matrix;

    error: TFT_Error;

    angle: double;
    target_height, n: integer;

  begin
    angle := (120.0 / 360) * Pi * 2;
    target_height := Height;

    error := FT_Init_FreeType(@lib);
    if error <> 0 then begin
      WriteLn('Fehler: ', error);
    end;

    error := FT_New_Face(lib, fileName, 0, @face);
    if error <> 0 then begin
      WriteLn('Fehler: ', error);
    end;

    //  error := FT_Set_Char_Size(face, 50 * 64,0,100,0);
    error := FT_Set_Char_Size(face, 50 * 15, 0, 150, 0);
    if error <> 0 then begin
      WriteLn('Fehler: Set_Char_Size   ', error);
    end;

    slot := face^.glyph;

    matrix.xx := Round(Cos(angle) * $10000);
    matrix.xy := Round(-Sin(angle) * $10000);
    matrix.yx := Round(Sin(angle) * $10000);
    matrix.yy := Round(Cos(angle) * $10000);

    pen.x := 100 * 64;
    pen.y := (target_height - 150) * 64;

    for n := 0 to Length(Text) - 1 do begin
      FT_Set_Transform(face, @matrix, @pen);

      error := FT_Load_Char(face, TFT_ULong(Text[n]), FT_LOAD_RENDER);
      if error <> 0 then begin
        WriteLn('Fehler: Load_Char   ', error);
      end;

      draw_bitmap(@slot^.bitmap, slot^.bitmap_left, target_height - slot^.bitmap_top);

      pen.x += slot^.advance.x;
      pen.y += slot^.advance.y;
    end;

    show_image;

    FT_Done_Face(face);
    FT_Done_FreeType(lib);
  end;


begin
  main;
end.
