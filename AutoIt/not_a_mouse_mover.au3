HotKeySet("{F8}", "ExitProg")

Local $origin_x = @DesktopWidth / 2
Local $origin_y = @DesktopHeight / 2
If @DesktopHeight < @DesktopWidth Then
   Local @r = @DesktopHeight / 2
Else
   Local @r = @DesktopWidth / 2
EndIf
Local $time_limit_minutes = InputBox("Time Limit", "Enter a time limit in minutes.", 60, "")

MsgBox($time_limit_minutes)
MsgBox($time_limit_minutes += 20)

Func ExitProg()
   Exit 0;
EndFunc

Local $i = 0
While True
   $i += 1
   Local $theta = $i
   Local $x = $origin_x + sin($theta / 7) * $r;
   Local $y = $origin_y + cos($theta / 7) * $r;

   MouseMove($x, $y, 0)

   Sleep(10)
   If $i > $time_limit_minutes Then
	  Exit 0
   EndIf
WEnd