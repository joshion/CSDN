@echo OFF
set ERROR=0
echo "----------------------Start building----------------------"

if exist %4 (
    echo "Clean old build"
    echo "Delete %4"
    DEL %4
)

if not exist %1 ( 
    echo "ERROR: Please add the File '%2.make' in Directory 'make' !"
    set ERROR=1
    goto END
)

setlocal ENABLEDELAYEDEXPANSION
for /f %%i in (%1) do (
    set SOURCE=!SOURCE! %%i
)
setlocal DISABLEDELAYEDEXPANSION

set FILEMACRO=%2
for %%i in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    call set FILEMACRO=%%FILEMACRO:%%i=%%i%%
)

@echo ON
g++ -std=c++11 -g -D%FILEMACRO%_CPP -I %3 -o %4 %SOURCE%

@echo OFF
set ERROR=%errorlevel%
if %ERROR%==1 (
    echo "ERROR: Compile error, please check your code!"
    goto END
)

:END
@echo OFF
echo "-----------------------End building-----------------------"
if %ERROR%==0 (
    echo "Build Successed!!!"
)
if %ERROR%==1 (
    echo "Build failed!!!"
)