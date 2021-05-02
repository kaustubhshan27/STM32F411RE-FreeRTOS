/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h" //using FreeRTOS software timers to toggle LEDs

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define TRUE 	1
#define FALSE 	0
#define CMD_QUEUE_SIZE	10
#define UART_QUEUE_SIZE 10
#define CMD_BUFF_LENGTH 10

#define LED_ON				1
#define LED_OFF				2
#define LED_TOGGLE_START	3
#define LED_TOGGLE_STOP		4
#define LED_STATUS_READ		5
#define RTC_DATETIME_READ	6
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */

//user message buffer
char usr_msg[50] = {0};

//task handlers
TaskHandle_t xtaskMenuDisplay_Handle = NULL;
TaskHandle_t xtaskCmdHandling_Handle = NULL;
TaskHandle_t xtaskCmdProcessing_Handle = NULL;
TaskHandle_t xtaskUARTWrite_Handle = NULL;

//queue handlers
QueueHandle_t command_queue_handler = NULL;
QueueHandle_t uart_write_queue_handler = NULL;

//software timer handler
TimerHandle_t LED_timer_handler = NULL;

uint8_t command_buffer[CMD_BUFF_LENGTH] = {0};
uint8_t command_length = 0;

//command structure
struct APP_CMD{
	uint8_t command_num; 		//command number
	uint8_t command_args[10];	//associated arguments
};
typedef struct APP_CMD APP_CMD_t;

char menu[] = {"\
\r\nLED_ON: 1 \
\r\nLED_OFF: 2 \
\r\nLED_TOGGLE: 3 \
\r\nLED_TOGGLE_OFF: 4 \
\r\nLED_READ_STATUS: 5 \
\r\nRTC_PRINT_DATE_TIME: 6 \
\r\nEXIT_APP: 0 \
\r\nENTER YOUR OPTION: "};

uint8_t rx_data; //store received data from UART
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART2_UART_Init(void);
/* USER CODE BEGIN PFP */
void vTask1_menuDisplay_handler(void *params);		//task to display menu of commands to the user
void vTask2_cmdHandling_handler(void *params);		//task to handle the incoming command from the user
void vTask3_cmdProcessing_handler(void *params);	//task to process the received command from the user
void vTask4_uartWrite_handler(void *params);		//task to write data to the UART peripheral

void printmsg(const char* msg);						//function to print data serially using UART
uint8_t getCommandCode(uint8_t* buffer);			//function to extract the command code
void getArguments(uint8_t* buffer);					//function to extract command arguments

void LED_on(void);
void LED_off(void);
void LED_toggle_start(void);
void LED_toggle_stop(void);
void LED_status_read(char* buffer);
void LED_rtc_read(char* buffer);
void LED_toggle(TimerHandle_t xTimer);				//software timer call-back function
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */
  command_queue_handler = xQueueCreate(CMD_QUEUE_SIZE, sizeof(APP_CMD_t *));
  uart_write_queue_handler = xQueueCreate(UART_QUEUE_SIZE, sizeof(char *));

  if((command_queue_handler != NULL) && (uart_write_queue_handler != NULL))
  {
	  xTaskCreate((pdTASK_CODE) vTask1_menuDisplay_handler, "Display Menu", 500, NULL, 1,
	    			&xtaskMenuDisplay_Handle);
	  xTaskCreate((pdTASK_CODE) vTask2_cmdHandling_handler, "Handles incoming commnads", 500, NULL, 2,
	    			&xtaskCmdHandling_Handle);
	  xTaskCreate((pdTASK_CODE) vTask3_cmdProcessing_handler, "Processes user command", 500, NULL, 2,
	    			&xtaskCmdProcessing_Handle);
	  xTaskCreate((pdTASK_CODE) vTask4_uartWrite_handler, "Writing data to UART", 500, NULL, 2,
	    			&xtaskUARTWrite_Handle);

	  vTaskStartScheduler();
  }
  else
  {
	  Error_Handler();
  }

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage 
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
	  Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */
  if(HAL_UART_Receive_IT(&huart2, &rx_data, 1) != HAL_OK)
  {
	  Error_Handler();
  }
  /* USER CODE END USART2_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOA_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);

  /*Configure GPIO pin : PA5 */
  GPIO_InitStruct.Pin = GPIO_PIN_5;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */
void vTask1_menuDisplay_handler(void *params)
{
	/*
	 * Address of the char array because the elements of the queue are pointers.
	 * While sending data to the queue, we have to pass the address of the element(item).
	 * Therefore we pass the address of the pointer to the char array.
	 * */
	char *pData = menu;
	while(1)
	{
		xQueueSend(uart_write_queue_handler, &pData, portMAX_DELAY);

		//now wait here until some task notifies, wait == blocked state
		xTaskNotifyWait(0, 0, NULL, portMAX_DELAY);
	}
}

