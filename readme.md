## Introduction
This is the installation packet for Windows, Linux and OSX machines.

This repository includes:
- Eclipse Mars (Windows only)
- ARM CMSIS library 4.3
- The EHAL from https://github.com/I-SYST/EHAL
- GCC ARM embedded 4.9 (compiled for Windows, Linux and OSX)
- GNU ARM Eclipse Build Tools 2.4

Sadly, some of the tools have a restricted licence which does not allow redistribution. This is why you have to manually download some components.

In order to set up your development machine for developing with FruityMesh, you have to follow these steps:

## Installation

#### 1. Clone this repository
Clone this repository or download it as a zip package and put its contents to `C:\nrf\` (Linux: `/home/(your username)/nrf`, OSX: `/Users/(your username)/nrf`)
This should give you the following folder structure:
<pre>
C:\nrf\
├──  doc\           - some documentation
├──  download\      - generic download folder for sdk stuff
├──  projects\      - the folder where you will create your projects
├──  sdk\           - all sdk files
├──  softdevices\   - binary files for the softdevices that are used
├──  tools\         - installation path for additional tools or links to these tools
└──  workspace\     - this is where you set your Eclipse workspace
</pre>

#### 2. Install additional stuff
Some tools could not be distributed in this package and have to be downloaded manually, these are:
- nRFgo Studio: https://www.nordicsemi.com/kor/node_176/2.4GHz-RF/nRFgo-Studio#Downloads
- Master Control Panel: https://www.nordicsemi.com/eng/Products/Bluetooth-Smart-Bluetooth-low-energy/nRF51822-Development-Kit#Downloads

You should install these tools to their default installation path.

#### 3. Download the nRF51 SDK

You must also download the latest nRF51 SDK 11.0.0 from this location:
nRF51 11.0.0 SDK: https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v11.x.x/

Put the unzipped sdk files under `./sdk/nrf_sdk_11_0` so that the folder contains components, documentation, etc...

##### Fix some of the SDK files
This step is important, because there are bugs in the SDK: You must now edit the file `nrf_svc.h`. It can be found in `./sdk/nrf_sdk_11_0/components/softdevice/s130/headers`.

You have to change a uint8_t cast at line 55. Afterwards it should look like this:
```C++
#define GCC_CAST_CPP (uint16_t) \
```

Next, you should follow this forum post: `https://devzone.nordicsemi.com/question/71636/ble_radio_notification-wont-compile/` and replace the radio_notification module files with these versions. The SDK files have errors and do not compile.

#### 4. Download the S130 softdevice
Download the production Release of the S130 v2.0 SoftDevice and place the hex file in the folder: `./softdevices/sd130_2.0.0-prod`

S130: https://www.nordicsemi.com/eng/Products/nRF51-Dongle#Download

#### 5. Edit the setup.bat file (Windows) or the setup.sh file (Linux & OSX)
You should now open the setup.bat or setup.sh file in a text editor of your choice and configure all the paths at the beginning of the script so that they point to the correct directories. After you have done that, you can start developing.

#### 6a. Windows: Open Eclipse and start developing
Open eclipse which is located under `C:\nrf\tools\eclipse_mars` and set your Workspace directory to `C:\nrf\workspace`. You might have to import the fruitymesh project from `C:\nrf\projects\fruitymesh` and then you should be ready to go.

#### 6b. Linux & OSX: Open Eclipse and start developing
For FruityMesh, a custom build script is provided for Linux and OSX. If you chose to clone FruityMesh when executing the setup.sh script, the build script is located in `${HOME}/nrf/projects/FruityMesh/compile.sh`. Once executed, it will compile any C/C++ files and create a flashable HEX file in the Debug folder. For your own projects, you can just copy it and modify the include paths.

For developing, you may use any IDE you like. Unfortunately, there is no Eclipse package provided which will compile the project for you on Linux and OSX, so when developing on these platforms, you may code using your favorite IDE and compile using the provided compile script.

#### 6b. Development using an Ubuntu VM

You can set up an Ubuntu VM with all needed infrastructure using [this repo](https://github.com/ihassin/fruity-ubuntu-vm).
