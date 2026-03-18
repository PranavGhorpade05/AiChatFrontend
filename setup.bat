@echo off
echo ===================================
echo AI Chat Application Setup Script
echo ===================================
echo.

echo Checking prerequisites...

REM Check Node.js
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js is not installed. Please install Node.js 18+ from https://nodejs.org
    exit /b 1
)

REM Check Python
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python 3 is not installed. Please install Python 3.9+ from https://www.python.org
    exit /b 1
)

echo ✅ Prerequisites check complete
echo.

REM Setup Backend
echo ===================================
echo Setting up Backend...
echo ===================================
cd backend

REM Create virtual environment
python -m venv venv

REM Activate virtual environment
call venv\Scripts\activate.bat

REM Install dependencies
pip install -r requirements.txt

REM Create .env if it doesn't exist
if not exist .env (
    echo ⚠️  .env file not found. Creating template...
    copy .env.example .env 2>nul || echo Please create .env file with required variables
)

echo ✅ Backend setup complete
echo.
cd ..

REM Setup Frontend
echo ===================================
echo Setting up Frontend...
echo ===================================
cd frontend

REM Install dependencies
call npm install

REM Create .env.local if it doesn't exist
if not exist .env.local (
    echo ⚠️  .env.local file not found. Creating template...
    (
        echo NEXTAUTH_URL=http://localhost:3000
        echo NEXTAUTH_SECRET=your-secret-key-change-this-in-production
        echo GOOGLE_CLIENT_ID=your-google-client-id
        echo GOOGLE_CLIENT_SECRET=your-google-client-secret
        echo NEXT_PUBLIC_API_URL=http://localhost:8000
    ) > .env.local
)

echo ✅ Frontend setup complete
echo.
cd ..

REM Print final instructions
echo ===================================
echo Setup Complete!
echo ===================================
echo.
echo Next steps:
echo.
echo 1. Configure environment variables:
echo    - Frontend: open frontend\.env.local
echo    - Backend: open backend\.env
echo.
echo 2. Set up PostgreSQL database:
echo    - Create a database named 'ai_chat_db'
echo    - Run: psql -U postgres -d ai_chat_db -f backend/database.sql
echo.
echo 3. Get API Keys:
echo    - Google OAuth: https://console.cloud.google.com
echo    - Google Gemini: https://makersuite.google.com/app/apikey
echo.
echo 4. Start the application:
echo    - Backend (from backend folder): python main.py
echo    - Frontend (from frontend folder): npm run dev
echo.
echo 5. Visit http://localhost:3000 in your browser
echo.
pause
