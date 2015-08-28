@echo Paths to folders must be edited in this batch file. continue?

PAUSE

SET INSTALL_PATH=C:\nrf

SET EHAL_PATH=%INSTALL_PATH%\sdk\ehal_2015_06_01
SET CMSIS_PATH=%INSTALL_PATH%\sdk\arm_cmsis_4_3
SET NRF_SDK_PATH=%INSTALL_PATH%\sdk\nrf_sdk_9_0


cd %EHAL_PATH%\ARM\


rmdir CMSIS
mklink /J CMSIS %CMSIS_PATH%


cd %EHAL_PATH%\ARM\Nordic\nRF51

rmdir nrf51_sdk
mklink /J nrf51_sdk %NRF_SDK_PATH%

cd %INSTALL_PATH%\sdk

rmdir ehal_latest
mklink /J ehal_latest %EHAL_PATH%

rmdir nrf_sdk_latest
mklink /J nrf_sdk_latest %NRF_SDK_PATH%



PAUSE