################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.c \
../Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_IAR.c \
../Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_KEIL.c \
../Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_SES.c 

OBJS += \
./Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o \
./Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_IAR.o \
./Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_KEIL.o \
./Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_SES.o 

C_DEPS += \
./Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d \
./Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_IAR.d \
./Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_KEIL.d \
./Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_SES.d 


# Each subdirectory must supply rules for building sources it contributes
Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.o: ../Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DDEBUG -c -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/OS" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/include" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/SEGGER" -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Core/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_GCC.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_IAR.o: ../Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_IAR.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DDEBUG -c -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/OS" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/include" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/SEGGER" -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Core/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_IAR.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_KEIL.o: ../Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_KEIL.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DDEBUG -c -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/OS" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/include" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/SEGGER" -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Core/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_KEIL.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_SES.o: ../Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_SES.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F411xE -DDEBUG -c -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/Config" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/OS" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/include" -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/SEGGER/SEGGER" -I../Drivers/CMSIS/Include -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Core/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32_HelloWorld_freeRTOS/Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Third-Party/SEGGER/SEGGER/Syscalls/SEGGER_RTT_Syscalls_SES.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

