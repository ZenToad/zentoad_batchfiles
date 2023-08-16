@echo off
REM  setlocal enableextensions enabledelayedexpansion

set count=0

for %%i in (1, 2, 3, 4, 5) do (
    set /A count+=1
    echo Inside loop: count = !count!
)

echo Outside loop: count = %count%

endlocal
