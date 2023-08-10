@echo off
REM this is a build scrip

REM  mkdir bin
if not exist bin mkdir bin

cd bin
cl ..\src\main.c -nologo
