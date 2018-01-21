#Pressure_drop.rb

#PART 0: Define constants
#Ideal gas constant (J/K/mol)
R_GAZ = 8.3144621

#PART 1: Define line characteristics
#DN of pipe, OD of pipe and thickness of pipe (mm)
diameter_nominal  = 100
diameter_outside = 500
thickness = 10
#ID of pipe (mm)
diameter_inside = (diameter_outside - 2*thickness).to_f

#PART 2: Define fluid characteristics
#Working temperature (°C), working pressure (mbarg), molar weight of gas (kg/mol) and viscosity (cP)
TEMPERATURE_C = 20
PRESSURE_MBARG = -4
M_WEIGHT = 0.02895
VISCOSITY = 0.018
#Estimation of density of fluide (kg/m3)
density = (1013.25 + PRESSURE_MBARG) * 1e2 * M_WEIGHT/ R_GAZ / (TEMPERATURE_C + 273.15)

#PART 3: Estimate volumic flowrate and fluid speed
#Mass flowrate (kg/h)
M_FLOWRATE = 3000.0
#Estimation of volumic flowrate (m3/h) and fluid speed in pipe (m/s)
q_flowrate = M_FLOWRATE / density
pipe_section = Math::PI / 4 * (diameter_inside / 1000) ** 2
fluid_speed = q_flowrate / 3600 / pipe_section

#PART 4: Estimate pressure drop
#Lenght of pipe (m) and its rugosity (mm)
PIPE_LENGTH = 10
RUGOSITY = 0.05
#Estimation of pressure drop (bar)
reynolds_number = density * diameter_inside * fluid_speed / VISCOSITY
friction_coefficient = (((8/reynolds_number)**12+1/((2.457*Math.log(((7/reynolds_number)**(0.9)+0.27*RUGOSITY/diameter_inside)**(-1)))**16+(37530/reynolds_number)**16)**1.5)**(1/12))*8
rv2_coefficient = density * fluid_speed ** 2

singular_total_coefficient = 0
regular_total_coefficient = friction_coefficient / diameter_inside * PIPE_LENGTH * 1000

total_pressure_drop = 0.5 * rv2_coefficient * (singular_total_coefficient + regular_total_coefficient) / 101325

#PART 5: Display results
p "DATA BASE ARE:"
p "Nominal diameter is DN#{diameter_nominal}"
p "Working temperature is (C): #{TEMPERATURE_C}"
p "Working pressure is (mbarg): #{PRESSURE_MBARG}"
p "Molar weight is (kg/mol): #{M_WEIGHT}"
p "Viscosity is (cP): #{VISCOSITY}"
p "Mass flowrate is (kg/h): #{M_FLOWRATE}"
p "Pipe length is (m): #{PIPE_LENGTH}"
p "Pipe rugosity is (mm): #{RUGOSITY}"
p "-"*50
p "RESULTS ARE:"
p "Density is (kg/m3): #{"%.3f" % density}"
p "Volumic flowrate is (m3/h): #{"%.1f" % q_flowrate}"
p "Fluid speed is (m/s): #{"%.2f" % fluid_speed}"
p "Total pressure drop for the pipe (bar): #{"%.5f" % total_pressure_drop}"