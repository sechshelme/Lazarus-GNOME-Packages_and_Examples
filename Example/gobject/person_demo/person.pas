unit Person;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2;

type
  TExPerson = record
    private
    parent_instance: TGObject;
    Name: Pgchar;
    age: Tgint;
  end;
  PExPerson = ^TExPerson;

  TExPersonClass = record
    private
    parent_class: TGObjectClass;
  end;
  PExPersonClass = ^TExPersonClass;

function Ex_person_get_type: TGType;
function Ex_person_new: PExPerson;
function Ex_person_new_with_data(Name: Pgchar; age: Tgint): PExPerson;
procedure Ex_person_set_name(self: PExPerson; Name: Pgchar);
procedure Ex_person_set_age(self: PExPerson; age: Tgint);
function Ex_person_get_name(self: PExPerson): Pgchar;
function Ex_person_get_age(self: PExPerson): Tgint;

function EX_TYPE_PERSON: TGType;
function EX_PERSON(obj: Pointer): PExPerson;
function EX_IS_PERSON(obj: Pointer): Tgboolean;


implementation

type
  Tobj_propertie = (PROP_0, PROP_NAME, PROP_AGE);

var
  obj_properties: array[Tobj_propertie] of PGParamSpec = (nil, nil, nil);

procedure Ex_person_set_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PExPerson;
begin
  self := EX_PERSON(object_);

  case Tobj_propertie(property_id) of
    PROP_NAME: begin
      g_free(self^.Name);
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

procedure Ex_person_get_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PExPerson;
begin
  self := EX_PERSON(object_);

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

procedure Ex_person_init(self: PExPerson); cdecl;
begin
  self^.Name := nil;
  self^.age := 0;
end;

procedure Ex_person_class_init(klass: PExPersonClass); cdecl;
var
  object_class: PGObjectClass;
begin
  object_class := G_OBJECT_CLASS(klass);

  object_class^.set_property := @Ex_person_set_property;
  object_class^.get_property := @Ex_person_get_property;

  obj_properties[PROP_NAME] := g_param_spec_string('name', 'Name', 'Name of the person', nil, G_PARAM_READWRITE);
  obj_properties[PROP_AGE] := g_param_spec_int('age', 'Age', 'Age of the person', 0, 150, 0, G_PARAM_READWRITE);

  g_object_class_install_properties(object_class, Length(obj_properties), obj_properties);
end;

function Ex_person_get_type: TGType;
const
  person_type_id: Tgsize = 0;
var
  type_id: TGType;
  info: TGTypeInfo;
begin
  if g_once_init_enter(@person_type_id) then begin
    info.class_size := SizeOf(TExPersonClass);
    info.base_init := nil;
    info.base_finalize := nil;
    info.class_init := TGClassInitFunc(@Ex_person_class_init);
    info.class_finalize := nil;
    info.class_data := nil;
    info.instance_size := SizeOf(TExPerson);
    info.n_preallocs := 0;
    info.instance_init := TGInstanceInitFunc(@Ex_person_init);
    info.value_table := nil;

    type_id := g_type_register_static(G_TYPE_OBJECT, 'Person', @info, 0);
    g_once_init_leave(@person_type_id, type_id);
  end;
  Result := person_type_id;
end;

function Ex_person_new: PExPerson;
begin
  Result := g_object_new(EX_TYPE_PERSON, nil);
end;

function Ex_person_new_with_data(Name: Pgchar; age: Tgint): PExPerson;
begin
  Result := g_object_new(EX_TYPE_PERSON,
    'name', Name,
    'age', age,
    nil);
end;

procedure Ex_person_set_name(self: PExPerson; Name: Pgchar);
begin
  g_free(self^.Name);
  self^.Name := g_strdup(Name);
end;

procedure Ex_person_set_age(self: PExPerson; age: Tgint);
begin
  self^.age := age;
end;

function Ex_person_get_name(self: PExPerson): Pgchar;
begin
  Result := self^.Name;
end;

function Ex_person_get_age(self: PExPerson): Tgint;
begin
  Result := self^.age;
end;

// ====

function EX_TYPE_PERSON: TGType;
begin
  Result := Ex_person_get_type;
end;

function EX_PERSON(obj: Pointer): PExPerson;
begin
  Result := PExPerson(g_type_check_instance_cast(obj, EX_TYPE_PERSON));
end;

function EX_IS_PERSON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, EX_TYPE_PERSON);
end;

end.