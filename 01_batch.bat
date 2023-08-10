@echo off
REM this is a build scrip

if not exist bin mkdir bin

pushd bin
    cl ..\src\01_main.c -nologo
popd
