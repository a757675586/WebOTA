@echo off
chcp 65001 >nul
echo.
echo ╔════════════════════════════════════════╗
echo ║       Web BLE OTA 本地服务器           ║
echo ╚════════════════════════════════════════╝
echo.
echo 正在启动本地服务器...
echo.
echo 访问地址: http://localhost:8080
echo.
echo 按 Ctrl+C 停止服务器
echo ─────────────────────────────────────────
echo.

cd /d "%~dp0"

:: 尝试使用 Python
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    python -m http.server 8080
    goto :end
)

:: 尝试使用 Python3
where python3 >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    python3 -m http.server 8080
    goto :end
)

:: 尝试使用 npx serve
where npx >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    npx serve -l 8080 .
    goto :end
)

echo 错误: 未找到 Python 或 Node.js
echo 请安装 Python 或 Node.js 后重试
pause

:end
