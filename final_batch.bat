@echo off
setlocal enableextensions enabledelayedexpansion

set target_src_dir=..\test
set target=main
set target_include=-I..\lib -I..\src 
set target_src=..\lib\rxi\log.c ..\lib\ripper\ripper.c ..\lib\cJSON\cJSON.c ..\test\test_*.c
set target_lib=
set target_flags=
set compiler=cl
set configuration=debug
REM  set verbose=/VERBOSE
set verbose=
set TEST_SUITE=

set target_c=!target_src_dir!\!target!.c
set target_exe=!target!.exe

if not exist bin mkdir bin

:parse_args
if "%~1" == "" goto :end_parse_args

if "%~1" == "-s" (
    if not "%~2" == "" (
        set TEST_SUITE=-s %~2 
        echo Running Tests for "%~2"
        shift
    ) else (
        echo Missing value for the -s flag.
    )
)

:end_parse_args

echo -------------------------------------------------
echo - Compiler:      %compiler%
echo - Include:       %target_include%
echo - Configuration: %configuration%
echo - Target C:      %target%.c
echo - Output:        bin\%target_exe%
echo -------------------------------------------------

rem MT for statically linked CRT, MD for dynamically linked CRT
set win_runtime_lib=MDd
set common_c=!target_c! !target_tests! !target_src! /Fe!target_exe! -nologo !target_flags! -FC -EHa- !target_include!
set common_l=!verbose! !target_lib!

echo.
echo Compiling...
pushd bin
    cl !common_c! -!win_runtime_lib! -Od /Z7 /link !common_l!
    if "%ERRORLEVEL%" EQU "0" (
        goto good
    )
    if "%ERRORLEVEL%" NEQ "0" (
        goto bad
    )
:good
    echo.
    xcopy !target_exe! ..\build /i /y
    REM ..\build\!target!.exe -f -v !TEST_SUITE!
    ..\build\!target!.exe !TEST_SUITE!
    goto done
:bad
    echo FAILED
    goto done
:done

popd

:end


REM what even goes here?
