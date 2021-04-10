Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "d.bat" & Chr(34), 0
Set WshShell = Nothing
Wscript.Quit