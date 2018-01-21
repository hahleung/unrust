#Thermal_balance.rb
#Calculate the output temperature of a gas for a given duty and a given input temperature

#PART 1A: Define physical data base
#Thermal duty given to gas (kW), input temperature (°C) and volumic flow rate (m3/h)
P_THERM = 0.1
T_INPUT = 20
V_FLOWRATE = 10
#Heat capacity (J/kg/K)
CP = 1000
#Working pressure (Pa) and molecular weight (kg/mol) for density calculation
PRESSURE = (1013.25 - 50) * 100
MOL_WEIGHT = 0.02895
#Ideal gas constant (J/mol/K)
R_GAZ = 8.3144621

#PART 1B: Define mathematical parameters
#Initial iteration for algorithms, maximum iterations authorized in several algorithms and required precision
NO_ITERATION_INI = 0
N_MAX = 100
PRECISION = 0.01
#Function allowing algorithms to going on and incremanting iteration counter  
def test_next_iteration(no_iteration)
  if no_iteration > N_MAX
    p "No results found after #{N_MAX} iterations."
    exit
  else
    no_iteration + 1
  end
end

#PART 2: Calculate the output temperature
#Dichotomy algorithm
#Initialize required dichotomy parameters
UPPER_TEMPERATURE_INI = 10000
LOWER_TEMPERATURE_INI = -273.15

#Dichotomy launch by recursion
def dichotomy(upper_temperature, lower_temperature, no_iteration)
  t_output = (upper_temperature  + lower_temperature) / 2
  t_average = (t_output + T_INPUT) / 2
  #Density in kg/m3 only correct for gas similar to ideal gas
  density = PRESSURE * MOL_WEIGHT / R_GAZ / (t_average + 273.15)
  #Thermal balance on gas fluid
  p_therm_var = V_FLOWRATE * density * CP * (t_output - T_INPUT) / 3600 / 1000
  delta = ((P_THERM - p_therm_var)*100).abs

  #Can algorithm keep going on ?
  no_iteration_next = test_next_iteration(no_iteration)

  if delta < PRECISION
    [no_iteration_next, density, t_output]
  elsif (P_THERM < p_therm_var)
    dichotomy(t_output, lower_temperature, no_iteration_next)
  else
    dichotomy(upper_temperature, t_output, no_iteration_next)
  end
end

#Newton-Raphson algorithm
#Initialize required Newton-Raphson parameters
T_OUTPUT_INI = 0

#Define zero function and its derivative for Newton-Raphson algorithm
def zero_function(temperature)
  P_THERM * 1000 - 2 * V_FLOWRATE * PRESSURE * MOL_WEIGHT * CP / R_GAZ / 3600 * (temperature - T_INPUT) / ((temperature + 273.15) + (T_INPUT + 273.15))
end
def zero_function_derivative(temperature)
  -4 * V_FLOWRATE * PRESSURE * MOL_WEIGHT * CP / 3600 * (T_INPUT + 273.15) / R_GAZ / (((temperature + 273.15) + (T_INPUT + 273.15)) ** 2)
end

#Dichotomy launch by recursion
def newton_raphson(t_output, no_iteration)
  t_output_new = t_output - zero_function(t_output) / zero_function_derivative(t_output)
  delta = zero_function(t_output_new)

  #Can algorithm keep going on ?
  no_iteration_next = test_next_iteration(no_iteration)

  if delta < PRECISION
    density = 2 * PRESSURE * MOL_WEIGHT / R_GAZ / ((t_output + 273.15) + (T_INPUT + 273.15))
    [no_iteration_next, density, t_output_new]
  else
    newton_raphson(t_output_new, no_iteration_next)
  end
end

#PART3: Display results
#Display data base
p "Data base are:"
p "Thermal duty given to gas (kW): #{P_THERM}"
p "Input temperature (°C): #{T_INPUT}"
p "Volumic flow rate (m3/h): #{V_FLOWRATE}"
p "Heat capacity (J/kg/K): #{CP}"
p "Working pressure (Pa): #{PRESSURE}"
p "Molecular weight (kg/mol): #{MOL_WEIGHT}"
puts "-"*50

#Let user choose for dichotomy algorithm or Newton-Raphson algorithm
p "For using dichotomy algorithm, press 1"
p "For using Newton-Raphson algorithm, press 2"
choice = gets.chomp.to_i
if choice == 1
  results = dichotomy(UPPER_TEMPERATURE_INI, LOWER_TEMPERATURE_INI, NO_ITERATION_INI)
  p "Dichotomy algorithm chosen."
elsif choice == 2
  results = newton_raphson(T_OUTPUT_INI, NO_ITERATION_INI)
  p "Newton-Raphson algorithm chosen."
end

puts "-"*50
p "Results of thermal balance are:"
p "Convergence after #{results[0]} iterations."
p "Density at average temperature (kg/m3): #{"%.3f" % results[1]}"
p "Output temperature after convergence (°C): #{"%.0f" % results[2]}"
