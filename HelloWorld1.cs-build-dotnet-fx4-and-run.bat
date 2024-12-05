@ECHO OFF
SET f=%~nx0
FOR /f "tokens=1 delims=." %%A IN ("%f%") DO SET "f=%%A"
SET o=%TEMP%\%f%.%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%%RANDOM%.tmp.exe
REM alternatives: csc-version: v2.0.50727, v3.5, v4.0.30319,  options: /target:winexe
"%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\csc.exe" /nologo /warn:4 /warnaserror+ /target:exe /out:"%o%" "%f%.cs"
IF %ERRORLEVEL% NEQ 0 ( ECHO Error & PAUSE > NUL: & EXIT /B 1 )
"%o%" %*
DEL "%o%"
ECHO "Press Enter to exit."
PAUSE > NUL:
