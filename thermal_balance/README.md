# Thermal_balance
Thermal balance resolution for gas

A simple thermal balance for a gas is solving by dichotomy algorithm: a thermal duty is given to this gas and the input temperature is known.

The hypothesis are the following:
- the gas is considered as an ideal gas
- the gas is heated i.e. the given thermal duty is a positive value
- the thermal heat capacity is considered constant on the heating temperature range, neither the density of the gas.

Following features will be:
- evolve the dichotomy algorithm to a newton-raphson algorithm
- allow the heating or the cooling the gas regarless.
