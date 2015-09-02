## Installation
This is the installation packet for windows machines, the setup process on OSX or Linux uses different files and has different prequisits.

This repository includes:
- Eclipse Mars
- ARM CMSIS library 4.3
- The EHAL from https://github.com/I-SYST/EHAL
- GCC ARM embedded 4.9
- GNU ARM Eclipse Build Tools 2.4

Sadly, some of the tools have a restricted licence which does not allow redistribution. This is why you have to manually download some components.

In order to set up your development machine for developing with FruityMesh, you have to follow these steps:

#### 1. Clone this repository
Clone this repository or download it as a zip package and put its contents to `C:\nrf\`
This should give you the following folder structure:
<pre>
C:\nrf\
├──  doc\           - some documentation
├──  download\           - generic download folder for sdk stuff
├──  projects\              - the folder where you will create your projects
├──  sdk\            - all sdk files
├──  softdevices\           - binary files for the softdevices that are used
├──  tools\              - installation path for additional tools or links to these tools
└──  workspace\         - this is where you set your Eclipse workspace
</pre>

#### 2. Install additional stuff
Some tools could not be distributed in this package and have to be downloaded manually, these are:
- nRFgo Studio: https://www.nordicsemi.com/kor/node_176/2.4GHz-RF/nRFgo-Studio#Downloads
- Master Control Panel: https://www.nordicsemi.com/eng/Products/Bluetooth-Smart-Bluetooth-low-energy/nRF51822-Development-Kit#Downloads

You should install these tools to their default installation path.

#### 3. Download the nRF51 SDK

You must also download the nRF51 SDK 9.0.0 from this location:
nRF51 9.0.0 SDK: https://developer.nordicsemi.com/nRF51_SDK/nRF51_SDK_v9.x.x/nRF51_SDK_9.0.0_2e23562.zip

Put the unzipped sdk files under `C:\nrf\sdk\nrf_sdk_9_0` so that the folder contains components, documentation, etc...

##### Fix one of the SDK files
This step is important: You must now edit the file `nrf_svc.h` which can be found in `C:\nrf\sdk\nrf_sdk_9_0\components\softdevice\s130\headers`.

You have to add a (uint16_t) cast somewhere around line 56. Afterwards it should look like this:
```C++
"bx r14" : : "I" ((uint16_t)number) : "r0" \
```
#### 4. Download the S130 softdevice
Download the production Release of the S13 SoftDevice and place the hex file in the folder: `C:\nrf\softdevices\sd130_1.0.0-prod`

S130: https://www.nordicsemi.com/eng/Products/nRF51-Dongle#Download

#### 5. Edit the setup.bat file
You should now open the setup.bat file in a text editor of your choice and configure all the paths at the beginning of the script so that they point to the correct directories. After you have done that, you can 

#### 6. Open Eclipse and start developing
Open eclipse which is located under `C:\nrf\tools\eclipse_mars` and set your Workspace directory to `C:\nrf\workspace`. You might have to import the fruitymesh project from `C:\nrf\projects\fruitymesh` and then you should be ready to go.