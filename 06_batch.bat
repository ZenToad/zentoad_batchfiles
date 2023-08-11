@echo off
REM this is a build scrip
set target_number=05
set target=..\src\%target_number%_main.c
set source_files=..\src\library.c
set include_dirs=-I..\include
set flags=-nologo

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
    %target_number%_main.exe
    goto done
:bad
    echo FAILED
    goto done
:done

popd
