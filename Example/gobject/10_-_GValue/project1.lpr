program project1;

// https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gva-S6LCnojdTAGMcpDG7p2hnQ

uses
  ctypes,
  fp_glib2;

  procedure printEnumValue(v: pgvalue);
  var
    enum_class: Pointer;
    enum_value: Tgint;
    enum_value_info: PGEnumValue;
  begin
    enum_class := G_ENUM_CLASS(g_type_class_ref(G_VALUE_TYPE(v)));
    enum_value := g_value_get_enum(v);
    WriteLn('value:', enum_value);
    enum_value_info := g_enum_get_value(enum_class, enum_value);
    if enum_class = nil then begin
      WriteLn('enum_class = nil');
    end;
    if enum_value_info = nil then begin
      WriteLn('enum_value_info = nil');
    end;
    g_printf('Value: %d  Name: %s  Nick: %s'#10, enum_value_info^.Value, enum_value_info^.value_name, enum_value_info^.value_nick);

    g_type_class_unref(enum_class);

  end;


  procedure printValue(v: PGValue);
  var
    typ: TGType;
    valueType, Value: string;
    Name: Pgchar;
  begin
    typ := G_VALUE_TYPE(v);
    Name := G_VALUE_TYPE_NAME(v);
    case typ of
      G_TYPE_INVALID: begin
        valueType := 'G_TYPE_INVALID';
      end;
      G_TYPE_NONE: begin
        valueType := 'G_TYPE_NONE';
      end;
      G_TYPE_INTERFACE: begin
        valueType := 'G_TYPE_INTERFACE';
      end;
      G_TYPE_CHAR: begin
        valueType := 'G_TYPE_CHAR';
        WriteStr(Value, char(g_value_get_char(v)));
      end;
      G_TYPE_UCHAR: begin
        valueType := 'G_TYPE_UCHAR';
        WriteStr(Value, Tguint8(g_value_get_char(v)));
      end;
      G_TYPE_BOOLEAN: begin
        valueType := 'G_TYPE_BOOLEAN';
        WriteStr(Value, g_value_get_boolean(v));
      end;
      G_TYPE_INT: begin
        valueType := 'G_TYPE_INT';
        WriteStr(Value, g_value_get_int(v));
      end;
      G_TYPE_UINT: begin
        valueType := 'G_TYPE_UINT';
        WriteStr(Value, g_value_get_uint(v));
      end;
      G_TYPE_LONG: begin
        valueType := 'G_TYPE_ULONG';
        WriteStr(Value, g_value_get_ulong(v));
      end;
      G_TYPE_ULONG: begin
        valueType := 'G_TYPE_LONG';
        WriteStr(Value, g_value_get_long(v));
      end;
      G_TYPE_INT64: begin
        valueType := 'G_TYPE_INT64';
        WriteStr(Value, g_value_get_int64(v));
      end;
      G_TYPE_UINT64: begin
        valueType := 'G_TYPE_UINT64';
        WriteStr(Value, g_value_get_uint64(v));
      end;
      G_TYPE_ENUM: begin
        valueType := 'G_TYPE_ENUM';
        WriteStr(Value, g_value_get_enum(v));
        printEnumValue(v);
      end;
      G_TYPE_FLAGS: begin
        valueType := 'G_TYPE_FLAGS';
        WriteStr(Value, g_value_get_flags(v));
      end;
      G_TYPE_FLOAT: begin
        valueType := 'G_TYPE_FLOAT';
        WriteStr(Value, g_value_get_float(v));
      end;
      G_TYPE_DOUBLE: begin
        valueType := 'G_TYPE_DOUBLE';
        WriteStr(Value, g_value_get_double(v));
      end;
      G_TYPE_STRING: begin
        valueType := 'G_TYPE_STRING';
        WriteStr(Value, g_value_get_string(v));
      end;
      G_TYPE_POINTER: begin
        valueType := 'G_TYPE_POINTER';
        WriteStr(Value, PtrUInt(g_value_get_pointer(v)));
      end;
      G_TYPE_BOXED: begin
        valueType := 'G_TYPE_BOXED';
        WriteStr(Value, PtrUInt(g_value_get_boxed(v)));
      end;
      G_TYPE_OBJECT: begin
        valueType := 'G_TYPE_OBJECT';
        WriteStr(Value, PtrUInt(g_value_get_object(v)));
      end;
      else begin
        WriteStr(valueType, '<unknow> (', typ, ')');
      end;
    end;
    WriteLn('Name: ', Name: 20, '  Valuetype: ', valueType: 15, '  Value: ', Value);
  end;

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gen-.cUon06lQ9evSF5g2V2Kyg

  procedure print_EnumValues(typ: TGType);
  var
    enum_class: PGEnumClass;
    i: integer;
    enumValue: PGEnumValue;
  begin
    enum_class := g_type_class_ref(typ);

    for i := 0 to enum_class^.n_values - 1 do begin
      enumValue := @enum_class^.values[i];
      g_printf('Value: %d  Name: %s  Nick: %s'#10, enumValue^.Value, enumValue^.value_name, enumValue^.value_nick);
    end;

    g_type_class_unref(enum_class);
  end;


  procedure EnumValue;
  const
    fruit_enum_values: array of TGEnumValue = (
      (Value: 0; value_name: 'FRUIT_APPLE'; value_nick: 'Apfel'),
      (Value: 1; value_name: 'FRUIT_BANANE'; value_nick: 'Banane'),
      (Value: 2; value_name: 'FRUIT_CHERRY'; value_nick: 'Kirsche'),
      (Value: 3; value_name: nil; value_nick: nil));
  var
    fruit_type: TGType;
    Value: TGValue;
  begin
    Value := G_VALUE_INIT_;
    g_value_init(@Value, G_TYPE_ENUM);
    g_value_set_enum(@Value, 1);
    printValue(@Value);
    g_value_unset(@Value);

    g_printf(#10'----- Enum Value ------'#10#10);
    fruit_type := g_enum_register_static('Fruit', PGEnumValue(fruit_enum_values));
    print_EnumValues(fruit_type);
  end;



  function main({%H-}argc: cint; {%H-}argv: PPChar): cint;
  var
    char_value, int_value, string_value, static_string_value, float_value,
    double_value: TGValue;
  begin
    char_value := G_VALUE_INIT_;
    g_value_init(@char_value, G_TYPE_CHAR);
    g_value_set_char(@char_value, 'W');
    printValue(@char_value);
    g_value_unset(@char_value);

    int_value := G_VALUE_INIT_;
    g_value_init(@int_value, G_TYPE_INT);
    g_value_set_int(@int_value, 123);
    printValue(@int_value);
    g_value_unset(@int_value);

    float_value := G_VALUE_INIT_;
    g_value_init(@float_value, G_TYPE_FLOAT);
    g_value_set_float(@float_value, 123.456);
    printValue(@float_value);
    g_value_unset(@float_value);

    double_value := G_VALUE_INIT_;
    g_value_init(@double_value, G_TYPE_DOUBLE);
    g_value_set_double(@double_value, 456.123);
    printValue(@double_value);
    g_value_unset(@double_value);

    string_value := G_VALUE_INIT_;
    g_value_init(@string_value, G_TYPE_STRING);
    g_value_set_string(@string_value, 'Hello gobject');
    printValue(@string_value);
    g_value_unset(@string_value);

    EnumValue;

    static_string_value := G_VALUE_INIT_;
    g_value_init(@static_string_value, G_TYPE_STRING);
    g_value_set_static_string(@static_string_value, 'Hello gobject static');
    printValue(@static_string_value);

    g_printf('String-Wert: %s'#10, g_value_get_string(@static_string_value));



    Exit(0);
  end;

begin
  main(argc, argv);
end.
