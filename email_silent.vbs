If WScript.Arguments.Count = 0 Then
    WScript.Echo "Please provide the folder path as an argument."
    WScript.Quit
End If


Dim folderPath
folderPath = WScript.Arguments(0)

Dim shell
Set objShell = CreateObject("WScript.Shell")
objShell.Run "emailopener.bat""" & folderPath & """", 0, False

'Catch and dispatch, prevent to open a window while the bat running.