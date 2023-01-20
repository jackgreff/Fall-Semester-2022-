library(ggplot2)
N = 100 # Specify the total number of flips, denoted N.
n = 1:N                   # Number of flips at each step.
pHeads = 0.9 # Specify underlying probability of heads.

trial1 = 1:N
trial2 = 1:N #creates a vector of N length, values replaced in for loop
trial3 = 1:N


number_h = 0 #number of heads
for (a in 1:N){
	flipSequence = sample( x=c(0,1), prob=c(1-pHeads,pHeads), size=1, replace=TRUE )#one trial at a time
	if(flipSequence[1] == 1){number_h = number_h+1}#updates number of heads
	trial1 <- replace(trial1,a,number_h /a)#adds propability
}

number_h = 0
for (a in 1:N){
	flipSequence = sample( x=c(0,1), prob=c(1-pHeads,pHeads), size=1, replace=TRUE )#one trial at a time
	if(flipSequence[1] == 1){number_h = number_h+1}#updates number of heads
	trial2 <- replace(trial2,a,number_h /a)#adds propability
}

number_h = 0
for (a in 1:N){
	flipSequence = sample( x=c(0,1), prob=c(1-pHeads,pHeads), size=1, replace=TRUE )#one trial at a time
	if(flipSequence[1] == 1){number_h = number_h+1}#updates number of heads
	trial3 <- replace(trial3,a,number_h /a)#adds propability
}

RunProp = c(trial1, trial2, trial3) #vector of all trials to put in plot

df <- data.frame(n, RunProp)
df2 <- data.frame(n, trial1, trial2, trial3)
print(tail(df2))


plot <- ggplot(data = df, aes(n, RunProp)) + geom_point()+ geom_smooth(method=loess)
ggsave("myplot1.svg")


