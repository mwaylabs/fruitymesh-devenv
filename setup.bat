@echo off

echo This script initializes your development environment
echo make sure that you have edited it and configured the correct paths first.
PAUSE

REM ------------------- INSERT CORRET PATHS HERE --------------------------

REM ---- tools ----
SET MASTER_CP_PATH="C:\Program Files (x86)\Nordic Semiconductor\Master Control Panel\3.9.0.6"
SET NRF_TOOLS_PATH="C:\Program Files (x86)\Nordic Semiconductor\nrf5x\bin"
SET NRF_GO_STUDIO="C:\Program Files (x86)\Nordic Semiconductor\nRFgo Studio"

REM ---- SDK stuff ----
SET INSTALL_PATH=C:\nrf

SET EHAL_PATH="%INSTALL_PATH%\sdk\ehal_2015_09_08"
SET CMSIS_PATH="%INSTALL_PATH%\sdk\arm_cmsis_4_3"
SET NRF51_SDK_PATH="%INSTALL_PATH%\sdk\nrf_sdk_9_0"
SET NRF52_SDK_PATH="%INSTALL_PATH%\sdk\nrf52_sdk_0_9_1"

REM ------------------- DO NOT EDIT BELOW THIS LINE --------------------------


REM -----------------------------------------------------------
echo Creating junctions for tools

cd tools

rmdir /q master_cp
rmdir /q nrfgo
rmdir /q nrf_tools

mklink /J master_cp %MASTER_CP_PATH%
mklink /J nrfgo %NRF_GO_STUDIO%
mklink /J nrf_tools %NRF_TOOLS_PATH%


REM -----------------------------------------------------------
REM Junctions for SDK

cd %EHAL_PATH%\ARM\


rmdir /q CMSIS
mklink /J CMSIS %CMSIS_PATH%


cd %EHAL_PATH%\ARM\Nordic\nRF51
rmdir /q nrf51_sdk
mklink /J nrf51_sdk %NRF51_SDK_PATH%

cd %EHAL_PATH%\ARM\Nordic\nRF52
rmdir /q nrf52_sdk
mklink /J nrf52_sdk %NRF52_SDK_PATH%

cd %INSTALL_PATH%\sdk

rmdir /q ehal_latest
mklink /J ehal_latest %EHAL_PATH%

rmdir /q nrf51_sdk_latest
mklink /J nrf51_sdk_latest %NRF51_SDK_PATH%

rmdir /q nrf52_sdk_latest
mklink /J nrf52_sdk_latest %NRF52_SDK_PATH%

REM -----------------------------------------------------------
echo.
echo.
echo Now, we are cloning the fruitymesh project in the projects directory
echo press any key to continue
echo if you want to clone it yourself, just close this window

PAUSE

cd %INSTALL_PATH%\projects

git clone https://github.com/mwaylabs/fruitymesh.git

echo.
echo Setup finished
PAUSE