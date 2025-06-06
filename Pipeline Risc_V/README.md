# 🚀 Pipelined RISC-V Processor – Computer Architecture Project

## 📌 Project Overview
This project presents the design and implementation of a **5-stage Pipelined RISC-V Processor**.  
The pipeline structure enables multiple instructions to be processed simultaneously, improving **instruction throughput** and **overall performance**.  
The processor supports multiple RISC-V instruction formats and includes mechanisms to handle **data** and **control hazards** efficiently.

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

### 🧪 1. 5-Stage Pipeline
The processor is structured into five sequential stages:

- **IF** – Instruction Fetch  
- **ID** – Instruction Decode  
- **EX** – Execution  
- **MEM** – Memory Access  
- **WB** – Write Back

Each instruction passes through all stages, allowing new instructions to begin before the previous ones finish.

---

### 🧠 2. Hazard Handling

#### ✅ Data Hazards:
- **Forwarding (Bypassing)** to reduce stalls
- **Stalling** if forwarding isn't possible

#### ✅ Control Hazards:
- **Branch Prediction**
- **Pipeline Flushing** to discard mispredicted instructions

---

### 💾 3. Memory Access
- Load (`lw`) and Store (`sw`) operations are handled during the **MEM** stage.
- Address calculation is done in the **EX** stage using immediate values and base registers.

---

### 🧪 4. Simulation & Testing
- A comprehensive testbench validates all instruction types.
- Simulations evaluate performance, hazard handling, and instruction correctness across the pipeline.

---

## 📦 Deliverables

- 🛠 **Processor Design**: Verilog (or VHDL) code implementing the 5-stage pipeline
- 🧪 **Testbench and Simulations**: Test cases for all RISC-V instruction formats and hazards
- 📄 **Documentation**: Detailed design report, hazard resolution logic, and performance results

---

## 🎓 Course Information
This project was completed as part of the **Computer Architecture** course  
📍 University of Tehran  
