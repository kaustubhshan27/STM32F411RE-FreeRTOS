################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third-Party/FreeRTOS/org/Source/portable/MemMang/heap_4.c 

OBJS += \
./Third-Party/FreeRTOS/org/Source/portable/MemMang/heap_4.o 

C_DEPS += \
./Third-Party/FreeRTOS/org/Source/portable/MemMang/heap_4.d 


# Each subdirectory must supply rules for building sources it contributes
Third-Party/FreeRTOS/org/Source/portable/MemMang/heap_4.o: ../Third-Party/FreeRTOS/org/Source/portable/MemMang/heap_4.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DDEBUG -c -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/OS" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/include" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/SEGGER" -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Core/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Third-Party/FreeRTOS/org/Source/portable/MemMang/heap_4.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

