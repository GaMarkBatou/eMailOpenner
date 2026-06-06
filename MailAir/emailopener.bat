@echo off
setlocal enabledelayedexpansion

:: Set the folder to monitor and the subfolder to move files to
::set "folder=C:\path\to\your\folder" eleresi utat meghartarozni
::set "folder=%CD%"

:: Del exit.txt file
if exist "%CD%\exit.txt" (
	del "%CD%\exit.txt"
)

:: Check if the folder path is provided as an argument
if "%~1"=="" (
    echo Please provide the folder path as an argument.
    exit /b
)

:: Set the folder to monitor and the subfolder to move files to
set "folder=%~1"
set "subfolder=%folder%\processed"


:: Delete files older than 2 hours from the subfolder
forfiles /p "%subfolder%" /m *.* /d -0 /c "cmd /c if @fdate==%date% if @ftime LEQ %time:~0,2%:%time:~3,2% del @path"

::set "subfolder=%folder%\processed"

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

:: Mark all existing .msg files as processed
for %%f in ("%folder%\*.msg") do (
    if not exist "%%f.processed" (
		move "%%f" "%subfolder%\"
        ren "%%f" "%%~nf.processed"
    )
)

:: Loop to monitor the folder
:loop

:: Check for exit.txt file
if exist "%CD%\exit.txt" (
	del "%CD%\exit.txt"
    exit /b
)
:: check .eml
for %%f in ("%folder%\*.eml") do (
    if not exist "%%f.processed" (
        :: Copy the .eml file to the subfolder
        copy /b "%%f" "%subfolder%\"
        :: Delete the original .eml file
        del "%%f"
        :: Open the .eml file from the subfolder
        start "" "%subfolder%\%%~nxf"
        :: Mark the file as processed - not sure about this is needed.
        :: ren "%subfolder%\%%~nxf" "%%~nf.processed"
    )
)
:: check .msg
for %%f in ("%folder%\*.msg") do (
    if not exist "%%f.processed" (
        :: Copy the .msg file to the subfolder
        copy /b "%%f" "%subfolder%\"
        :: Delete the original .msg file
        del "%%f"
        :: Open the .eml file from the subfolder
        start "" "%subfolder%\%%~nxf"
        :: Mark the file as processed - not sure about this is needed.
        :: ren "%subfolder%\%%~nxf" "%%~nf.processed"
    )
)

:: ---- ellenorzi exit.txt

:: Wait for a few seconds before checking again
timeout /t 3 /nobreak >nul
goto loop