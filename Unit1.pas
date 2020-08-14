unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    //hotKeyId01, hotKeyId02: Integer;
    procedure HotKeyDown(var Msg: TMessage); message WM_HOTKEY;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses KeyboardOperation;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if GetKeyState(VK_SCROLL) <> 0 then
  begin
    Label1.Caption := 'ON';
    pressKeypadMinus;
  end
  else
  begin
    Label1.Caption := 'OFF';
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
{
  hotKeyId01 := GlobalAddAtom('MyHotKey01') - $C000;
  hotKeyId02 := GlobalAddAtom('MyHotKey02') - $C000;
  RegisterHotKey(Handle, hotKeyId01, MOD_CONTROL, VK_SUBTRACT);
  RegisterHotKey(Handle, hotKeyId02, MOD_CONTROL, VK_ADD);
}
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{
  UnRegisterHotKey(handle, hotKeyId01);
  UnRegisterHotKey(handle, hotKeyId02);
}
end;

procedure TForm1.HotKeyDown(var Msg: TMessage);
begin
{
  if (Msg.LparamLo = MOD_CONTROL) and (Msg.LParamHi = VK_SUBTRACT) then
  begin
    Label1.Caption := 'ON';
    Timer1.Enabled := True;
  end
  else if (Msg.LparamLo = MOD_CONTROL) and (Msg.LParamHi = VK_ADD) then
  begin
    Label1.Caption := 'OFF';
    Timer1.Enabled := False;
  end;
}
end;

end.

