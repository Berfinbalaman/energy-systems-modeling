# Engineering Projects – Energy Systems and Simulation

This repository showcases computational engineering projects and simulation studies focused on thermal energy systems, thermodynamic cycle analysis, and building energy performance.

As a Mechanical Engineering undergraduate at **Mersin University**, my work focuses on energy efficiency, computational modeling, and numerical simulation of thermo-fluid systems.

---

## 1. MATLAB – Thermodynamic & Economic Analysis of a Cogeneration (CHP) System

This project presents a steady-state thermodynamic and techno-economic model of a steam-turbine Combined Heat and Power (CHP) system developed in **MATLAB** coupled with the **NIST REFPROP (`refpropm`)** fluid property library.

The simulation evaluates an 11-state Rankine-based cogeneration cycle incorporating a two-stage extraction turbine, a process heater, a throttling valve, and a mixing chamber. Beyond ideal cycle assumptions, the model accounts for real-world component irreversibilities and operational economics.

### Key Methodology & Analyses
* **Automated State-Point & Phase Evaluation:** Calculates enthalpy, entropy, and vapor quality across 11 cycle states, programmatically distinguishing between compressed liquid, saturated mixture, and superheated vapor phases.
* **Irreversibility Modeling:** Incorporates realistic isentropic efficiencies ($\eta_{\text{turb}} = 0.75$, $\eta_{\text{pump}} = 0.75$) for both turbine stages and feedwater pumps.
* **Performance Metrics:** Computes net power generation ($\dot{W}_{\text{net}}$), process heat output ($\dot{Q}_{\text{process}}$), boiler thermal input ($\dot{Q}_{\text{boiler}}$), and the overall **Energy Utilization Factor ($\epsilon_u$)**:
  $$\epsilon_u = \frac{\dot{W}_{\text{net}} + \dot{Q}_{\text{process}}}{\dot{Q}_{\text{boiler}}}$$
* **Techno-Economic Assessment:** Evaluates natural gas fuel consumption ($\eta_{\text{boiler}} = 90\%$, $\text{LHV} = 34.5\text{ MJ/m}^3$) and grid electricity tariffs to determine net hourly operational savings compared to standalone process heat generation.

**Tools & Concepts:**
* MATLAB & NIST REFPROP (`refpropm`)
* Cogeneration (CHP) Cycle Modeling
* First-Law Energy Balance & Isentropic Efficiency
* Techno-Economic Feasibility Analysis

---

## 2. EnergyPlus – Building Thermal Load & Energy Simulation

This project investigates the dynamic thermal behavior and HVAC energy demand of a building model using **EnergyPlus**.

Starting from a baseline single-zone thermal model, parametric modifications were conducted by adjusting weather/climate boundary conditions, infiltration rates, and internal operating parameters to quantify their impact on annual and hourly heating and cooling loads.

### Key Methodology & Analyses
* **Thermal Zone & Envelope Modeling:** Evaluates heat transfer across building envelope components under varying boundary conditions.
* **Parametric Sensitivity:** Analyzes how changes in climate data, outdoor air infiltration, and thermal schedules shift peak heating and cooling energy demands.
* **Load Profile Evaluation:** Generates simulation outputs to assess building energy performance and identify efficiency improvement opportunities.

**Tools & Concepts:**
* EnergyPlus
* Dynamic Building Energy Modeling (BEM)
* Heating & Cooling Load Calculation
* Parametric Climate & Infiltration Sensitivity

---

## 3. Technical & Research Interests

* Thermodynamic Modeling & Optimization of Energy Systems
* Building Energy Simulation & Thermal Management
* Computational Thermo-Fluid Dynamics
* Numerical Simulation & Engineering Software Development

---

## Contact

**Berfin Balaman**  
Mechanical Engineering Student | Mersin University  
* [GitHub](https://github.com/Berfinbalaman)
* [LinkedIn](https://www.linkedin.com/in/berfin-balaman-802223365)
