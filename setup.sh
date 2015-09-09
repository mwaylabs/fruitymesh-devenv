#!/bin/bash

echo "This script initializes your development environment"
echo "make sure that you have edited it and configured the correct paths first."

read

# ------------------- INSERT CORRET PATHS HERE --------------------------

# ---- tools ----
JLINK_COMMANDER_PATH="${HOME}/JLink_Linux_V498e_x86_64"

# ---- SDK stuff ----
INSTALL_PATH="${HOME}/nrf"

EHAL_PATH="${INSTALL_PATH}/sdk/ehal_2015_06_01"
CMSIS_PATH="${NSTALL_PATH}/sdk/arm_cmsis_4_3"
NRF_SDK_PATH="${INSTALL_PATH}/sdk/nrf_sdk_9_0"

# ------------------- DO NOT EDIT BELOW THIS LINE --------------------------


# -----------------------------------------------------------
echo "Creating links for tools"

cd tools

rm -f jlink

ln -s ${JLINK_COMMANDER_PATH} jlink


# -----------------------------------------------------------
# Links for SDK

cd ${EHAL_PATH}/ARM


rm -f CMSIS
ln -s ${CMSIS_PATH} CMSIS


cd ${EHAL_PATH}/ARM/Nordic/nRF51

rm -f nrf51_sdk
ln -s ${NRF_SDK_PATH} nrf51_sdk

cd ${INSTALL_PATH}/sdk

rm -f ehal_latest
ln -s ${EHAL_PATH} ehal_latest

rm -f nrf_sdk_latest
ln -s ${NRF_SDK_PATH} nrf_sdk_latest

# -----------------------------------------------------------
echo
echo
echo "Now, we are cloning the fruitymesh project in the projects directory"
echo "press any key to continue"
echo "if you want to clone it yourself, just press CTRL+C now"

read

mkdir ${INSTALL_PATH}/projects
cd ${INSTALL_PATH}/projects

git clone https://github.com/mwaylabs/fruitymesh.git

echo
echo "Setup finished"
