@echo off
setlocal enabledelayedexpansion

:: Set the folder to monitor and the subfolder to move files to
set "folder=%CD%"
set "subfolder=%folder%\processed"

:: Create the subfolder if it doesn't exist
if not exist "%subfolder%" (
    mkdir "%subfolder%"
)

:: Mark all existing .eml files as processed
for %%f in ("%folder%\*.eml") do (
    if not exist "%%f.processed" (
		move "%%f" "%subfolder%\"
        ren "%%f" "%%~nf.processed"
    )
)

:: Loop to monitor the folder
:loop
for %%f in ("%folder%\*.eml") do (
    if not exist "%%f.processed" (
        :: Move the .eml file to the subfolder
        move "%%f" "%subfolder%\"
        :: Open the .eml file from the subfolder
        start "" "%subfolder%\%%~nxf"
        :: Mark the file as processed
        ren "%subfolder%\%%~nxf" "%%~nf.processed"
    )
)

:: Delete files older than 2 hours from the subfolder
forfiles /p "%subfolder%" /m *.* /d -0 /c "cmd /c if @fdate==%date% if @ftime LEQ %time:~0,2%:%time:~3,2% del @path"

:: Wait for a few seconds before checking again
timeout /t 5 /nobreak >nul
goto loop