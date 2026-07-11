@echo off
setlocal

cd /d "%~dp0"
title CB Studios Docs

echo.
echo ==========================================
echo   CB Studios Docs - Local Server
echo ==========================================
echo.

where node >nul 2>nul
if errorlevel 1 (
  echo ERROR: Node.js no esta instalado o no esta en el PATH.
  echo Instala Node.js y vuelve a intentar.
  echo.
  pause
  exit /b 1
)

where npm.cmd >nul 2>nul
if errorlevel 1 (
  echo ERROR: npm.cmd no esta disponible.
  echo Reinstala Node.js y vuelve a intentar.
  echo.
  pause
  exit /b 1
)

if not exist "node_modules\docsify-cli" (
  echo Instalando dependencias...
  call npm.cmd install
  if errorlevel 1 (
    echo.
    echo ERROR: No se pudieron instalar las dependencias.
    pause
    exit /b 1
  )
  echo.
)

set "PORT="
for /f %%P in ('powershell -NoProfile -ExecutionPolicy Bypass -Command "$ports = 3000..3010; foreach ($p in $ports) { if (-not (Get-NetTCPConnection -LocalPort $p -State Listen -ErrorAction SilentlyContinue)) { $p; break } }"') do set "PORT=%%P"

if "%PORT%"=="" (
  echo ERROR: No hay puertos libres entre 3000 y 3010.
  echo Cierra otros servidores locales y vuelve a intentar.
  echo.
  pause
  exit /b 1
)

echo Abriendo documentacion en:
echo http://localhost:%PORT%
echo.
echo IMPORTANTE: No abras index.html con file:// porque Docsify necesita servidor local.
echo Deja esta ventana abierta mientras usas la documentacion.
echo.

start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Sleep -Seconds 3; Start-Process 'http://localhost:%PORT%'"

call node_modules\.bin\docsify.cmd serve . -p %PORT%

echo.
echo El servidor se detuvo.
pause
