# 🧠 Single-Cycle RISC-V Processor – Computer Architecture Project

## 📌 Project Overview
This project involves the design and implementation of a **Single-Cycle RISC-V Processor**, capable of executing a wide range of RISC-V instructions in a **single clock cycle**.  
The processor is built to showcase the execution of various instruction types including arithmetic, memory, branch, and immediate-based operations.

---

## 🧾 Supported Instruction Types

### ✅ R-Type:
`add`, `sub`, `and`, `or`, `slt`, `sltu`

### ✅ I-Type:
`lw`, `addi`, `xori`, `ori`, `slti`, `sltiu`, `jalr`

### ✅ S-Type:
`sw` (Store Word)

### ✅ B-Type:
`beq`, `bne`, `blt`, `bge`

### ✅ J-Type:
`jal` (Jump and Link)

### ✅ U-Type:
`lui` (Load Upper Immediate)

---

## 🔧 Key Components

### 🔁 1. Single-Cycle Execution
All five instruction stages—**fetch**, **decode**, **execute**, **memory**, **write-back**—are performed in one clock cycle.

### 🧩 2. Datapath
Includes:
- **Registers** for holding values
- **ALU** for arithmetic/logic operations
- **Memory units** for load/store instructions

### 🧠 3. Control Unit
Generates necessary control signals based on instruction opcode and funct fields to drive the datapath and coordinate execution.

### 🗂 4. Memory Access
- Load (`lw`) and store (`sw`) instructions supported.
- Memory address calculated using base register + immediate.

### 🔀 5. Branching and Jumping
- Fully supports conditional (`beq`, `bne`, etc.) and unconditional jumps (`jal`, `jalr`).
- Program Counter (PC) is updated with target address accordingly.

---

## 📦 Deliverables

- 🛠 **Processor Design**: Verilog (or VHDL) implementation of the processor
- 🧪 **Testbench & Simulations**: Covering all supported instruction types
- 📑 **Documentation**: Includes control unit design, datapath diagrams, signal descriptions, and cycle-by-cycle walkthrough

---

## 🎓 Course Information
This project was developed as part of the **Computer Architecture** course  
📍 University of Tehran  

