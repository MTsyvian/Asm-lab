# Assembly Lab – Chapter 8

This repository contains my solution for **Chapter 8 laboratory work** written in **8086 Assembly (TASM / MASM syntax)**.

The lab focuses on:
- procedures (`call` / `ret`)
- stack usage
- array processing
- basic arithmetic and logic operations
- working with bytes and words
- interaction with DOS interrupts

---

## Important Note

> **This code is a work in progress.**

Some parts of the implementation:
- may be incomplete
- may contain logical or edge-case issues
- were written for learning purposes rather than production use

The main goal of this lab is to **practice low-level concepts** (stack behavior, parameter passing, memory layout), not to provide a perfectly optimized or final solution.

---

## Structure

The code is organized as a single assembly file and includes:
- multiple exercises implemented as separate procedures
- a shared data segment
- a main entry point used to test individual exercises

Not all procedures are called by default — some calls are commented out and can be enabled manually for testing.

---

## Environment

The code is intended to be assembled and tested using:
- Turbo Assembler / MASM
- DOSBox or a compatible 8086 emulator (e.g. emu8086)
- Turbo Debugger (TD) for stack and register inspection

---

## Educational Purpose

This lab was created as part of an academic course and is meant to demonstrate understanding of:
- how `IP`, stack, and procedures work internally
- how higher-level constructs are implemented at the assembly level

---

## Disclaimer

This repository is published **for educational and portfolio purposes only**.  
It is **not guaranteed to be fully correct** and may be improved or refactored in the future.

---

## 👤 Author

**Mikhail Tsyvian**
