# Agricultural Planning Optimization

This repository contains an AMPL linear programming model designed for an agricultural cooperative. The objective is to maximize total profit by determining the optimal allocation of three types of cereals across three different fields, subject to land, water, and harvesting constraints.

## Problem Description

The cooperative manages three fields and is considering planting three types of cereals (A, B, and C). Each field has a limited amount of arable land and available water for irrigation. Furthermore, the total area dedicated to each cereal type is restricted by the capacity of the harvesting equipment.

### Field Capacities
| Field | Arable Land (acres) | Available Water (1000s cubic meters) |
| :--- | :--- | :--- |
| **Field 1** | 400 | 1500 |
| **Field 2** | 600 | 2000 |
| **Field 3** | 300 | 900 |

### Cereal Requirements & Profit
| Cereal | Max Total Area (acres) | Water Consumption (per acre) | Average Profit (€ per acre) |
| :--- | :--- | :--- | :--- |
| **A** | 100 | 5 | 400 |
| **B** | 800 | 4 | 300 |
| **C** | 300 | 3 | 100 |

### Cooperative Policy (Proportionality Constraint)
To ensure uniform resource consumption, the cooperative enforces a strict policy: **the exact same percentage of available land must be cultivated in every field.** However, the specific mix of cereals planted within that cultivated area can vary freely from field to field.

---

## Mathematical Model

* **Sets:**
  * $Fields = \{1, 2, 3\}$
  * $Cereals = \{A, B, C\}$
* **Parameters:**
  * $surface[i]$: Arable land of field $i$.
  * $water[i]$: Available water in field $i$.
  * $max\_surface[j]$: Maximum planting area for cereal $j$.
  * $water\_consumption[j]$: Water needed per acre for cereal $j$.
  * $profit[j]$: Profit per acre for cereal $j$.
* **Decision Variables:**
  * $surf\_field\_cereal[i, j] \geq 0$: Acres of field $i$ allocated to cereal $j$.
  * $percentage \in [0, 1]$: The uniform percentage of land cultivated across all fields.
* **Objective Function:**
  * Maximize total profit: 
    $$\max \sum_{i \in Fields} \sum_{j \in Cereals} (profit[j] \times surf\_field\_cereal[i, j])$$
* **Subject to:**
  * **Land Proportionality:** $\sum_{j \in Cereals} surf\_field\_cereal[i, j] = percentage \times surface[i]$ $\forall i \in Fields$
  * **Water Limit:** $\sum_{j \in Cereals} (water\_consumption[j] \times surf\_field\_cereal[i, j]) \leq water[i]$ $\forall i \in Fields$
  * **Harvesting Limit:** $\sum_{i \in Fields} surf\_field\_cereal[i, j] \leq max\_surface[j]$ $\forall j \in Cereals$

---

## File Structure

* `Agricultural_Planning.mod`: The structural AMPL model containing the sets, parameters, variables, objective function, and constraints.
* `Agricultural_Planning.dat`: The data file containing the specific numerical values for capacities, limits, and profits.

---

## How to Run

To execute this optimization model, open your AMPL environment and run the following commands:

```ampl
reset;
option solver cplex;
model Agricultural_Planning.mod;
data Agricultural_Planning.dat;
solve;
display surf_field_cereal, percentage;
