# Microcontroller PIC16f84a

In this file, I'll explore how to perform I/O programming using PIC microcontroller. I'll provide you with a simple example codes that how it's done.

![pic16f84a-04p-pdip18-8bit-4mhz-mikrodenetleyici-pic16-serisi-dip-microchip-49077-50-B](https://github.com/PrensesMTN/PICBASIC/assets/60544998/76c18466-b7b4-45d2-877f-5d29b9de5633)

## Table of Contents
- [Overview](#overview)
- [Key Features](#key-features)
- [Development Tools](#development-tools)
- [Getting Started](#getting-started)
- [Sample Code](#sample-code)
- [Resources](#resources)
- [Contributing](#contributing)

## Overview
The PIC16F84A is a popular 8-bit microcontroller manufactured by Microchip Technology. It's widely used in various embedded systems and educational projects due to its simplicity and versatility. This microcontroller is part of the PIC (Peripheral Interface Controller) family and is known for its ease of use.

## Key Features
- 8-bit CPU with 35 instructions
- 68 bytes of RAM
- 1,024 words of Flash program memory
- 64 bytes of EEPROM data memory
- 13 I/O pins
- Timer0 module
- Watchdog Timer
- Two-level interrupt capability
- Low power consumption
- 4 MHz maximum operating frequency
- In-Circuit Serial Programming™ (ICSP™) support

## Development Tools
To start working with the PIC16F84A microcontroller, you'll need the following tools:
- PIC16F84A microcontroller (IC)
- Programmer (e.g., PICkit) for flashing code onto the IC
- Development board or a custom circuit for the microcontroller
- PIC development environment (e.g., MPLAB X IDE)
- PIC programming software (e.g., MPLAB X IPE)

## Getting Started
1. Set up your PIC development environment with the required software and programmer.
2. Create a new project or source code file for your PIC16F84A project.
3. Write your code using the PIC assembly language or a high-level language like C.
4. Compile or assemble your code to generate a binary file.
5. Use the programmer to flash the code onto the PIC16F84A IC.
6. Connect the IC to your development board or custom circuit.

## Sample Code
Here's a simple example of code in assembly language for flashing an LED connected to one of the I/O pins:

```assembly
; PIC16F84A LED Blinking Example

BSF     STATUS, RP0      ; Bank 1
MOVLW   B'00000000'      ; Set GPIO as output
MOVWF   TRISB
BCF     STATUS, RP0      ; Bank 0

LOOP:
    BSF     PORTB, 0     ; Turn on the LED (assuming connected to RB0)
    CALL    DELAY       ; Call a delay function
    BCF     PORTB, 0     ; Turn off the LED
    CALL    DELAY       ; Call a delay function
    GOTO    LOOP

DELAY:
    ; Delay function implementation here
    RETURN
```

## Resources
- [PIC16F84A ](https://www.microchip.com/en-us/product/PIC16F84A)
- [PIC16F84A Datasheet](https://pdf.direnc.net/upload/pic16f84a.pdf)
- Online tutorials and forums
- Microchip's official documentation and resources

## Contributing
Contributions to this repository are welcome! If you have information, code examples, or resources related to the PIC16F84A microcontroller that you'd like to share, please feel free to contribute.

