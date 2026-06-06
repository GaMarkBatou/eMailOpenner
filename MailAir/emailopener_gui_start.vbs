Option Explicit
Dim fso, shell, appDir, htaPath, mshta
Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")
appDir = fso.GetParentFolderName(WScript.ScriptFullName)
htaPath = appDir & "\emailopener_gui.hta"
mshta = shell.ExpandEnvironmentStrings("%windir%") & "\System32\mshta.exe"
If Not fso.FileExists(htaPath) Then
    MsgBox "Nem talalhato az emailopener_gui.hta ebben a mappaban:" & vbCrLf & appDir, vbCritical, "Email mappafigyelo"
    WScript.Quit 1
End If
shell.Run Chr(34) & mshta & Chr(34) & " " & Chr(34) & htaPath & Chr(34), 1, False
