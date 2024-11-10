unit gdkrectangle;

interface

uses
  common_GTK;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TGdkRectangle = record
  end;
  PGdkRectangle = ^TGdkRectangle;

function gdk_rectangle_intersect(src1: PGdkRectangle; src2: PGdkRectangle; dest: PGdkRectangle): Tgboolean; cdecl; external libgtk4;
procedure gdk_rectangle_union(src1: PGdkRectangle; src2: PGdkRectangle; dest: PGdkRectangle); cdecl; external libgtk4;
function gdk_rectangle_equal(rect1: PGdkRectangle; rect2: PGdkRectangle): Tgboolean; cdecl; external libgtk4;
function gdk_rectangle_contains_point(rect: PGdkRectangle; x: longint; y: longint): Tgboolean; cdecl; external libgtk4;
function gdk_rectangle_get_type: TGType; cdecl; external libgtk4;

// === Konventiert am: 2-8-24 17:23:46 ===

function GDK_TYPE_RECTANGLE: TGType;

implementation

function GDK_TYPE_RECTANGLE: TGType;
begin
  GDK_TYPE_RECTANGLE := gdk_rectangle_get_type;
end;



end.