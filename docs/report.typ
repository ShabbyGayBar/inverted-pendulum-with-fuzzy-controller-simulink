#import "@preview/charged-ieee:0.1.4": ieee
#import "@preview/hallon:0.1.3" as hallon: subfigure

// Apply subfigure styles.
#show: hallon.style-figures

#show: ieee.with(
  title: [Inverted Pendulum with Fuzzy Control],
  abstract: [
    This project focuses on designing a fuzzy control system to stabilize an inverted pendulum on a cart. The fuzzy controller is developed using linguistic rules and membership functions to handle the nonlinear dynamics of the system effectively. The performance of the fuzzy controller is evaluated through simulations in Simulink, demonstrating its ability to stabilize the inverted pendulum under various conditions.
  ],
  authors: (
    (
      name: "Brian Li",
      // department: [ECEN7006],
      organization: [University of Macau],
      location: [Macau, China],
      email: "brian.li@connect.um.edu.mo",
    ),
  ),
  index-terms: ("Fuzzy Control", "Inverted Pendulum", "Nonlinear Systems", "Control Theory", "Simulink"),
  // bibliography: bibliography("refs.bib"),
  figure-supplement: [Fig.],
)

#set figure(placement: top)

= Introduction

The inverted pendulum is a classic problem in control theory and robotics, often used to illustrate the principles of dynamic systems and control strategies. In this project, we aim to design a fuzzy control system to stabilize an inverted pendulum on a cart using the fuzzy logic toolbox and Simulink. The fuzzy controller will be developed using linguistic rules and membership functions to handle the nonlinear dynamics of the system effectively.

By designing a fuzzy control system, we can create a set of linguistic rules that relate the angle and angular velocity of the pendulum to the control input. For example, if the pendulum is leaning to the right and moving quickly, we might want to apply a strong force to the left to counteract this motion. The fuzzy controller will be implemented in Simulink, and we will simulate the system's response to various initial conditions and disturbances to evaluate its performance.

= Fuzzy Inference System Design

#figure(
  image("../figures/triangular_25rules_plotfis.svg"),
  caption: [Block diagram of the fuzzy inference system with 25 rules and triangular membership functions.],
  placement: bottom,
) <triangular_25rules_plotfis>

#figure(
  image("../figures/triangular_25rules_gensurf.svg"),
  caption: [Surface plot of the fuzzy inference system with 25 rules and triangular membership functions.],
) <triangular_25rules_gensurf>

#figure(
  image("../figures/gaussian_product_plotfis.svg"),
  caption: [Block diagram of the fuzzy inference system with Gaussian membership functions.],
) <gaussian_product_plotfis>

#figure(
  image("../figures/gaussian_product_gensurf.svg"),
  caption: [Surface plot of the fuzzy inference system with Gaussian membership functions.],
) <gaussian_product_gensurf>

#figure(
  image("../figures/triangular_49rules_plotfis.svg"),
  caption: [Block diagram of the fuzzy inference system with 49 rules and triangular membership functions.],
) <triangular_49rules_plotfis>

#figure(
  image("../figures/triangular_49rules_gensurf.svg"),
  caption: [Surface plot of the fuzzy inference system with 49 rules and triangular membership functions.],
) <triangular_49rules_gensurf>

With the `FuzzyLogicDesigner` app provided by the fuzzy logic toolbox, we can conveniently design our fuzzy inference system (FIS). We will create two input variables: `error` and `change_in_error`, each with appropriate membership functions to capture the linguistic terms such as "Negative Large", "Negative Small", "Zero", "Positive Small", and "Positive Large". The output variable will be `force`, which will also have its own set of membership functions.

Different configurations of the fuzzy inference system are listed in @triangular_25rules_plotfis, @gaussian_product_plotfis, and @triangular_49rules_plotfis, which show the block diagrams of the fuzzy inference systems with 25 rules and triangular membership functions, Gaussian membership functions, and 49 rules with triangular membership functions, respectively. The corresponding surface plots of these systems are shown in @triangular_25rules_gensurf, @gaussian_product_gensurf, and @triangular_49rules_gensurf.

