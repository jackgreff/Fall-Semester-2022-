Foundations of Data Science, Fall 2022

# Lab 3: Markov Text Generation

The purpose of this program is to (1) give students practice using Python and (2) give students practice working with conditional probabilities while also providing some time for students to catch up. 

Write the following Python program.  If you do not finish during the lab time, complete it as a homework assignment. This lab is worth 10 points.  You may find the code in [lab3.py](./lab3/lab3.py) to be useful.  You can use [rejection sampling](https://en.wikipedia.org/wiki/Rejection_sampling) by generating random numbers, but the provided code shows an easier way with the `choices()` function.

1. Draw the probabilistic finite state machine represented by the following probabilities.  For this lab, you may simply draw it and take a photo, but you may want to use this as an opportunity to learn to easily create graphs with [Mermaid](https://support.typora.io/Draw-Diagrams-With-Markdown/), which is integrated into Mark Text ,or [GraphViz](https://www.graphviz.org/Gallery/directed/fsm.html).  See example code for GraphViz in [the lab3 subdirectory](./lab3/).  (Type `make` to build the example graph.)

- The first letter is always "I" (“eye”).

- The subsequent letters will be generated with the following probabilities:

- You may use spaces instead of underscores; it doesn't matter.

- P(A | _) = 0.5

- P(L | _) = 0.5

- P(M | A) = 0.4

- P(_ | M) = 0.8

- P(! | M) = 0.2

- P(L | A) = 0.6

- P(I | L) = 1

- P(_ | I) = 0.2

- P(N | I) = 0.25

- P(V | I) = 0.55

- P(E | V) = 1

- P(E | N) = 1

- P(! | E) = 1

- P(_ | !) = 0.7

- P(I | !) = 0.2

- P(! | !) = 0.1

  

2. Write a Python program that outputs the result of this Markov model. The program will output 100 letters per line, on 10 lines.  It will output *nothing else*.  You can access `stdin` and `stdout` streams directly by importing from `sys`, which will allow you to print without newlines.  Alternatively, you can use `print` with an extra optional argument.  

   ```python
   print("a string", end = '')
   ```

   This program must be runnable from the command line with `python3`.

Hint:

One possible way of doing this is the following:

```python
p = dict()
p["A"] = list()
transitions = ["B", "C"]
probs = [0.5, 0.5]
p["A"].append(transitions)
p["A"].append(probs)
print(p["A"])
print(p["A"][0])
print(p["A"][1])
```



Another is this:

```python
from collections import defaultdict #goes at top of code
bigrams = defaultdict(lambda: defaultdict(int)) #creates a 2D defaultdict, where the default values is an integer, 0.
bigrams["computer"]["science"] = 5 # example of setting value
print["hello"]["world"] # does not exist at query time, so these keys are created with a default value of 0.
```

