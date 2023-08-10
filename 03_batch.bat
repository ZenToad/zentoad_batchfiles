@echo off
REM this is a build scrip

if not exist bin mkdir bin

pushd bin
    cl ..\src\03_main.c ..\src\library.c -I..\include -nologo
    if "%ERRORLEVEL%" EQU "0" (
        03_main.exe
    )
    if "%ERRORLEVEL%" NEQ "0" (
        echo Error compiling code
    )
popd
