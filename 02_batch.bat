@echo off
REM this is a build scrip

if not exist bin mkdir bin

pushd bin
    cl ..\src\main.c -nologo
popd
