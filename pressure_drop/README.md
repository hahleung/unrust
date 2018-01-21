# Pressure_drop
Simple module to estimate pressure drop trought a pipe

The required data are the following:
- characteristics of the pipe, such as diameter, thickness, length, rugosity
- characteristics of the fluid, such as working temperature, pressure, viscosity...
- flowrate of the fluid.
Then, pressure drop is estimated: no algorithm so far.

The following hypothesis is considered:
- fluid is at gas state
- no critical flow through pipe, standard friction coefficient is considered.

The purpose of this simple module (also the next features that will installed) are the following:
- improve treatments of the User requests: the User must be able to only give the nominal diameter, the module will then deduce outside and inside diameter
- improve treatments of results: the result (pressure drop) muste be exportable to a '<.txt>' or '<.xls>' file.
