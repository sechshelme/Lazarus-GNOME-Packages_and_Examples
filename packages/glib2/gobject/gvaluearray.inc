/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 18-09-2024   17:42                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGValueArray = record
    n_values: Tguint;
    values: PGValue;
    n_prealloced: Tguint;
  end;
  PGValueArray = ^TGValueArray;
  PPGValueArray = ^PGValueArray;

function g_value_array_get_type: TGType; cdecl; external libgobject2_0;
function g_value_array_get_nth(value_array: PGValueArray; index_: Tguint): PGValue; cdecl; external libgobject2_0;
function g_value_array_new(n_prealloced: Tguint): PGValueArray; cdecl; external libgobject2_0;
procedure g_value_array_free(value_array: PGValueArray); cdecl; external libgobject2_0;
function g_value_array_copy(value_array: PGValueArray): PGValueArray; cdecl; external libgobject2_0;
function g_value_array_prepend(value_array: PGValueArray; Value: PGValue): PGValueArray; cdecl; external libgobject2_0;
function g_value_array_append(value_array: PGValueArray; Value: PGValue): PGValueArray; cdecl; external libgobject2_0;
function g_value_array_insert(value_array: PGValueArray; index_: Tguint; Value: PGValue): PGValueArray; cdecl; external libgobject2_0;
function g_value_array_remove(value_array: PGValueArray; index_: Tguint): PGValueArray; cdecl; external libgobject2_0;
function g_value_array_sort(value_array: PGValueArray; compare_func: TGCompareFunc): PGValueArray; cdecl; external libgobject2_0;
function g_value_array_sort_with_data(value_array: PGValueArray; compare_func: TGCompareDataFunc; user_data: Tgpointer): PGValueArray; cdecl; external libgobject2_0;

// === Konventiert am: 15-8-24 19:51:40 ===

function G_TYPE_VALUE_ARRAY: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_VALUE_ARRAY: TGType;
begin
  G_TYPE_VALUE_ARRAY := g_value_array_get_type;
end;



{$ENDIF read_implementation}