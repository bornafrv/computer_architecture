# ➗ 10-bit Division Circuit – Computer Arithmetic Project

## 📌 Project Overview
This project focuses on **Computer Arithmetic**, specifically the design and simulation of a **10-bit division circuit** using **SystemVerilog**.  
The goal is to create a sequential division module that computes the **quotient** and **remainder** for 10-bit inputs, while also handling exceptional cases like **division by zero** and **overflow**.


---

## 🔧 Key Components

### ✅ 1. Inputs and Outputs

#### 🔷 Inputs:
- `a_in` : 10-bit dividend  
- `b_in` : 10-bit divisor  
- `start` : Begins the division operation  
- `sclr` : Synchronous clear signal  
- `clk` : Clock signal  

#### 🟢 Outputs:
- `q_out` : 10-bit quotient  
- `dvz` : Division-by-zero flag  
- `ovf` : Overflow flag  
- `busy` : Indicates division is in progress  
- `valid` : Indicates result is ready  

---

### 🔁 2. Division Algorithm
- Operates **sequentially**, performing iterative subtraction  
- Constructs quotient bit-by-bit over multiple clock cycles  
- Monitors `dvz` to detect **division by zero** and disables result output  
- Uses internal **registers** to store intermediate dividend and divisor values

---

### 🧪 3. Simulation Process
- Step-by-step observation of the division process  
- Simulates edge cases including:
  - Division by zero
  - Overflow conditions
  - Zero dividend and equal divisor/dividend cases  
- Simulation waveform outputs allow visualization of the FSM and internal states

---

### ✅ 4. Verification
- Comprehensive testbench with diverse input scenarios  
- Flags (`dvz`, `ovf`, `busy`, `valid`) monitored throughout the operation  
- Verifies **correct timing**, **flag generation**, and **result accuracy**

---

## 📦 Deliverables

- 🛠 **SystemVerilog Code**: Complete divider module  
- 🧪 **Testbench & Waveforms**: Simulation output for functional validation  
- 📑 **Documentation**: Report detailing algorithm design, waveform analysis, and handling of exceptional conditions

---

## 🎓 Course Information
This project was developed as part of the **Computer Arithmetic** course  
📍 **University of Tehran**  
