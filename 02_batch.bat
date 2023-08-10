@echo off
REM this is a build scrip

if not exist bin mkdir bin

pushd bin
    cl ..\src\02_main.c ..\src\library.c -I..\include -nologo
popd