void vTask2_cmdHandling_handler(void *params)
{
	uint8_t command_code = 0;
	APP_CMD_t *new_cmd = NULL;

	while(1)
	{
		//Send the task to wait state until notified by the UART ISR
		xTaskNotifyWait(0, 0, NULL, portMAX_DELAY);
		//When the task is unblocked from a notification, the below statements are executed
		new_cmd = (APP_CMD_t *)pvPortMalloc(sizeof(APP_CMD_t));

		taskENTER_CRITICAL(); //disable interrupts
		command_code = getCommandCode(command_buffer);
		new_cmd->command_num = command_code;
		//getArguments(new_cmd->command_args);
		taskEXIT_CRITICAL(); //re-enable interrupts

		//send command to command queue
		xQueueSend(command_queue_handler, &new_cmd, portMAX_DELAY);
	}
}

void vTask3_cmdProcessing_handler(void *params)
{
	APP_CMD_t *new_cmd = NULL;
	char task_msg[50];

	while(1)
	{
		xQueueReceive(command_queue_handler, &new_cmd, portMAX_DELAY);

		if(new_cmd->command_num == LED_ON)
		{
			//turn ON LED
			LED_on();
		}
		else if(new_cmd->command_num == LED_OFF)
		{
			//turn OFF LED
			LED_off();
		}
		else if(new_cmd->command_num == LED_TOGGLE_START)
		{
			//start toggling LED
			LED_toggle_start();
		}
		else if(new_cmd->command_num == LED_TOGGLE_STOP)
		{
			//stop toggling LED
			LED_toggle_stop();
		}
		else if(new_cmd->command_num == LED_STATUS_READ)
		{
			//read current status of LED
			LED_status_read(task_msg);
		}
		else if(new_cmd->command_num == RTC_DATETIME_READ)
		{
			//print the current date, time
			LED_rtc_read(task_msg);
		}

		//free the allocated memory
		vPortFree(new_cmd);
	}
}

void vTask4_uartWrite_handler(void *params)
{
	char *pData = NULL;
	while(1)
	{
		xQueueReceive(uart_write_queue_handler, &pData, portMAX_DELAY); //if queue is empty the task will be blocked
		printmsg(pData);
	}
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	BaseType_t xHigherPriorityTaskWoken = pdFALSE;
	if(huart->Instance == USART2)
	{
		if(HAL_UART_Receive_IT(&huart2, &rx_data, 1) == HAL_OK)
		{
			command_buffer[command_length] = rx_data;
			command_length++;

			if(rx_data == '\r')
			{
				//reset command length
				command_length = 0;
				//user finished entering the data, notify the command handling task
				xTaskNotifyFromISR(xtaskCmdHandling_Handle, 0, eNoAction, &xHigherPriorityTaskWoken);
				//user finished entering the data, notify the print menu task
				xTaskNotifyFromISR(xtaskMenuDisplay_Handle, 0, eNoAction, &xHigherPriorityTaskWoken);
			}
		}
		/*
		 * If the above FreeRTOS APIs wake up any higher priority task,
		 * then yield the processor to the higher priority task that was just woken up.
		 * If xTaskNotifyFromISR() sets this value to pdTRUE then
		 * a context switch should be requested before the interrupt is exited.
		 */
		if(xHigherPriorityTaskWoken == pdTRUE)
			taskYIELD(); //after exiting the IRQ handler, the processor should start executing the task
	}
}

void printmsg(const char *msg) {
	while (HAL_UART_GetState(&huart2) == HAL_UART_STATE_BUSY_TX);
	HAL_UART_Transmit(&huart2, (uint8_t*) msg, (uint16_t) strlen(msg),
			HAL_MAX_DELAY);
}

uint8_t getCommandCode(uint8_t* buffer)
{
	return (buffer[0] - 48);
}

void getArguments(uint8_t* buffer)
{

}

void LED_on(void)
{
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);
}

void LED_off(void)
{
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);
}

void LED_toggle(TimerHandle_t xTimer)
{
	HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
}

void LED_toggle_start(void)
{
	TickType_t toggle_duration = 500;

	if(LED_timer_handler == NULL)
	{
		//create software timer
		LED_timer_handler = xTimerCreate("LED Timer", toggle_duration, pdTRUE, NULL, LED_toggle);
	}

	//start the software timer
	xTimerStart(LED_timer_handler, portMAX_DELAY);
}

void LED_toggle_stop(void)
{
	//stop the timer
	xTimerStop(LED_timer_handler, portMAX_DELAY);
}

void LED_status_read(char* buffer)
{
	sprintf(buffer, "The current LED status: %d\r\n", HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_5));
	xQueueSend(uart_write_queue_handler, &buffer, portMAX_DELAY);
}

void LED_rtc_read(char* buffer)
{

}

/* USER CODE END 4 */

 /**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM2 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  /* USER CODE BEGIN Callback 0 */

  /* USER CODE END Callback 0 */
  if (htim->Instance == TIM2) {
    HAL_IncTick();
  }
  /* USER CODE BEGIN Callback 1 */

  /* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  while(1);
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
