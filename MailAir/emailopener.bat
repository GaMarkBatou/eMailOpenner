@echo off
setlocal enabledelayedexpansion

if exist "%CD%\exit.txt" del "%CD%\exit.txt" >nul 2>nul

if "%~1"=="" exit /b

set "folder=%~1"
set "subfolder=%folder%\processed"

if not exist "%folder%" exit /b
if not exist "%subfolder%" mkdir "%subfolder%" >nul 2>nul

:loop
if exist "%CD%\exit.txt" (
    del "%CD%\exit.txt" >nul 2>nul
    exit /b
)

for %%f in ("%folder%\*.eml") do (
    if exist "%%~ff" (
        copy /b "%%~ff" "%subfolder%\" >nul 2>nul
        if exist "%subfolder%\%%~nxf" (
            del "%%~ff" >nul 2>nul
            start "" "%subfolder%\%%~nxf"
        )
    )
)

for %%f in ("%folder%\*.msg") do (
    if exist "%%~ff" (
        copy /b "%%~ff" "%subfolder%\" >nul 2>nul
        if exist "%subfolder%\%%~nxf" (
            del "%%~ff" >nul 2>nul
            start "" "%subfolder%\%%~nxf"
        )
    )
)

timeout /t 3 /nobreak >nul
goto loop
