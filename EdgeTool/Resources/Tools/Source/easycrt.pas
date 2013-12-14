unit easycrt;

interface

uses dos,windows;

var SpecialKey,DoingNumChars: Boolean; DoingNumCode: Byte; ScanCode:char;
function ReadKey:char;

implementation

Function RemapScanCode (ScanCode: byte; CtrlKeyState: byte): byte;
var AltKey, CtrlKey, ShiftKey: boolean;
const CtrlKeypadKeys: array[$47..$53] of byte =
   ($77, $8D, $84, $8E, $73, $8F, $74, $4E, $75, $91, $76, $92, $93);
begin
 AltKey := ((CtrlKeyState AND
           (RIGHT_ALT_PRESSED OR LEFT_ALT_PRESSED)) > 0);
 CtrlKey := ((CtrlKeyState AND
           (RIGHT_CTRL_PRESSED OR LEFT_CTRL_PRESSED)) > 0);
 ShiftKey := ((CtrlKeyState AND SHIFT_PRESSED) > 0);

 if AltKey then
  begin
   case ScanCode of
   $02..$0D: inc(ScanCode, $76);
   // Function keys
   $3B..$44: inc(Scancode, $2D);
   $57..$58: inc(Scancode, $34);
   // Extended cursor block keys
   $47..$49, $4B, $4D, $4F..$53:
             inc(Scancode, $50);
   // Other keys
   $1C:      Scancode := $A6;   // Enter
   $35:      Scancode := $A4;   // / (keypad and normal!)
   end
  end
 else if CtrlKey then
   case Scancode of
   // Tab key
   $0F:      Scancode := $94;
   // Function keys
   $3B..$44: inc(Scancode, $23);
   $57..$58: inc(Scancode, $32);
   // Keypad keys
   $35:      Scancode := $95;   // \
   $37:      Scancode := $96;   // *
   $47..$53: Scancode := CtrlKeypadKeys[Scancode];
   //Enter on Numpad
   $1C:
   begin
     Scancode := $0A;
     SpecialKey := False;
   end;
   end
 else if ShiftKey then
   case Scancode of
   // Function keys
   $3B..$44: inc(Scancode, $19);
   $57..$58: inc(Scancode, $30);
   //Enter on Numpad
   $1C:
   begin
     Scancode := $0D;
     SpecialKey := False;
   end;
   end
 else
   case Scancode of
     // Function keys
     $57..$58: inc(Scancode, $2E); // F11 and F12
     //Enter on NumPad
     $1C:
       begin
         Scancode := $0D;
         SpecialKey := False;
       end;
 end;
 RemapScanCode := ScanCode;
end;
function KeyPressed : boolean;
var
  nevents,nread : dword;
  buf : TINPUTRECORD;
  AltKey: Boolean;
  c : longint;
begin
  KeyPressed := FALSE;
  if ScanCode <> #0 then
    KeyPressed := TRUE
  else
   begin
     GetNumberOfConsoleInputEvents(TextRec(input).Handle,nevents);
     while nevents>0 do
       begin
          ReadConsoleInputA(TextRec(input).Handle,buf,1,nread);
          if buf.EventType = KEY_EVENT then
            if buf.Event.KeyEvent.bKeyDown then
              begin
                 { Alt key is VK_MENU }
                 { Capslock key is VK_CAPITAL }

                 AltKey := ((Buf.Event.KeyEvent.dwControlKeyState AND
                            (RIGHT_ALT_PRESSED OR LEFT_ALT_PRESSED)) > 0);
                 if not(Buf.Event.KeyEvent.wVirtualKeyCode in [VK_SHIFT, VK_MENU, VK_CONTROL,
                                                      VK_CAPITAL, VK_NUMLOCK,
                                                      VK_SCROLL]) then
                   begin
                      keypressed:=true;

                      if (ord(buf.Event.KeyEvent.AsciiChar) = 0) or
                         (buf.Event.KeyEvent.dwControlKeyState and (LEFT_ALT_PRESSED or ENHANCED_KEY) > 0) then
                        begin
                           SpecialKey := TRUE;
                           ScanCode := Chr(RemapScanCode(Buf.Event.KeyEvent.wVirtualScanCode, Buf.Event.KeyEvent.dwControlKeyState));
                        end
                      else
                        begin
                           { Map shift-tab }
                           if (buf.Event.KeyEvent.AsciiChar=#9) and
                              (buf.Event.KeyEvent.dwControlKeyState and SHIFT_PRESSED > 0) then
                            begin
                              SpecialKey := TRUE;
                              ScanCode := #15;
                            end
                           else
                            begin
                              SpecialKey := FALSE;
                              ScanCode := Chr(Ord(buf.Event.KeyEvent.AsciiChar));
                            end;
                        end;

                      if AltKey then
                        begin
                           case Buf.Event.KeyEvent.wVirtualScanCode of
                             71 : c:=7;
                             72 : c:=8;
                             73 : c:=9;
                             75 : c:=4;
                             76 : c:=5;
                             77 : c:=6;
                             79 : c:=1;
                             80 : c:=2;
                             81 : c:=3;
                             82 : c:=0;
                           else
                             break;
                           end;
                           DoingNumChars := true;
                           DoingNumCode := Byte((DoingNumCode * 10) + c);
                           Keypressed := false;
                           Specialkey := false;
                           ScanCode := #0;
                        end
                      else
                        break;
                   end;
              end
             else
              begin
                if (Buf.Event.KeyEvent.wVirtualKeyCode in [VK_MENU]) then
               if DoingNumChars then
                 if DoingNumCode > 0 then
                   begin
                      ScanCode := Chr(DoingNumCode);
                      Keypressed := true;

                      DoingNumChars := false;
                      DoingNumCode := 0;
                      break
                   end; { if }
              end;
          { if we got a key then we can exit }
          if keypressed then
            exit;
          GetNumberOfConsoleInputEvents(TextRec(input).Handle,nevents);
       end;
   end;
end;
function ReadKey: char;
begin
  while (not KeyPressed) do
    Sleep(1);
  if SpecialKey then begin
    ReadKey := #0;
    SpecialKey := FALSE;
  end else begin
    ReadKey := ScanCode;
    ScanCode := #0;
  end;
end;


end.

