@echo off

net session >nul 2>&1

if not %errorLevel% == 0 (
    echo Failure: Run this script as Administrator
    pause
    exit
)

(echo list disk) | diskpart

SET /P _select_drive= Please enter drive letter: 

(
    echo select disk %_select_drive%
    echo clean
    echo create partition primary
    echo select partition 1
    echo format fs=ntfs quick
    echo convert mbr
    echo active
    echo exit
) | diskpart

pause
