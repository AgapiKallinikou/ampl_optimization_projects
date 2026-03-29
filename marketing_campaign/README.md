# Advertising Campaign Optimization

This folder contains an AMPL optimization model for a company launching a new product. The goal is to design an advertising campaign that maximizes total audience reach (efficiency) while adhering to strict budget and logical constraints across different media platforms.

## Problem Description

The company has chosen 4 advertising media:
* **Air Media:** Television (TV), Radio
* **Print Media:** Magazine, Journal (Newspapers)

Each medium has a specific cost per advertisement and an expected audience reach (efficiency rating). The data is summarized below:

| Medium | Cost (€) | Audience Reach (Efficiency) |
| :--- | :--- | :--- |
| **TV** | 1000 | 100 |
| **Radio** | 500 | 22 |
| **Magazine** | 600 | 70 |
| **Journal** | 400 | 50 |

### Constraints
1. **Budget:** The total cost of the campaign cannot exceed €30,000.
2. **Magazine Limit:** Due to publication frequency, a maximum of 12 magazine ads can be placed.
3. **Media Balance:** The number of print ads (Magazines + Journals) must not exceed 40% of the broadcast ads (TV + Radio).
4. **Minimum Exposure:** There must be at least 5 TV ads and 5 Radio ads.

---

## Mathematical Model

The problem is formulated as an Integer/Linear Programming model.

* **Sets:** * $AirMedia = \{TV, Radio\}$
  * $PrintMedia = \{Magazine, Journal\}$
  * $Media = AirMedia \cup PrintMedia$
* **Variables:** * $number\_adv[i]$: The number of advertisements placed in medium $i$.
* **Objective Function:** * Maximize $\sum_{i \in Media} (efficiency[i] \times number\_adv[i])$
* **Subject to:**
  * $\sum_{i \in Media} (cost[i] \times number\_adv[i]) \leq 30000$
  * $number\_adv[Magazine] \leq 12$
  * $\sum_{i \in PrintMedia} number\_adv[i] \leq 0.4 \times \sum_{i \in AirMedia} number\_adv[i]$
  * $number\_adv[TV] \geq 5$
  * $number\_adv[Radio] \geq 5$

---

## File Structure

* `Advertisement_Campaign_version_2.mod`: The structural AMPL model defining sets, parameters, variables, objective, and constraints.
* `Advertisement_Campaign_version_2.dat`: The data file containing the specific values, costs, and limits for this campaign.

---

## How to Run

To solve this model, open your AMPL command line or IDE and execute the following commands:

```ampl
reset;
option solver cplex;
model Advertisement_Campaign_version_2.mod;
data Advertisement_Campaign_version_2.dat;
solve;
display number_adv;
