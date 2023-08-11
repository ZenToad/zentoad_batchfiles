@echo off
REM this is a build scrip
set target_number=04
set target=..\src\%target_number%_main.c
set source_files=..\src\library.c
set include_dirs=-I..\include
set flags=-nologo

if not exist bin mkdir bin

pushd bin
    cl %target% %source_files% %include_dirs% %flags%
    if "%ERRORLEVEL%" EQU "0" (
        %target_number%_main.exe
    )
    if "%ERRORLEVEL%" NEQ "0" (
        echo Error compiling code
    )
popd
