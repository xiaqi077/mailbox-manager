@echo off
echo ==========================================
echo Mailbox Manager - Windows Build Script
echo ==========================================

:: 1. Check Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python is not installed or not in PATH.
    pause
    exit /b 1
)

:: 2. Check Node.js
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Node.js is not installed or not in PATH.
    pause
    exit /b 1
)

echo.
echo [1/4] Installing Python Dependencies...
pip install -r backend/requirements.txt pyinstaller
if %errorlevel% neq 0 (
    echo Failed to install dependencies.
    pause
    exit /b 1
)

echo.
echo [2/4] Building Frontend...
cd frontend
call npm install
call npm run build
if %errorlevel% neq 0 (
    echo Frontend build failed.
    pause
    exit /b 1
)
cd ..

echo.
echo [3/4] Preparing Build Environment...
if not exist "frontend/dist" (
    echo Error: frontend/dist not found!
    pause
    exit /b 1
)

echo.
echo [4/4] Building EXE with PyInstaller...
pyinstaller --noconfirm --clean --name "MailboxManager" ^
    --paths "backend" ^
    --add-data "frontend/dist;dist" ^
    --add-data "backend/.env.example;." ^
    --hidden-import "uvicorn.logging" ^
    --hidden-import "uvicorn.loops" ^
    --hidden-import "uvicorn.loops.auto" ^
    --hidden-import "uvicorn.protocols" ^
    --hidden-import "uvicorn.protocols.http" ^
    --hidden-import "uvicorn.protocols.http.auto" ^
    --hidden-import "uvicorn.protocols.websockets" ^
    --hidden-import "uvicorn.protocols.websockets.auto" ^
    --hidden-import "uvicorn.lifespan" ^
    --hidden-import "uvicorn.lifespan.on" ^
    --hidden-import "sqlalchemy.ext.asyncio" ^
    --hidden-import "sqlalchemy.dialects.sqlite" ^
    --hidden-import "aiosqlite" ^
    --hidden-import "engineio.async_drivers.aiohttp" ^
    backend/main.py

if %errorlevel% neq 0 (
    echo Build failed.
    pause
    exit /b 1
)

echo.
echo ==========================================
echo Build Success!
echo The EXE is located in: dist\MailboxManager\MailboxManager.exe
echo ==========================================
pause
