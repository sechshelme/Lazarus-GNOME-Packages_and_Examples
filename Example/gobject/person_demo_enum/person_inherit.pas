unit Person_inherit;

interface

{$modeswitch advancedrecords on}

uses
  fp_glib2, Person;

type
  TExPersonExt = record
  private
    parent_instance: TExPerson;
    gender: integer;
  end;
  PExPersonExt = ^TExPersonExt;

  TExPersonExtClass = record
  private
    parent_class: TExPersonClass;
  end;
  PExPersonExtClass = ^TExPersonExtClass;

const
  GESCHLECHT_UNBEKANNT = 0;
  GESCHLECHT_MANN = 1;
  GESCHLECHT_FRAU = 2;

function Ex_personExt_get_type: TGType;
function Ex_personExt_new: PExPersonExt;
function Ex_personExt_new_with_data(Name: Pgchar; age: Tgint; gender: integer): PExPersonExt;
procedure Ex_personExt_set_gender(self: PExPersonExt; gender: integer);
function Ex_personExt_get_gender(self: PExPersonExt): integer;

function EX_TYPE_PERSONEXT: TGType;
function EX_PERSONEXT(obj: Pointer): PExPERSONEXT;
function EX_PERSONEXT_CLASS(klass: Pointer): PExPERSONEXTClass;
function EX_IS_PERSONEXT(obj: Pointer): Tgboolean;
function EX_IS_PERSONEXT_CLASS(klass: Pointer): Tgboolean;
function EX_PERSONEXT_GET_CLASS(obj: Pointer): PExPERSONEXTClass;


implementation

var
  ex_person_ext_parent_class: PExPersonClass = nil;


procedure Ex_personExt_set_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PExPersonExt;
begin
  self := EX_PERSONEXT(object_);
  case property_id of
    1: begin
      self^.gender := g_value_get_enum(Value);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure Ex_personExt_get_property(object_: PGObject; property_id: Tguint; Value: PGValue; pspec: PGParamSpec); cdecl;
var
  self: PExPersonExt;
begin
  self := EX_PERSONEXT(object_);
  case property_id of
    1: begin
      g_value_set_enum(Value, self^.gender);
    end;
    else begin
      G_OBJECT_WARN_INVALID_PROPERTY_ID(object_, property_id, pspec);
    end;
  end;
end;

procedure Ex_personExt_finalize(object_: PGObject); cdecl;
var
  self: PExPersonExt;
begin
  self := EX_PERSONEXT(object_);
  G_OBJECT_CLASS(ex_person_ext_parent_class)^.finalize(object_);
end;

procedure Ex_personExt_init(self: PExPersonExt); cdecl;
begin
  self^.gender := GESCHLECHT_UNBEKANNT;
end;

procedure Ex_personExt_class_init(klass: PExPersonExtClass); cdecl;
var
  object_class: PGObjectClass;
  spec: PGParamSpec;
  enumRegister: TGType;
  sv: array of TGEnumValue = (
    (Value: GESCHLECHT_UNBEKANNT; value_name: 'GESCHLECHT_UNBEKANNT'; value_nick: 'unbekannt'),
    (Value: GESCHLECHT_MANN; value_name: 'GESCHLECHT_MANN'; value_nick: 'mann'),
    (Value: GESCHLECHT_FRAU; value_name: 'GESCHLECHT_FRAU'; value_nick: 'frau'),
    (Value: 0; value_name: nil; value_nick: nil));
begin
  object_class := G_OBJECT_CLASS(klass);
  object_class^.set_property := @Ex_personExt_set_property;
  object_class^.get_property := @Ex_personExt_get_property;

  object_class^.finalize := @Ex_personExt_finalize;
  ex_person_ext_parent_class := g_type_class_peek_parent(klass);

  //  spec := g_param_spec_string('gender', 'Gender', 'Gender of the person', nil, G_PARAM_READWRITE);

  enumRegister := g_enum_register_static('Geschlecht', PGEnumValue(sv));

  spec := g_param_spec_enum('gender', 'Gender', 'Gender of the person', enumRegister, GESCHLECHT_UNBEKANNT, G_PARAM_READWRITE);
  g_object_class_install_property(object_class, 1, spec);
end;

function Ex_personExt_get_type: TGType;
const
  person_type: TGType = 0;
var
  type_info: TGTypeInfo;
begin
  if person_type = 0 then begin
    type_info.class_size := SizeOf(TExPersonExtClass);
    type_info.base_init := nil;
    type_info.base_finalize := nil;
    type_info.class_init := TGClassInitFunc(@Ex_personExt_class_init);
    type_info.class_finalize := nil;
    type_info.class_data := nil;
    type_info.instance_size := SizeOf(TExPersonExt);
    type_info.n_preallocs := 0;
    type_info.instance_init := TGInstanceInitFunc(@Ex_personExt_init);
    type_info.value_table := nil;

    person_type := g_type_register_static(EX_TYPE_PERSON, 'PersonExt', @type_info, 0);
  end;
  Result := person_type;
end;

function Ex_personExt_new: PExPersonExt;
begin
  Result := g_object_new(EX_TYPE_PERSONEXT, nil);
end;

function Ex_personExt_new_with_data(Name: Pgchar; age: Tgint; gender: integer
  ): PExPersonExt;
begin
  Result := g_object_new(EX_TYPE_PERSONEXT,
    'name', Name,
    'age', age,
    'gender', gender,
    nil);
end;

procedure Ex_personExt_set_gender(self: PExPersonExt; gender: integer);
begin
  self^.gender := gender;
end;

function Ex_personExt_get_gender(self: PExPersonExt): integer;
begin
  Result := self^.gender;
end;

// ====

function EX_TYPE_PERSONEXT: TGType;
begin
  EX_TYPE_PERSONEXT := ex_PERSONEXT_get_type;
end;

function EX_PERSONEXT(obj: Pointer): PExPERSONEXT;
begin
  Result := PExPERSONEXT(g_type_check_instance_cast(obj, EX_TYPE_PERSONEXT));
end;

function EX_PERSONEXT_CLASS(klass: Pointer): PExPERSONEXTClass;
begin
  Result := PExPERSONEXTClass(g_type_check_class_cast(klass, EX_TYPE_PERSONEXT));
end;

function EX_IS_PERSONEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, EX_TYPE_PERSONEXT);
end;

function EX_IS_PERSONEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, EX_TYPE_PERSONEXT);
end;

function EX_PERSONEXT_GET_CLASS(obj: Pointer): PExPERSONEXTClass;
begin
  Result := PExPERSONEXTClass(PGTypeInstance(obj)^.g_class);
end;

end.
