################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/nrf/sdk/ehal_2015_09_08/ARM/src/ResetEntry.c \
../src/system_nrf52.c 

OBJS += \
./src/ResetEntry.o \
./src/system_nrf52.o 

C_DEPS += \
./src/ResetEntry.d \
./src/system_nrf52.d 


# Each subdirectory must supply rules for building sources it contributes
src/ResetEntry.o: C:/nrf/sdk/ehal_2015_09_08/ARM/src/ResetEntry.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DENABLE_SWO -DCONFIG_GPIO_AS_PINRESET -D__FPU_USED=1 -DNRF52 -I"C:/nrf/sdk/ehal_2015_09_08/ARM/Nordic/nRF52/CMSIS/include" -I"C:/nrf/sdk/ehal_2015_09_08/ARM/Nordic/nRF52/CMSIS/../../../CMSIS/CMSIS/include" -I"C:/nrf/sdk/ehal_2015_09_08/ARM/Nordic/nRF52/CMSIS/../nrf52_sdk/components/device" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DENABLE_SWO -DCONFIG_GPIO_AS_PINRESET -D__FPU_USED=1 -DNRF52 -I"C:/nrf/sdk/ehal_2015_09_08/ARM/Nordic/nRF52/CMSIS/include" -I"C:/nrf/sdk/ehal_2015_09_08/ARM/Nordic/nRF52/CMSIS/../../../CMSIS/CMSIS/include" -I"C:/nrf/sdk/ehal_2015_09_08/ARM/Nordic/nRF52/CMSIS/../nrf52_sdk/components/device" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


