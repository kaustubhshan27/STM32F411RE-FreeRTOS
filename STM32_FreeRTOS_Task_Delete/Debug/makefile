################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Third-Party/FreeRTOS/org/Source/portable/MemMang/subdir.mk
-include Third-Party/FreeRTOS/org/Source/portable/GCC/ARM_CM4F/subdir.mk
-include Third-Party/FreeRTOS/org/Source/subdir.mk
-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
STM32_FreeRTOS_Task_Delete.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
STM32_FreeRTOS_Task_Delete.list \

OBJCOPY_BIN += \
STM32_FreeRTOS_Task_Delete.bin \


# All Target
all: STM32_FreeRTOS_Task_Delete.elf secondary-outputs

# Tool invocations
STM32_FreeRTOS_Task_Delete.elf: $(OBJS) $(USER_OBJS) /home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32F4-FreeRTOS/STM32_FreeRTOS_Task_Delete/STM32F411RETX_FLASH.ld
	arm-none-eabi-gcc -o "STM32_FreeRTOS_Task_Delete.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"/home/kaustubh/STM32CubeIDE/RTOS_workspace/STM32F4-FreeRTOS/STM32_FreeRTOS_Task_Delete/STM32F411RETX_FLASH.ld" --specs=nosys.specs -Wl,-Map="STM32_FreeRTOS_Task_Delete.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

STM32_FreeRTOS_Task_Delete.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "STM32_FreeRTOS_Task_Delete.list"
	@echo 'Finished building: $@'
	@echo ' '

STM32_FreeRTOS_Task_Delete.bin: $(EXECUTABLES)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "STM32_FreeRTOS_Task_Delete.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
