################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ThirdParty/SEGGER/Recording/segger_uart.c 

OBJS += \
./ThirdParty/SEGGER/Recording/segger_uart.o 

C_DEPS += \
./ThirdParty/SEGGER/Recording/segger_uart.d 


# Each subdirectory must supply rules for building sources it contributes
ThirdParty/SEGGER/Recording/segger_uart.o: ../ThirdParty/SEGGER/Recording/segger_uart.c ThirdParty/SEGGER/Recording/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F411xE -c -I../Core/Inc -I"C:/Users/MAHE/STM32CubeIDE/rtos_workspace/freertos_project_template/ThirdParty/SEGGER/Config" -I"C:/Users/MAHE/STM32CubeIDE/rtos_workspace/freertos_project_template/ThirdParty/SEGGER/OS" -I"C:/Users/MAHE/STM32CubeIDE/rtos_workspace/freertos_project_template/ThirdParty/SEGGER/SEGGER" -I"C:/Users/MAHE/STM32CubeIDE/rtos_workspace/freertos_project_template/ThirdParty/FreeRTOS/include" -I"C:/Users/MAHE/STM32CubeIDE/rtos_workspace/freertos_project_template/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"ThirdParty/SEGGER/Recording/segger_uart.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

