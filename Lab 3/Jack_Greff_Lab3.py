import sys
import random

def main():
    letters_per_line = 100
    lines = 10

    for a in range (0,lines): #Since we repeat the line 10 times
        chain = "I"
        current = "I"
        for i in range (1,letters_per_line): #adds to list and we want i to start as 1 since I starts it
            next_letter = {"_": random.choices(["A","L"], weights = [.5, .5]),#Need list in here so that the choices are reset every time
            "A": random.choices(["M","L"], weights = [.4, .6]),
            "M": random.choices(["_","!"], weights = [.8, .2]),
            "L": "I",
            "I": random.choices(["_","N","V"], weights = [.2,.25, .55]),
            "V":"E",
            "E":"!",
            "N":"E",
            "!":random.choices(["_","I","!"], weights = [.7,.2, .1])
            }

            chain = chain + next_letter[current][0]
            current = next_letter[current][0]

        print(chain)

if __name__ == "__main__":
    main()