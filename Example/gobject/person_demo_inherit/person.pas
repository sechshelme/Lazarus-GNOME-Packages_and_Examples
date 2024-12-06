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
function EX_PERSON_CLASS(klass: Pointer): PExPersonClass;
function EX_IS_PERSON(obj: Pointer): Tgboolean;
function EX_IS_PERSON_CLASS(klass: Pointer): Tgboolean;
function EX_PERSON_GET_CLASS(obj: Pointer): PExPersonClass;


implementation

// https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-g-o-sduuvmf0RxeKRodE4r4f2A

var
  ex_person_parent_class: PGObjectClass = nil;

procedure Ex_person_set_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PExPerson;
begin
  self := EX_PERSON(object_);

  case property_id of
    1: begin
      g_free(self^.Name);
      self^.Name := g_value_dup_string(Value);
    end;
    2: begin
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

  case property_id of
    1: begin
      g_value_set_string(Value, self^.Name);
    end;
    2: begin
      g_value_set_int(Value, self^.age);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure Ex_person_finalize(object_: PGObject); cdecl;
var
  self: PExPerson;
begin
  self := EX_PERSON(object_);
  g_free(self^.Name);
  ex_person_parent_class^.finalize(object_);
end;

procedure Ex_person_init(self: PExPerson); cdecl;
begin
  self^.Name := nil;
  self^.age := 0;
end;

procedure Ex_person_class_init(klass: PExPersonClass); cdecl;
var
  object_class: PGObjectClass;
  pspec: PGParamSpec;
begin
  object_class := G_OBJECT_CLASS(klass);

  object_class^.finalize := @Ex_person_finalize;
  ex_person_parent_class := g_type_class_peek_parent(klass);

  object_class^.set_property := @Ex_person_set_property;
  object_class^.get_property := @Ex_person_get_property;

  pspec := g_param_spec_string('name', 'Name', 'Name of the person', nil, G_PARAM_READWRITE);
  g_object_class_install_property(object_class, 1, pspec);

  pspec := g_param_spec_int('age', 'Age', 'Age of the person', 0, 150, 0, G_PARAM_READWRITE);
  g_object_class_install_property(object_class, 2, pspec);

end;

function Ex_person_get_type: TGType;
const
  person_type: TGType = 0;
var
  type_info: TGTypeInfo;
begin
  if person_type = 0 then begin
    type_info.class_size := SizeOf(TExPersonClass);
    type_info.base_init := nil;
    type_info.base_finalize := nil;
    type_info.class_init := TGClassInitFunc(@Ex_person_class_init);
    type_info.class_finalize := nil;
    type_info.class_data := nil;
    type_info.instance_size := SizeOf(TExPerson);
    type_info.n_preallocs := 0;
    type_info.instance_init := TGInstanceInitFunc(@Ex_person_init);
    type_info.value_table := nil;

    person_type := g_type_register_static(G_TYPE_OBJECT, 'Person', @type_info, 0);
  end;
  Result := person_type;
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
  g_object_set(self, 'name', Name, nil);
end;

procedure Ex_person_set_age(self: PExPerson; age: Tgint);
begin
  g_object_set(self, 'age', age, nil);
end;

function Ex_person_get_name(self: PExPerson): Pgchar;
begin
  g_object_get(self, 'name', @Result, nil);
end;

function Ex_person_get_age(self: PExPerson): Tgint;
begin
  g_object_get(self, 'age', @Result, nil);
end;

// ====

function EX_TYPE_PERSON: TGType;
begin
  EX_TYPE_PERSON := ex_person_get_type;
end;

function EX_PERSON(obj: Pointer): PExPerson;
begin
  Result := PExPerson(g_type_check_instance_cast(obj, EX_TYPE_PERSON));
end;

function EX_PERSON_CLASS(klass: Pointer): PExPersonClass;
begin
  Result := PExPersonClass(g_type_check_class_cast(klass, EX_TYPE_PERSON));
end;

function EX_IS_PERSON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, EX_TYPE_PERSON);
end;

function EX_IS_PERSON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, EX_TYPE_PERSON);
end;

function EX_PERSON_GET_CLASS(obj: Pointer): PExPersonClass;
begin
  Result := PExPersonClass(PGTypeInstance(obj)^.g_class);
end;

end.
