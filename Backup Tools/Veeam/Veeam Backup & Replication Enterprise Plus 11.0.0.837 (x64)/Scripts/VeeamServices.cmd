@echo off
fsutil dirty query "%SystemDrive%">nul 2>&1 || "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -Command "Start-Process '%~f0' -Verb RunAs" 2>nul && goto :eof || goto :eof
:menu
set switch=
cls
echo 1) Start
echo 2) Stop
choice /c:12 /n /m "Choose: "
if "%errorlevel%"=="1" set switch=start
if "%errorlevel%"=="2" set switch=stop
for /f "tokens=2" %%? in ('sc query type^= service state^= all^|find /i "veeam"^|find /i "service_name"^|find /i /v "sqlagent"') do net %switch% "%%?"
if "%switch%"=="stop" for /f "tokens=3*" %%? in ('tasklist /fo list^|find /i "veeam"') do taskkill /f /im "%%?"
pause
goto menu