# ⏱ Multi-Cycle RISC-V Processor – Computer Architecture Project

## 📌 Project Overview
This project presents the design and implementation of a **Multi-Cycle RISC-V Processor**, where each instruction is executed over multiple clock cycles.  
Unlike single-cycle or pipelined processors, the multi-cycle design allows **hardware reuse** across stages, improving area efficiency while preserving instruction completeness.

The design supports a wide range of **RISC-V instruction formats**, with an emphasis on **cycle-by-cycle control flow**, **instruction decoding**, and **efficient datapath utilization**.

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

### ⏱ 1. Multi-Cycle Execution
Instructions are divided into sequential stages—**Instruction Fetch**, **Decode**, **Execute**, **Memory Access**, and **Write-Back**—each performed in a **separate clock cycle**. This segmentation:
- Reduces combinational path delays
- Optimizes control complexity
- Facilitates hardware sharing (e.g., single ALU for all stages)

---

### 🧠 2. Control Unit
A **Finite State Machine (FSM)** manages instruction flow, issuing precise **control signals per cycle**.  
It handles:
- Instruction decoding
- Conditional branching logic
- Memory control sequencing
- Write-back enable logic

---

### 🔩 3. Datapath
Includes:
- **General-purpose register file**
- **ALU** for arithmetic/logical operations
- **Instruction & Data memory blocks**
- **Multiplexers & control buses** for operand selection

This architecture ensures **minimal hardware duplication** and encourages reuse across cycles.

---

### 💾 4. Memory Access
`lw` and `sw` instructions are processed with:
- Address computation via ALU
- Immediate value decoding from I-type/S-type format
- Register-memory interaction in **MEM** stage

---

### 🔀 5. Branching & Jumping
Supported through:
- Branch condition evaluation during **EX stage**
- PC update with **branch target** or **jump address**
- Use of `Zero`, `Less Than`, and `Greater Than Equal` flags for condition-based branching

---

## 📊 Evaluation Criteria

| Criterion | Description |
|----------|-------------|
| ✅ **Functional Correctness** | Execution of all instruction formats |
| ⚙️ **Datapath & Control Design** | Efficient hardware sharing and control sequencing |
| ⏳ **Performance** | Cycle count per instruction (CPI), area efficiency, and simulation results |

---

## 📦 Deliverables

- 🛠 **Processor Design**: Verilog or VHDL-based RTL model
- 🧪 **Testbench & Simulations**: Covering each instruction type and hazard scenario
- 📄 **Documentation**:
  - Control signal tables
  - Datapath diagrams
  - Cycle-by-cycle instruction execution trace

---

## 🎓 Course Information
This project was completed as part of the **Computer Architecture** course  
📍 **University of Tehran**  
