@ECHO OFF
SET f=%~nx0
SET f=%f:.il-build-and-run.bat=%
SET o=%TEMP%\%f%.%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%.tmp.exe
REM alternatives: csc-version: v2.0.50727, v3.5, v4.0.30319,
"%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\ilasm.exe" /nologo /quiet /exe /output:"%o%" "%f%.il"
IF %ERRORLEVEL% NEQ 0 ( ECHO Error & PAUSE > NUL: & EXIT /B 1 )
"%o%" %*
DEL "%o%"
ECHO "Press enter to exit."
PAUSE > NUL:
