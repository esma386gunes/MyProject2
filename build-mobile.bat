@echo off
REM AFAD Mobil Uygulama - Windows Kurulum Scripti

echo.
echo ============================================
echo   AFAD Mobil Uygulama Kurulumu
echo ============================================
echo.

REM Node.js kontrolu
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [HATA] Node.js bulunamadi!
    echo Lutfen Node.js kurun: https://nodejs.org
    pause
    exit /b 1
)

echo [OK] Node.js: 
node -v
echo [OK] npm: 
npm -v
echo.

echo [1/4] Bagimliliklari yukleniyor...
call npm install
if %errorlevel% neq 0 (
    echo [HATA] npm install basarisiz!
    pause
    exit /b 1
)

echo.
echo [2/4] Capacitor baslatiliyor...
call npx cap init "AFAD Afet Yonetimi" tr.gov.afad.emergency --web-dir=.

echo.
echo [3/4] Android platformu ekleniyor...
call npx cap add android
if %errorlevel% neq 0 (
    echo [HATA] Android platformu eklenemedi!
    pause
    exit /b 1
)

echo.
echo [4/4] Dosyalar senkronize ediliyor...
call npx cap sync android

echo.
echo ============================================
echo   KURULUM TAMAMLANDI!
echo ============================================
echo.
echo Android projesi hazir: .\android
echo.
echo Debug APK olusturmak icin:
echo   cd android
echo   gradlew.bat assembleDebug
echo.
echo Detayli bilgi: KURULUM.md
echo.
pause
