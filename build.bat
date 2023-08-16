@echo off
REM this is a build script

set target_number=05
set target=..\src\%target_number%_main.c
set source_files=..\src\library.c
set include_dirs=-I..\include
set flags=-nologo

:parse_args
if "%~1" == "" goto :end_parse_args

if "%~1" == "-clean" (
    if exist bin rmdir /S /Q bin
    if exist build rmdir /S /Q build
    echo CLEANING PROJECT FILES...
    shift
    goto parse_args
)
:end_parse_args
if not exist bin mkdir bin

pushd bin

cl %target% %source_files% %include_dirs% %flags%

if "%ERRORLEVEL%" EQU "0" (
    goto good
)
if "%ERRORLEVEL%" NEQ "0" (
    goto bad
)
:good
    xcopy %target_number%_main.exe ..\build\ /Y /I
    %target_number%_main.exe
    goto done
:bad
    echo Error compiling code
    goto done
:done
popd




