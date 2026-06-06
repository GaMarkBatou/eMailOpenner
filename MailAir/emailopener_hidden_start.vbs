Option Explicit

Dim fso, shell, appDir, configPath, batPath, exitPath, folderPath, cmd
Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

appDir = fso.GetParentFolderName(WScript.ScriptFullName)
configPath = appDir & "\emailopener_config.ini"
batPath = appDir & "\emailopener.bat"
exitPath = appDir & "\exit.txt"
folderPath = ReadConfigValue(configPath, "folder")

If folderPath = "" Then WScript.Quit 1
If Not fso.FileExists(batPath) Then WScript.Quit 2
If Not fso.FolderExists(folderPath) Then WScript.Quit 3

On Error Resume Next
If fso.FileExists(exitPath) Then fso.DeleteFile exitPath, True
On Error GoTo 0

cmd = "cmd.exe /c cd /d """ & appDir & """ && """ & batPath & """ """ & folderPath & """"
shell.Run cmd, 0, False

Function ReadConfigValue(path, key)
    Dim file, line, p, k, v
    ReadConfigValue = ""
    If Not fso.FileExists(path) Then Exit Function
    Set file = fso.OpenTextFile(path, 1, False)
    Do Until file.AtEndOfStream
        line = file.ReadLine
        p = InStr(line, "=")
        If p > 0 Then
            k = Left(line, p - 1)
            v = Mid(line, p + 1)
            If LCase(k) = LCase(key) Then
                ReadConfigValue = v
                file.Close
                Exit Function
            End If
        End If
    Loop
    file.Close
End Function
