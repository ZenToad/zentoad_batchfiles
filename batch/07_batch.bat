@echo off
REM this is a build scrip
set target_number=07
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
)
:end_parse_args

if not exist bin mkdir bin
if not exist build mkdir build

pushd bin
    cl %target% %source_files% %include_dirs% %flags%
    if "%ERRORLEVEL%" EQU "0" (
        goto good
    )
    if "%ERRORLEVEL%" NEQ "0" (
        goto bad
    )
:good
    REM  xcopy source destination [options]
    xcopy %target_number%_main.exe ..\build\ /I /Y
    %target_number%_main.exe
    goto done
:bad
    echo FAILED
    goto done
:done

popd
