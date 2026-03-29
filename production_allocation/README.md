# Leather Production Optimization & Sensitivity Analysis

This project implements an advanced Linear Programming (LP) model in AMPL to optimize the production line of a leather goods manufacturer. Beyond simply finding the optimal production mix, this repository focuses heavily on **automated Sensitivity Analysis** and **Bottleneck Identification** using custom AMPL scripting.

---

## The Business Problem

A manufacturing workshop produces three types of products: **Purses, Bags, and Backpacks**. The production process relies on three key resources:
1. **Raw Leather** (sq. decimeters)
2. **Sewing Labor** (hours)
3. **Finishing Labor** (hours)

The objective is to determine the optimal production quantities for each product to **maximize total profit**, while strictly respecting the limited daily availability of these resources.

---

## Project Structure & Core Model

The baseline optimization model is defined by the following files:
* `Production.mod`: The mathematical structure of the model, defining sets (Resources, Products), parameters (prices, requirements, availability), the decision variables, and the profit maximization objective.
* `Production.dat`: The specific dataset for the current production cycle, detailing resource capacities and per-unit requirements.

---

## Advanced Sensitivity Analysis (AMPL Scripting)

The most critical part of this project is analyzing how resource constraints—specifically raw leather availability—affect profitability. We use AMPL's scripting capabilities to programmatically extract **slack values** and **shadow prices (dual values)**. 

The analysis is broken down into three automated scripts:

### 1. Baseline Repetition (`Production.run`)
A foundational script that iteratively increases leather availability by 10 units over 5 steps. It prints the immediate impact on the production mix, the slack, and the shadow price of the leather constraint.

### 2. Discrete Scenario Evaluation (`sensitivity_discrete.run`)
This script executes a structured sensitivity analysis over a predefined set of leather availabilities (30, 40, 50, 60, 70). Instead of merely printing results, it utilizes a `for` loop to programmatically solve the model and **store the metrics into newly defined vectors** (`avail_leather_obj`, `avail_leather_slack`, `avail_leather_dual`). This vectorized approach allows for clean data extraction and further post-processing.

### 3. Dynamic Bottleneck Discovery (`sensitivity_dynamic.run`)
This script simulates a dynamic business environment where the workshop continuously procures more leather in small increments (steps of 2 units). 
* It uses a `repeat { ... } while` loop to continually solve and expand the evaluation set.
* **Intelligent Stopping Criterion:** The loop automatically terminates the exact moment the dual value (shadow price) of the leather constraint drops to zero. This algorithmically identifies the exact threshold where leather ceases to be the production bottleneck, preventing the company from over-purchasing raw materials.

---

## Execution Guide

To run the models and the automated analysis, open your AMPL command-line interface and execute the scripts directly:

**To run the discrete scenario analysis:**
```ampl
reset;
option solver cplex;
include sensitivity_discrete.run;
```

**To run the dynamic bottleneck discovery:**
```ampl
reset;
option solver cplex;
include sensitivity_dynamic.run;
```
(Note: Ensure you have an appropriate solver like CPLEX configured within your AMPL environment).
