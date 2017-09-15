# Title: Plotting in R #

df <- read.csv("Metadata.csv")
str (df)

#start plotting
library("ggplot2")    #open a library of functions

df$Reactor.cycle <- factor(df$Reactor.cycle)

str(df$Reactor.cycle)

#Make first plot
ggplot(data = df, aes(x = Timepoint ,y = temp, fill = Reactor.cycle)) +  #no quotation marks in the aes-function!!
geom_point(shape = 21, size = 4) #how you want to see your data

#♦Store ggplot in an object
p1 <- ggplot(data = df, aes(x = Timepoint ,y = temp, fill = Reactor.phase))
p1 <- p1 + geom_point(shape = 21, size = 4, alpha= .5)  
p2 <- p1 +  theme_bw()  +   geom_line()             # theme_bw makes background white   +  geom_line draws a line between the datapoints
p2

# Kets facet this
p3 <- p2 + facet_grid(~Reactor.cycle)
p3                                                 #actually plots the plot


# How can you see what's inside Reacto.cycel?
df$ Reactor.cycle
df$Reactor.phase
levels (df$Reactor.phase)
p4 <- p2 + facet_grid(Reactor.phase~Reactor.cycle)     # Reactor.phase~Reactor.cycle is a formula object
p4




# Alternative way to change to colour of the dots
p4 + geom_line(aes(color = Reactor.phase))

#Challenge time
### Right side: Conductivity
### Middle: Diversity D0
### Left: Cell density

df$Cell.density..cells.mL.
p1 <- ggplot(data = df, aes(x = Timepoint,y = Cell.density..cells.mL., fill = Cell.density..cells.mL.)) +
  geom_point(shape = 21, size = 4)
p1

p2 <- p1 + scale_y_log10()  # change y-axis to log-scale
p2



colnames(df)

view(df)
?ggplot2
