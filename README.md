# Operations Research & Optimization Models in AMPL

This repository contains a collection of advanced Linear Programming (LP) and Integer Programming models formulated and solved using the **AMPL** algebraic modeling language. 

The projects tackle complex, real-world operational challenges, ranging from marketing budget allocation to agricultural planning and manufacturing bottleneck analysis. The models utilize state-of-the-art solvers (such as CPLEX) to drive data-backed business decisions.

---

## Key Skills & Concepts Highlighted
* **Mathematical Modeling**: Translating complex business rules into mathematical constraints, sets, and objective functions.
* **Operations Research**: Resource allocation, profit maximization, and operational efficiency.
* **Advanced AMPL Scripting**: Utilizing `for` loops, `repeat...while` structures, and dynamic sets to automate workflows.
* **Sensitivity Analysis**: Programmatic extraction and vector storage of slack variables and dual values (shadow prices) to discover critical business bottlenecks.

---

## Repository Structure

The repository is divided into three distinct business cases:

### 1. [Advertising Campaign Optimization](./Advertising_Campaign/)
**Focus: Marketing & Media Mix Allocation**
* **Business Problem:** Maximizing total audience reach for a new product launch across Air (TV, Radio) and Print (Magazines, Journals) media.
* **Key Features:** Formulates constraints around maximum budget, platform-specific publication limits, and proportional relationships between digital and print media spending.

### 2. [Agricultural Yield Planning](./Agricultural_Planning/)
**Focus: Resource Allocation & Policy Enforcement**
* **Business Problem:** Maximizing the total profit of an agricultural cooperative by optimally distributing three types of crops across multiple fields.
* **Key Features:** Handles multi-dimensional constraints including land availability, water consumption per crop, harvesting limits, and a strict proportionality policy (ensuring uniform land usage percentages across all fields).

### 3. [Leather Production & Sensitivity Analysis](./Leather_Production/)
**Focus: Manufacturing Mix & Automated Bottleneck Discovery**
* **Business Problem:** Optimizing the production mix (Purses, Bags, Backpacks) based on available raw leather, sewing, and finishing labor.
* **Key Features:** Goes beyond basic optimization by implementing **advanced AMPL scripting**. It includes discrete and dynamic scripts (`sensitivity_discrete.run`, `sensitivity_dynamic.run`) that programmatically alter resource availabilities. It utilizes `while` loops to dynamically track shadow prices and automatically stops when the active bottleneck (leather) is fully resolved.

---

## How to Run the Models

To execute any of these models, you need the AMPL environment and a compatible solver (e.g. CPLEX) installed.
Once you have opened your AMPL command-line interface, execute the respective .run scripts or basic setup commands:
```bash
reset;
option solver cplex;
model Production.mod;
data Production.dat;
solve;
```
(Note: Specific execution instructions and advanced scripts for Sensitivity Analysis are detailed within each project's individual README).

---

## Academic Context & Author

These optimization models were developed as part of the coursework at the **National and Kapodistrian University of Athens (NKUA)**.

* **Author:** Agapi Kallinikou
* **Academic Year:** 2024 - 2025
