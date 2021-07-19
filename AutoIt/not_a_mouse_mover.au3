#include <Math.au3>
#include <MsgBoxConstants.au3>

HotKeySet("{F8}", "ExitProg")
Func ExitProg()
   Exit 0;
EndFunc

Local $origin_x = @DesktopWidth / 2;
Local $origin_y = @DesktopHeight / 2;
Local $r = _Min($origin_x, $origin_y) / 2;
Local $time_limit = InputBox("Time Limit", "Enter a time limit in minutes.", 60, "")
If Not StringIsInt($time_limit) Then
   $time_limit = 0
Else
   $time_limit = Abs(Number($time_limit)) * 60000 ; Sleep function accepts min value of 10 ms (excluding 0)
EndIf

Local $lower_bound = 0 ; 0 minutes - used to limit counter
Local $upper_bound = 60 * 60000 ; 60 minutes - used to limit counter
Local $theta = 1
Local $i = 1
While True
   Local $x = $origin_x + sin($theta / 7) * $r;
   Local $y = $origin_y + cos($theta / 7) * $r;

   MouseMove($x, $y, 0)

   Sleep(10)
   If ($time_limit == 0) And (($theta == $upper_bound) Or ($theta == $lower_bound)) Then
	  $i *= -1
   EndIf

   If ($time_limit <> 0) And ($theta >= $time_limit) Then
	  ExitLoop
   EndIf

   $theta += $i
WEnd
Exit 0;