After designing the fuzzy inference system, we can export the FIS to `.fis` files and call them in Simulink using the Fuzzy Logic Controller block. This allows us to integrate the fuzzy controller with the Simulink model of the inverted pendulum and simulate the system's response under various conditions.

= Simulink Modeling

#figure(
  box(
    image("../figures/pendulum.pdf"),
    clip: true,
    inset: (x: -20pt, y: -75pt),
  ),
  caption: [Simulink model of the inverted pendulum],
) <pendulum>

#figure(
  box(
    image("../figures/pendulum_system.pdf"),
    clip: true,
    inset: (x: -20pt, y: -90pt),
  ),
  caption: [Simulink model of the top level system.],
) <pendulum_system>

#figure(
  image("../figures/sim_1_1_1.svg"),
  caption: [Simulation of the inverted pendulum with derivative gain of $g_0=1, g_1=1, h=1$.],
) <sim_1_1_1>

The mathematical model of the inverted pendulum can be described by the following equations of motion:
$
  accent(y, dot.double) & = (9.8 sin y + cos y [(-dash(u) - 0.25 dot(y)^2 sin y) / 1.5]) / (0.5 [4/3 - 1/3 cos^2 y]) \
           dot(dash(u)) & = -100 dash(u) + 100 u
$ <eqn:pendulum>

where $y$ is the angle of the pendulum from the vertical, $u$ is the control input (force applied to the cart), and $dash(u)$ is a filtered version of the control input to account for actuator dynamics.

The Simulink model of the inverted pendulum is shown in @pendulum, which utilizes integrator and function blocks to implement @eqn:pendulum. Note that the integrator which defines `y` is wrapped around the range of $[-pi, pi]$ to ensure that the angle remains within a reasonable range.

The top-level Simulink model of the system, which includes the fuzzy controller and the inverted pendulum model, is shown in @pendulum_system. 3 derivative gain blocks are used to scale the input and output signals to the desired ranges for the fuzzy controller. The fuzzy controller is implemented using a Fuzzy Logic Controller block, which takes the error and change in error as inputs and produces the control force as output.

= Simulation Results

#figure(
  image("../figures/sim_1_0.1_1.svg"),
  caption: [Simulation of the inverted pendulum with derivative gain of $g_0=1, g_1=0.1, h=1$.],
) <sim_1_0_1_1>

#figure(
  image("../figures/sim_2_0.1_1.svg"),
  caption: [Simulation of the inverted pendulum with derivative gain of $g_0=2, g_1=0.1, h=1$.],
) <sim_2_0_1_1>

#figure(
  image("../figures/sim_2_0.1_5.svg"),
  caption: [Simulation of the inverted pendulum with derivative gain of $g_0=2, g_1=0.1, h=5$.],
) <sim_2_0_1_5>

#figure(
  image("../figures/sim_5_1_1.svg"),
  caption: [Simulation of the inverted pendulum with derivative gain of $g_0=5, g_1=1, h=1$.],
) <sim_5_1_1>

By simulating the system with different derivative gain values, we can observe the performance of the fuzzy controller in stabilizing the inverted pendulum. The simulation results are shown in @sim_1_1_1, @sim_1_0_1_1, @sim_2_0_1_1, @sim_2_0_1_5, and @sim_5_1_1.

It can be observed that with for many configurations, the guassian membership functions either fail to converge (in @sim_1_1_1 and @sim_1_0_1_1) or converge very slowly (in @sim_2_0_1_1), while the triangular membership functions generally perform better in stabilizing the pendulum.

Compared with the choice of membership functions, the number of rules in the fuzzy system puts rather minor and sometimes even negative effects on the system's response. For example, in @sim_1_0_1_1, the fuzzy system with 25 rules converges faster than the one with 49 rules, which may be due to the increased complexity and potential overfitting of the fuzzy system with more rules.

The choice of derivative gain values also significantly affects the system's response, with higher gains leading to faster convergence but potentially more oscillations.

= Conclusion

Overall, the fuzzy controller demonstrates the ability to stabilize the inverted pendulum under various conditions, showcasing the effectiveness of fuzzy logic in handling nonlinear control problems.
