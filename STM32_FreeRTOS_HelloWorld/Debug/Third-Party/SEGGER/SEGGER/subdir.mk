################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third-Party/SEGGER/SEGGER/SEGGER_RTT.c \
../Third-Party/SEGGER/SEGGER/SEGGER_RTT_printf.c \
../Third-Party/SEGGER/SEGGER/SEGGER_SYSVIEW.c 

S_UPPER_SRCS += \
../Third-Party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./Third-Party/SEGGER/SEGGER/SEGGER_RTT.o \
./Third-Party/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o \
./Third-Party/SEGGER/SEGGER/SEGGER_RTT_printf.o \
./Third-Party/SEGGER/SEGGER/SEGGER_SYSVIEW.o 

C_DEPS += \
./Third-Party/SEGGER/SEGGER/SEGGER_RTT.d \
./Third-Party/SEGGER/SEGGER/SEGGER_RTT_printf.d \
./Third-Party/SEGGER/SEGGER/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
Third-Party/SEGGER/SEGGER/SEGGER_RTT.o: ../Third-Party/SEGGER/SEGGER/SEGGER_RTT.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DDEBUG -c -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/OS" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/include" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/SEGGER" -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Core/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Third-Party/SEGGER/SEGGER/SEGGER_RTT.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Third-Party/SEGGER/SEGGER/%.o: ../Third-Party/SEGGER/SEGGER/%.S
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Third-Party/SEGGER/SEGGER/SEGGER_RTT_printf.o: ../Third-Party/SEGGER/SEGGER/SEGGER_RTT_printf.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DDEBUG -c -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/OS" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/include" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/SEGGER" -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Core/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Third-Party/SEGGER/SEGGER/SEGGER_RTT_printf.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Third-Party/SEGGER/SEGGER/SEGGER_SYSVIEW.o: ../Third-Party/SEGGER/SEGGER/SEGGER_SYSVIEW.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DDEBUG -c -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/OS" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/include" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/SEGGER" -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Core/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Third-Party/SEGGER/SEGGER/SEGGER_SYSVIEW.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

