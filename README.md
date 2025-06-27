# assembly-8086

This repository contains a curated collection of 8086 Assembly Language programs developed during the **Computer Organization and Assembly Language (COAL)** course. These programs were written and tested using **EMU8086**


## 💡 Topics Covered

- 8086 architecture basics
- Register operations
- Addressing modes
- ALU and arithmetic logic
- Looping and array handling
- Stack and procedure calls
- Software interrupts (INT 21h)
- Exception handling and MMX overview

## 🛠️ Tools Required

- [EMU8086](http://www.emu8086.com/)

## 🚀 How to Run

1. Open `.asm` files in **EMU8086**
2. Assemble and run the code using emulator/compiler.
3. For DOSBox:
   - Mount your project folder inside DOSBox
   - Use `TASM` to compile and `TLINK` to link

```dos
tasm program.asm
tlink program.obj
program.exe
