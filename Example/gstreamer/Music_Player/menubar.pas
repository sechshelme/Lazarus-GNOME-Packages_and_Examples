unit MenuBar;

interface

uses  Classes, SysUtils, Menus, Graphics,
  Common;

type
  TMenuBarEvent = procedure(cmd: Tcommand) of object;

  TMenuBar = class(TMainMenu)
  private
    FOnMenuBarEvent: TMenuBarEvent;
    procedure MenuBarClick(Sender: TObject);
    procedure AddMenuFromProps(ACaption: string; props: TcmdProps);
  public
    property OnMenuBarEvent: TMenuBarEvent read FOnMenuBarEvent write FOnMenuBarEvent;
    constructor Create(AOwner: TComponent); override;
  end;


implementation

constructor TMenuBar.Create(AOwner: TComponent);
var
  mmi: TMenuItem;
begin
  inherited Create(AOwner);

  // --- Datei
  AddMenuFromProps('&Datei', FileCmdProb);

  // --- Edit
  AddMenuFromProps('&Edit', EditCmdProb);

  // --- Play
  AddMenuFromProps('&Play', PlayCmdProp);


  // --- Optionen
  mmi := TMenuItem.Create(self);
  mmi.Caption := '&Optionen';
  Items.Add(mmi);

  // --- Hilfe
  AddMenuFromProps('&Hilfe', HelpCmdProp);

end;

procedure TMenuBar.MenuBarClick(Sender: TObject);
begin
  if OnMenuBarEvent <> nil then  begin
    OnMenuBarEvent(Tcommand(TMainMenu(Sender).Tag));
  end;
end;

procedure TMenuBar.AddMenuFromProps(ACaption: string; props: TcmdProps);
var
  mmi, smi: TMenuItem;
  i: integer;
  pic: TPicture;
  path: string;
begin
  mmi := TMenuItem.Create(Self);
  mmi.Caption := ACaption;
  Items.Add(mmi);

  pic := TPicture.Create;
  for i := 0 to Length(props) - 1 do begin
    smi := TMenuItem.Create(self);
    smi.Caption := props[i].Caption;
    path := 'png/' + props[i].IconPath + '.png';
    if FileExists(path) then  begin
      pic.LoadFromFile('png/' + props[i].IconPath + '.png');
    end;
    smi.Bitmap := pic.Bitmap;
    smi.Tag := PtrInt(props[i].cmd);
    smi.OnClick := @MenuBarClick;
    mmi.Add(smi);
  end;
  pic.Free;
end;

end.
