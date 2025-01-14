program project1;

uses
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  Human;


var
  mainloop: PGMainLoop = nil;

  procedure printChildHumanInc(Human: PEHuman);
  var
    fn, ln: Pgchar;
    age: Tgint;
    size: Tgfloat;
  begin
    g_object_get(Human,
      'firstname', @fn,
      'lastname', @ln,
      'age', @age,
      'size', @size,
      nil);

    g_print('%s %s    %d    %f'#10, fn, ln, age, size);
    g_free(fn);
    g_free(ln);
  end;

procedure age_cp(self: PGObject; Data: Tgpointer; user_data: Tgpointer); cdecl;
var
  human: PEHuman absolute self;
  age: Tgint;
begin
//  g_printf('data: %s'#10, Data);

  g_object_get(human, 'age', @age, nil);
  g_printerr('Alter: %3d.'#10#10, age);
end;

  procedure died_cp(self: PGObject; Data: Tgpointer); cdecl;
  begin
    g_printerr(#10'Max Alter erreicht.'#10#10);
    g_main_loop_quit(mainloop);
  end;

  procedure ChildHumanTimer;
  var
    Human: PEHuman;
  begin
    Human := g_object_new(E_TYPE_HUMAN,
      'firstname', 'Werner',
      'lastname', 'Otto',
      'age', 49,
      'size', Tgdouble(1.05),
      'timeon', gTrue,
      'time', 1,
      nil);

    GObjectShowProperty(Human);

    g_signal_connect(Human, 'inc-age', G_CALLBACK(@age_cp), GINT_TO_POINTER(123));
//    g_signal_connect(Human, 'inc-age::ten', G_CALLBACK(@age_cp), Human);
    g_signal_connect(Human, 'human-died', G_CALLBACK(@died_cp), nil);

    mainloop := g_main_loop_new(nil, False);
    g_main_loop_run(mainloop);
    g_main_loop_unref(mainloop);

    g_object_unref(Human);
  end;

begin
  ChildHumanTimer;
end.
