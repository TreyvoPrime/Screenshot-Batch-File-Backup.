@echo off
:: =======================================
:: Minecraft Screenshot Move Script (Universal)
:: =======================================

:: Source folder (where screenshots are saved)
set "SOURCE=%USERPROFILE%\curseforge\minecraft\Instances\MC-Current Mods Server Friendly\screenshots"

:: Destination folder (Desktop backup)
set "DEST=%USERPROFILE%\Desktop\MCscreenshots"

:: Make sure destination folder exists
if not exist "%DEST%" mkdir "%DEST%"

echo Moving Minecraft screenshots...
echo.

:: Count screenshots before moving
set COUNT=0
for %%A in ("%SOURCE%\*.png") do (
    set /a COUNT+=1
)

:: If there are no screenshots, stop
if %COUNT%==0 (
    echo No screenshots found in "%SOURCE%"
    pause
    exit /b
)

:: Copy screenshots to destination
xcopy "%SOURCE%\*.png" "%DEST%\" /Y /E >nul

:: Check if copy was successful
if %errorlevel% neq 0 (
    echo Error copying screenshots.
    pause
    exit /b
)

:: Delete screenshots from original folder
del "%SOURCE%\*.png" /q

echo.
echo %COUNT% screenshots moved successfully!
echo From: "%SOURCE%"
echo To:   "%DEST%"
echo.
pause


