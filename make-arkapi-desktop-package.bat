@echo off
setlocal EnableExtensions

set "SOURCE=J:\projects\ARK-Server-API-3.56-Aquatica-source"
set "DEST=J:\projects\ARK-Server-API-3.56-Ready-to-Install"

if not exist "%SOURCE%\x64\Ark\version.dll" (
    echo.
    echo ERROR: The compiled version.dll was not found.
    echo Expected: %SOURCE%\x64\Ark\version.dll
    echo Open version.sln, select Ark and x64, then build the solution first.
    echo.
    pause
    exit /b 1
)

if not exist "%DEST%" mkdir "%DEST%"
if not exist "%DEST%\ArkApi\Plugins" mkdir "%DEST%\ArkApi\Plugins"

copy /Y "%SOURCE%\x64\Ark\version.dll" "%DEST%\version.dll" >nul
copy /Y "%SOURCE%\config.json" "%DEST%\config.json" >nul

set "DIA="
for /r "%ProgramFiles%\Microsoft Visual Studio\2022" %%F in (msdia140.dll) do if not defined DIA set "DIA=%%F"
if not defined DIA for /r "%ProgramFiles(x86)%\Microsoft Visual Studio\2022" %%F in (msdia140.dll) do if not defined DIA set "DIA=%%F"

if defined DIA (
    copy /Y "%DIA%" "%DEST%\msdia140.dll" >nul
    echo Created: %DEST%
    echo.
    echo Copy EVERYTHING inside that folder into:
    echo I:\SteamLibrary\steamapps\common\ARK\ShooterGame\Binaries\Win64
) else (
    echo Created: %DEST%
    echo.
    echo WARNING: msdia140.dll was not found automatically.
    echo Copy it manually from your Visual Studio folder into this package.
)

echo.
pause
