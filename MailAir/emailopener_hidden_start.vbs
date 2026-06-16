Option Explicit

Dim fso, shell, appDir, configPath, batPath, exitPath, folderPath, cmd, logPath
Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

appDir = fso.GetParentFolderName(WScript.ScriptFullName)
configPath = appDir & "\emailopener_config.ini"
batPath = appDir & "\emailopener.bat"
exitPath = appDir & "\exit.txt"
logPath = appDir & "\emailopener_startup_log.txt"

WriteLog "Rejtett indito elindult. AppDir=" & appDir

folderPath = ReadConfigValue(configPath, "folder")
If folderPath = "" Then
    WriteLog "HIBA: Nincs beallitott figyelendo mappa az emailopener_config.ini fajlban."
    WScript.Quit 1
End If
If Not fso.FileExists(batPath) Then
    WriteLog "HIBA: Nem talalhato a BAT: " & batPath
    WScript.Quit 2
End If
If Not fso.FolderExists(folderPath) Then
    WriteLog "HIBA: A figyelendo mappa nem letezik: " & folderPath
    WScript.Quit 3
End If

On Error Resume Next
If fso.FileExists(exitPath) Then fso.DeleteFile exitPath, True
If Err.Number <> 0 Then
    WriteLog "FIGYELEM: exit.txt torles nem sikerult: " & Err.Description
    Err.Clear
End If
On Error GoTo 0

cmd = "cmd.exe /c cd /d """ & appDir & """ && """ & batPath & """ """ & folderPath & """"
WriteLog "BAT inditasa rejtetten. Mappa=" & folderPath
shell.Run cmd, 0, False
WriteLog "Indito kesz. Ha nincs ujabb hiba, a figyelo a hatterben fut."

Function ReadConfigValue(path, key)
    Dim file, line, p, k, v
    ReadConfigValue = ""
    If Not fso.FileExists(path) Then
        WriteLog "HIBA: Nem talalhato config fajl: " & path
        Exit Function
    End If
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

Sub WriteLog(text)
    On Error Resume Next
    Dim file
    Set file = fso.OpenTextFile(logPath, 8, True)
    file.WriteLine Now & " - " & text
    file.Close
End Sub
