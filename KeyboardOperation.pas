unit KeyboardOperation;

interface

procedure performKeyPress(vk: Byte; sc: Byte; ext: Boolean; keyName: String);
procedure pressSpace;
procedure pressUpArrow;
procedure pressDownArrow;
procedure pressLeftArrow;
procedure pressRightArrow;
procedure pressEsc;
procedure pressEnter;
procedure pressKeypadMinus;

implementation

uses Windows, Unit1;

procedure performKeyPress(vk: Byte; sc: Byte; ext: Boolean; keyName: String);
var extFlag: Cardinal;
begin
  if ext then
    extFlag := KEYEVENTF_EXTENDEDKEY
  else
    extFlag := 0;

  keybd_event(vk, sc, extFlag, 0);
  Sleep(100);
  keybd_event(vk, sc, extFlag or KEYEVENTF_KEYUP, 0);
  Sleep(100);
end;

procedure pressSpace;
begin
  performKeyPress($20, $39, False, 'space');
end;

procedure pressUpArrow;
begin
  performKeyPress(VK_UP, $48, True, 'up');
end;

procedure pressDownArrow;
begin
  performKeyPress(VK_DOWN, $50, True, 'down');
end;

procedure pressLeftArrow;
begin
  performKeyPress(VK_LEFT, $4B, True, 'left');
end;

procedure pressRightArrow;
begin
  performKeyPress(VK_RIGHT, $4D, True, 'right');
end;

procedure pressEsc;
begin
  performKeyPress(VK_ESCAPE, $01, False, 'esc');
end;

procedure pressEnter;
begin
  performKeyPress(VK_RETURN, $1C, False, 'enter');
end;

procedure pressKeypadMinus;
begin
  performKeyPress(VK_SUBTRACT, $2D, True, 'minus');
end;

end.

