# Serial Communication with Microcontroller PIC16f877a

In this file, we'll explore how to perform serial data communication using PIC microcontrollers. We'll provide you with a simple example code that demonstrates how it's done.


## Table of Contents
- [Overview](#overview)
- [Getting Started](#getting-started)
- [Code Example](#code-example)
- [How It Works](#how-it-works)
- [Contributing](#contributing)

## Overview
Serial communication is a fundamental aspect of microcontroller programming. It allows devices to exchange data in a sequential manner. In this project, we'll dive into UART (Universal Asynchronous Receiver-Transmitter), an asynchronous serial communication protocol commonly used in microcontrollers, sensors, and other electronic devices.

## Getting Started
Before you can run the code, you'll need a PIC microcontroller and a development environment set up. Ensure you have the necessary hardware and software tools ready.

## Code Example
Here's a simplified code snippet that demonstrates how to send a character string via UART:

```c
void serialWriteByte(char data){
    while (!TRMT);
    TXREG = data;
}

void serialPrint(char str[]) {
    int i = 0;
    while (str[i] != '\0') {
        serialWriteByte(str[i]);
        i++;
    }
}

void main(void) {
    // Initialize UART settings
    // ...
    
    char message[] = "Hello, UART!\r\n";

    while (1) {
        serialPrint(message);
        // Delay for a while
        // ...
    }
}
```

## How It Works
- UART communication is asynchronous, meaning data is sent without a shared clock signal.
- Data is framed with start and stop bits for synchronization.
- The baud rate determines the data transmission speed.
- The `serialPrint` function sends character strings via UART.

## Contributing
Contributions to this project are welcome! If you have suggestions or improvements, please open an issue or submit a pull request.

