unit Human_Parent;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2;

type
  TEHuman = record
  private
    parent_instance: TGObject;
    Name: Pgchar;
    age: Tgint;
  end;
  PEHuman = ^TEHuman;

  TEHumanClass = record
  private
    parent_class: TGObjectClass;
  end;
  PEHumanClass = ^TEHumanClass;

function e_human_get_type: TGType;
function e_human_new: PEHuman;
function e_human_new_with_data(Name: Pgchar; age: Tgint): PEHuman;
procedure e_human_set_name(self: PEHuman; Name: Pgchar);
procedure e_human_set_age(self: PEHuman; age: Tgint);
function e_human_get_name(self: PEHuman): Pgchar;
function e_human_get_age(self: PEHuman): Tgint;

function E_TYPE_HUMAN: TGType;
function E_HUMAN(obj: Pointer): PEHuman;
function E_HUMAN_CLASS(klass: Pointer): PEHumanClass;
function E_IS_HUMAN(obj: Pointer): Tgboolean;
function E_IS_HUMAN_CLASS(klass: Pointer): Tgboolean;
function E_HUMAN_GET_CLASS(obj: Pointer): PEHumanClass;


implementation

type
  Tobj_propertie = (PROP_0, PROP_NAME, PROP_AGE);

var
  obj_properties: array[Tobj_propertie] of PGParamSpec = (nil, nil, nil);
  e_human_parent_class: PGObjectClass = nil;

procedure e_human_set_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PEHuman;
begin
  self := E_HUMAN(object_);

  case Tobj_propertie(property_id) of
    PROP_NAME: begin
      if self^.Name <> nil then  begin
        g_free(self^.Name);
      end;
      self^.Name := g_value_dup_string(Value);
    end;
    PROP_AGE: begin
      self^.age := g_value_get_int(Value);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure e_human_get_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PEHuman;
begin
  self := E_HUMAN(object_);

  case Tobj_propertie(property_id) of
    PROP_NAME: begin
      g_value_set_string(Value, self^.Name);
    end;
    PROP_AGE: begin
      g_value_set_int(Value, self^.age);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure e_human_finalize(object_: PGObject); cdecl;
var
  self: PEHuman;
begin
  self := E_HUMAN(object_);
  g_free(self^.Name);
  e_human_parent_class^.finalize(object_);
end;

procedure e_human_init(self: PEHuman); cdecl;
begin
  self^.Name := nil;
  self^.age := 0;
end;

procedure e_human_class_init(klass: PEHumanClass); cdecl;
var
  object_class: PGObjectClass;
begin
  object_class := G_OBJECT_CLASS(klass);

  object_class^.finalize := @e_human_finalize;
  e_human_parent_class := g_type_class_peek_parent(klass);

  object_class^.set_property := @e_human_set_property;
  object_class^.get_property := @e_human_get_property;

  obj_properties[PROP_NAME] := g_param_spec_string('name', 'Name', 'Name of the human', nil, G_PARAM_READWRITE);
  obj_properties[PROP_AGE] := g_param_spec_int('age', 'Age', 'Age of the human', 0, 150, 0, G_PARAM_READWRITE);

  g_object_class_install_properties(object_class, Length(obj_properties), obj_properties);
end;

function e_human_get_type: TGType;
const
  human_type: TGType = 0;
var
  type_info: TGTypeInfo;
begin
  if human_type = 0 then begin
    type_info.class_size := SizeOf(TEHumanClass);
    type_info.base_init := nil;
    type_info.base_finalize := nil;
    type_info.class_init := TGClassInitFunc(@e_human_class_init);
    type_info.class_finalize := nil;
    type_info.class_data := nil;
    type_info.instance_size := SizeOf(TEHuman);
    type_info.n_preallocs := 0;
    type_info.instance_init := TGInstanceInitFunc(@e_human_init);
    type_info.value_table := nil;

    human_type := g_type_register_static(G_TYPE_OBJECT, 'Person', @type_info, 0);
  end;
  Result := human_type;
end;

function e_human_new: PEHuman;
begin
  Result := g_object_new(E_TYPE_HUMAN, nil);
end;

function e_human_new_with_data(Name: Pgchar; age: Tgint): PEHuman;
begin
  Result := g_object_new(E_TYPE_HUMAN,
    'name', Name,
    'age', age,
    nil);
end;

procedure e_human_set_name(self: PEHuman; Name: Pgchar);
begin
  g_object_set(self, 'name', Name, nil);
end;

function e_human_get_name(self: PEHuman): Pgchar;
begin
  Result := self^.Name;
end;

procedure e_human_set_age(self: PEHuman; age: Tgint);
begin
  self^.age := age;
end;

function e_human_get_age(self: PEHuman): Tgint;
begin
  Result := self^.age;
end;

// ====

function E_TYPE_HUMAN: TGType;
begin
  E_TYPE_HUMAN := e_human_get_type;
end;

function E_HUMAN(obj: Pointer): PEHuman;
begin
  Result := PEHuman(g_type_check_instance_cast(obj, E_TYPE_HUMAN));
end;

function E_HUMAN_CLASS(klass: Pointer): PEHumanClass;
begin
  Result := PEHumanClass(g_type_check_class_cast(klass, E_TYPE_HUMAN));
end;

function E_IS_HUMAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, E_TYPE_HUMAN);
end;

function E_IS_HUMAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, E_TYPE_HUMAN);
end;

function E_HUMAN_GET_CLASS(obj: Pointer): PEHumanClass;
begin
  Result := PEHumanClass(PGTypeInstance(obj)^.g_class);
end;

end.
