# Ramsey-Cass-Koopmans Model — MATLAB Group Project

**Course:** Economics — University of Toronto  
**Language:** MATLAB

---

## Overview

This project implements the Ramsey-Cass-Koopmans (RCK) model of optimal economic growth in MATLAB. It solves for the steady-state capital and consumption per effective worker, simulates the dynamic paths of the economy under different initial conditions, and visualizes phase diagrams showing convergence behavior around the steady state.

---

## Model Parameters

| Parameter | Value | Description |
|---|---|---|
| `K_0` | 411.7 | Initial capital |
| `L_0` | 115.3 | Initial labor |
| `H` | 100 | Human capital / hours |
| `rho` | 0.05 | Rate of time preference |
| `n` | 0.025 | Population growth rate |
| `g` | 0.02 | Technology growth rate |
| `alpha` | 1/3 | Capital share of output |

---

## Project Structure

```
├── GroupProject.m          # Main script — runs all parts
├── Path_ck.m               # Simulates dynamic paths of k and c
├── c_growth.m              # Growth rate of consumption
├── k_dot.m                 # Law of motion for capital
├── k_locus.m               # k-locus: consumption consistent with k_dot = 0
├── RCK_f.m                 # Production function f(k) = k^alpha
├── RCK_df.m                # Derivative of production function f'(k)
└── README.md               # This file
```

---

## Function Descriptions

### `RCK_f.m`
Production function in intensive form:
```
f(k) = k^alpha
```

### `RCK_df.m`
Marginal product of capital:
```
f'(k) = alpha * k^(alpha - 1)
```

### `c_growth.m`
Growth rate of consumption per the Euler equation:
```
c_growth = f'(k) - rho - g
```
Used to find `k*` where `c_dot = 0`.

### `k_dot.m`
Law of motion for capital per effective worker:
```
k_dot = f(k) - c - (n + g) * k
```

### `k_locus.m`
Consumption level consistent with `k_dot = 0`:
```
c = f(k) - (n + g) * k
```

### `Path_ck.m`
Simulates the dynamic path `(k, c)` over `T` periods given initial conditions `(k_0, c_0)`. Returns vectors of capital `k_vec`, consumption `c_vec`, and the Euclidean distance from the steady state at the final step.

---

## How to Run

1. Open MATLAB and set the working directory to the project folder
2. Run `GroupProject.m` — this executes all parts sequentially
3. Figures will generate automatically showing the phase diagram and simulated paths

---

## Key Results

**Steady State:**
- `k*` solved numerically using `fzero` on `c_growth(k) = 0`
- `c*` computed from `k_locus(k*)` where `k_dot = 0`

**Phase Diagram Paths:**

Two trajectories are simulated from `k_0 = 5`:

| Trial | `c_0` | Behavior |
|---|---|---|
| 1 | 1.4 | k increases until T=3, then decreases — economy overshoots into k_dot < 0 region |
| 2 | 0.4 | c increases until T=6, then decreases — economy overshoots into c_dot < 0 region |

Both paths illustrate saddle-path dynamics around the steady state, consistent with RCK model theory.

---

## Requirements

- MATLAB (any recent version)
- No additional toolboxes required
