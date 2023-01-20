import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as stats
from scipy.stats import bernoulli
import pymc3 as pm

def main():
    np.set_printoptions(precision=3, suppress=True)
    challenger_data = np.genfromtxt("challenger_data.csv", skip_header=1,
                                    usecols=[1, 2], missing_values="NA",
                                    delimiter=",")
    #drop the NA values
    challenger_data = challenger_data[~np.isnan(challenger_data[:, 1])]

    #plot it, as a function of tempature (the first column)
    print("Temp (F), O-Ring failure?")
    print(challenger_data)


    plt.scatter(challenger_data[:, 0], challenger_data[:, 1], s=75, color="k",
                alpha=0.5)
    plt.yticks([0, 1])
    plt.ylabel("Damage Incident?")
    plt.xlabel("Outside temperature (Fahrenheit)")
    plt.title("Defects of the Space Shuttle O-Rings vs temperature")
    plt.show()

    #1 and 0 for normal sigma distribution

    temperatures = []
    outcomes = []
    for i in challenger_data.tolist():
        temperatures.append(i[0])
        outcomes.append(i[1])


    mean = sum(temperatures)/len(temperatures)
    variance = -mean**2 #add below which is E[X^2]
    for i in temperatures:
        variance += i**2/len(temperatures)

    standard_deviation = np.sqrt(variance)

    alpha = np.random.normal(mean,standard_deviation) #Normal Distribution 
    beta = np.random.normal(mean,standard_deviation) #Normal Distribution 

    p = lambda t : 1/(1+e^(beta*t + alpha))

    # observed = pm.Bernoulli("bernoulli_obs", p, observed=D)

    print(observed)


if __name__ == "__main__":
    main()