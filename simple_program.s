/***************************************************************************************
 *  File Name      : led_switch_echo.s
 *  Project        : DE1-SoC / Cyclone V ARM Cortex-A9 Embedded System
 *  Description    : 
 *      This program continuously reads the state of the slide switches (SW)
 *      on the DE1-SoC FPGA and displays the corresponding value on the red LEDs (LEDR).
 *      It demonstrates basic memory-mapped I/O by accessing peripheral base 
 *      addresses defined in the external address map file:
 *          - LEDR_BASE : Base address of red LEDs
 *          - SW_BASE   : Base address of slide switches
 *
 *  Board/Platform : Terasic DE1-SoC Development Board
 *  Processor      : Dual-core ARM Cortex-A9 (Hard Processor System)
 *  Toolchain      : Intel FPGA Monitor Program / GNU ARM Assembler
 *
 *  Operation      :
 *      1. Load the base address of the LEDs into R1.
 *      2. Load the base address of the switches into R2.
 *      3. Enter an infinite loop:
 *          - Read the 10-bit switch state from SW_BASE into R3.
 *          - Write R3 to LEDR_BASE to display it on the red LEDs.
 *
 *  Usage Notes    :
 *      - Requires `address_map_arm.s` in the same project directory for
 *        memory-mapped peripheral address definitions.
 *      - The program loops infinitely; reset or reprogram the FPGA to stop execution.
 *
 *  Author         : R. Moore
 *  Date Created   : 2025-08-12
 *  Last Modified  : 2025-08-12
 *  Version        : 1.0
 *
 *  Revision History:
 *      v1.0  - Initial version; implemented LED display mirroring switch state.
 *
 ***************************************************************************************/
.include "address_map_arm.s"
.text
.global _start
_start:
LDR R1, =LEDR_BASE /* Address of red LEDs. */
LDR R2, =SW_BASE /* Address of switches. */
LOOP: LDR R3, [R2] /* Read the state of switches.*/
STR R3, [R1] /* Display the state on LEDs. */
B LOOP
.end
