# Inverted Pendulum with Fuzzy Controller (Simulink)

A MATLAB/Simulink implementation of an inverted pendulum control system using fuzzy logic controllers. This project demonstrates the application of fuzzy inference systems (FIS) to stabilize an inverted pendulum, a classic control theory problem.

## Overview

The inverted pendulum is a nonlinear, unstable system that requires continuous control to maintain balance. This project uses fuzzy logic control instead of traditional PID or LQR controllers to handle the system's nonlinearity and uncertainty. Three different fuzzy controller configurations are implemented and compared:

1. **Triangular 25 Rules** - Uses triangular membership functions with 25 fuzzy rules
2. **Triangular 49 Rules** - Uses triangular membership functions with 49 fuzzy rules for finer control
3. **Gaussian Product** - Uses Gaussian membership functions with product-based inference

## Getting Started

### Prerequisites

- MATLAB (R2020b or later recommended)
- Simulink
- Fuzzy Logic Toolbox

### Opening the Project

1. Clone this repository:
   ```bash
   git clone https://github.com/ShabbyGayBar/inverted-pendulum-with-fuzzy-controller-simulink.git
   cd inverted-pendulum-with-fuzzy-controller-simulink
   ```

2. Open MATLAB and navigate to the project directory

3. Open the MATLAB project file:
   ```matlab
   open('inverted-pendulum-with-fuzzy-controller-.prj')
   ```

### Running the Simulations

#### Option 1: Using Live Scripts (Recommended)

Open and run one of the live scripts in the `scripts/` directory:

- `scripts/gaussian_product.mlx` - Gaussian membership function controller
- `scripts/triangular_25rules.mlx` - Triangular 25-rule controller
- `scripts/triangular_49rules.mlx` - Triangular 49-rule controller

These live scripts will:
- Load the corresponding fuzzy inference system
- Run the simulation
- Generate visualization plots
- Display performance metrics

#### Option 2: Using Simulink Models

Open one of the Simulink models:

```matlab
open_system('simulink/pendulum.slx')
% or
open_system('simulink/pendulum_system.slx')
```

Then run the simulation from the Simulink interface.

## Project File Structure

```
inverted-pendulum-with-fuzzy-controller-simulink/
├── assets/                           # Fuzzy Inference System (FIS) files
│   ├── gaussian_product.fis          # Gaussian membership function FIS
│   ├── triangular_25rules.fis        # Triangular 25-rule FIS
│   └── triangular_49rules.fis        # Triangular 49-rule FIS
│
├── figures/                          # Generated visualization plots
│   ├── *_gensurf.svg                 # Control surface plots
│   ├── *_plotfis.svg                 # FIS structure diagrams
│   ├── *_plotmf_*.svg                # Membership function plots
│   └── *_sim_waveform.svg            # Simulation waveform results
│
├── scripts/                          # MATLAB Live Scripts
│   ├── gaussian_product.mlx          # Gaussian controller script
│   ├── triangular_25rules.mlx        # 25-rule controller script
│   └── triangular_49rules.mlx        # 49-rule controller script
│
├── simulink/                         # Simulink models
│   ├── pendulum.slx                  # Main pendulum model
│   └── pendulum_system.slx           # System-level pendulum model
│
├── resources/                        # Additional project resources
│   └── project/                      # Project configuration files
│
├── inverted-pendulum-with-fuzzy-controller-.prj  # MATLAB project file
├── LICENSE                           # MIT License
└── README.md                         # This file
```

## Fuzzy Controller Design

Each fuzzy controller takes two inputs and produces one output:

### Inputs
- **Error**: Angular position error (range: -π to π radians)
- **Change in Error**: Rate of change of angular position error

### Output
- **Force**: Control force applied to the cart (in Newtons)

### Membership Functions

- **Triangular Controllers**: Use trapezoidal and triangular membership functions
  - 25 Rules: 5 membership functions per input (neg large, neg small, zero, pos small, pos large)
  - 49 Rules: 7 membership functions per input for finer granularity
  
- **Gaussian Controller**: Uses Gaussian membership functions with product-based inference method

## Visualizations

The `figures/` directory contains automatically generated plots including:

- **Membership Function Plots**: Show the input/output membership functions
- **FIS Structure Diagrams**: Visualize the fuzzy inference system architecture
- **Control Surface Plots**: 3D visualization of the control mapping
- **Simulation Waveforms**: Time-domain response of the controlled system

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Copyright (c) 2026 Brian Li

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Acknowledgments

This project demonstrates the application of fuzzy logic control to a classic control theory problem, showing how fuzzy inference can handle nonlinear and uncertain systems effectively.
