# Lab 2: Basic R Plot with ggplot2 (10 points)

## Preliminaries

1. If using OS X and you installed R from Homebrew, uninstall it and download the package version.

   ```bash
   brew uninstall R
   ```

2. Once inside of R (run `R` from the terminal), install [devtools](https://www.r-project.org/nosvn/pandoc/devtools.html) with

   ```R
   install.packages("devtools")
   ```

3. Install ggplot2 and svglite

   ```R
   install.packages("ggplot2")
   install.packages("svglite")
   ```

   ## Background

   This lab will serve as an introduction to R and plotting with the ggplot2 library.  While the textbook uses the R's built-in `plot()` function, we will generally use ggplot2, as it is much more powerful for scientific plots.  For this lab, we'll start with the book's provided code for simulating coin flips and modify the program to run multiple trials.  We'll then plot the results with ggplot2.

   

   To start R, open a terminal window and type `R`.  To quit, type `q()` and press `[ENTER]`.

   

   We'll start with the file [RunningProportion.R](lab2/RunningProportion.R) from Kruschke (2015).  The logic portion of the program is as follows:

   ```R
   N = 500 
   # Specify the total number of flips, denoted N.
   pHeads = 0.5 
   # Specify underlying probability of heads.
   
   # Flip a coin N times and compute the running proportion of heads at each flip.
   # Generate a random sample of N flips (heads=1, tails=0):
   
   flipSequence = sample( x=c(0,1), prob=c(1-pHeads,pHeads), size=N, replace=TRUE )
   # Compute the running proportion of heads:
   r = cumsum( flipSequence )
   # Cumulative sum: Number of heads at each step.
   n = 1:N
   # Number of flips at each step.
   runProp = r / n 
   # Component by component division.
   ```

   You can view it in your favorite text editor or with `less`.

   Inside of R, you can retrieve documentation of functions by using `?` at the prompt.  For example:

   ```R
   ?sample
   ```

   The [sample function](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/sample) in R samples from a probaiblity distribution. 

   ```R
   sample(x, size, replace = FALSE, prob = NULL)
   ```

   It has two required arguments and two optional ones.  The `x` attribute must be either a vector or a positive integer.  Here, it is a vector created with the built-in `c()` function, with the elements 0 and 1.  The `prob` argument also takes a vector and assigns a probability to each of the elements in `x`.  Since this is a Bernoulli trial, this is an easy calculation.

   - Try printing out a smal sample of ten trials.

   ```R
   pHeads = 0.5
   flipSequence <- sample(x = c(0,1), size = 10, replace = TRUE, prob = c(1-pHeads, pHeads))
   print(flipSequence)
   ```

   We can run the program directly from the terminal by using the Rscript command.  This is crucial for replicability in science.

   ```bash
   Rscript RunningProportion.R
   ```

   To save an image as a PDF, we can call functions before we call `plot()`.  For example:

   ```R
   svg("plot.svg")
   pdf("plot.pdf")
   ```

   In general, we want to use vector graphics (SVG or PDF), because they do not suffer quality loss when zoomed in on.  But we're using ggplot.  So after you've observed this, delete the plotting portion of the code.

   Our data, the outcome of the trials, are stored in a [Data Frame](https://www.w3schools.com/r/r_data_frames.asp) object, which consist of rows and columns.

   ## Simple ggplot2 plot

   The current code runs one set of 500 trials and shows the running average of trials over time.  As we run more trials, we should approach the true sampling distribution of 0.5.  

   To get the data in a more manageable form, we're going to add it to a [Data Frame](https://www.w3schools.com/r/r_data_frames.asp) object consisting of rows and columns.  

   ```R
   df <- data.frame(n, runProp)
   ```

   With this data frame, we can now easily plot with ggplot2.

   ```oR
   library(ggplot2)
   # This should go at the top of your code.
   plot <- ggplot(data = df, aes(n, runProp)) + geom_point()
   
   ```

   This tells is that we're gong to plot the data in `df`.  The `aes` (aesthetics) parameter tells us what the x- and y-axes are in this case.  As we'll see, there are many more options.

   We then add the `geom_point` function (which could also take its own dataframe obejct).  The key here is that ggplot follows a Grammar of Graphics.  By "adding" functions like `geom_point()` to the original plot, we progressively build the plot.

   

   ## Assignment: Running multiple trials.

   We're going to run multiple sets of 500 trials instead of one set and plot them on the same plot.  We can do this with a [for loop](https://www.w3schools.com/r/r_for_loop.asp).   To do this, we can start with an empty data frame and add more and more data to it.  The following will create an empty data frame with two columns, one for integers and the other for doubles.

   ```R
   df <- data.frame(Integers=integer(),
                    Doubles=double())
   ```

   We can use the `rbind()` function to append new runs to our data frame.

   Once we've populated the data frame with the data from our multiple trials, we can plot the result.  You should end up with something that looks vaguely, but not exactly, like this.  This image was created with two runs of fifty trials with $p(\text{heads})=0.9$, with an [LOESS curve](https://plotly.com/ggplot2/layers/geoms/geom_smooth/) added and 95% confidence intervals (a frequentist metric which we have not discussed and which is frequently misinterpreted) in the gray region. 

   You can save plots with `ggsave()`.  For example:

   ```R
   ggsave("myplot.svg")
   ```

   

![50 trials image](lab2/images/50trials.svg)

You can run R code directly with the Rscript command or load it into the interactive environment with `source()`.  You can set and get the current working directory in R with `setwd()` and `getwd()`.

Write a **short** report (a few sentences describing anything interesting) with the following:

1. For three different probabilities of heads, create plots for the following:

   1. Start with the number of runs at 2 and end with the number of runs at 500.  Also try at least two other numbers of runs.
   2. Add LOESS curves (`geom_point()`) to all of your plots.

   What do you notice (visually) about the stability and variance of the outcomes as you vary the number of trials?  Is this what you expected?  Why?

2. Turn in your short report as a PDF file with your plots included **in the report**, not as separate files.  (If you submit the plots as separate files, points will be deducted.)