program project1;

uses
  ctypes,
  fp_glib2,
  fp_JSC;


  // https://www.perplexity.ai/search/was-ist-jsc-welchec-bei-webkit-w5K_F7JCQYixjpJh3a5keA
  // https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-jsc-j-ARF1Y9AFQV6kRFIksS0VNQ
  // https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-jsc-v-TXYuwmmLTsSLI7M10Ej7OQ
  // https://www.perplexity.ai/search/gib-mir-ein-beispiel-mit-jsc-c-z85crXFFSRGoORU8.EYtwA

  procedure print_value(Value: PJSCValue);
  var
    s: pchar;
    num: Tdouble;
    b: Tgboolean;
  begin
    if jsc_value_is_string(Value) then begin
      s := jsc_value_to_string(Value);
      g_printf('String: %s'#10, s);
      g_free(s);
    end else if jsc_value_is_number(Value) then begin
      num := jsc_value_to_double(Value);
      g_printf('Number: %4.2f'#10, num);
    end else if jsc_value_is_boolean(Value) then begin
      b := jsc_value_to_boolean(Value);
      g_printf('Boolean: %d'#10, b);
    end else if jsc_value_is_null(Value) then begin
      b := jsc_value_to_boolean(Value);
      g_printf('(NULL)'#10);
    end else begin
      g_printf('Unhandled type'#10);
    end;
  end;


  function main(argc: cint; argv: PPChar): cint;
  const
    script: pchar =
//      'var x = 10; var y = 20; x + y;';
    'x + y';
  var
    context: PJSCContext;
    res, x, y: PJSCValue;
    Exception: PJSCException;
    error_message: pchar;
  begin
    context := jsc_context_new;

    x:=   jsc_value_new_number(context, 11.22);
    jsc_context_set_value(context,'x', x);

    y:=   jsc_value_new_number(context, 22.33);
    jsc_context_set_value(context,'y', y);

    res := jsc_context_evaluate(context, script, -1);

    if jsc_context_get_exception(context) <> nil then begin
      Exception := jsc_context_get_exception(context);
      error_message := jsc_exception_get_message(Exception);
      g_printf('Exception: %s'#10, error_message);
    end else begin
        print_value(res);
    end;

    g_object_unref(res);
    g_object_unref(x);
    g_object_unref(y);
    g_object_unref(context);
  end;

begin
  main(argc, argv);
end.
