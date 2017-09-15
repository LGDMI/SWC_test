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
df <- read.csv("Metadata.csv",nrows=77)
pp1 <- ggplot(data=df,aes(x= Timepoint,y=Conductivity,fill=Reactor.phase)) 

pp1 <- pp1 + geom_point(shape=21,size=4,alpha = 0.5) + theme_bw() +  geom_line(aes(color=Reactor.cycle)) 
pp1
# Facet it 
pp3 <- pp1 + facet_grid(~Reactor.cycle)
pp3
# how do i know whats in reactor phase 
unique(df$Reactor.phase) 
#plot alles in fucntie van reactor phase 
pp4 <- pp1 + facet_grid(Reactor.phase~Reactor.cycle)
pp4

### Middle: Diversity D0
p5<-ggplot(data=df, aes(x=Timepoint , y=Diversity...D0, fill=Reactor.phase ))+
  geom_point(shape=21, size=5)
p5

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



#### and NOW the statistics!!

#read in data
df <- read.csv("Metadata.csv")
str (df)

# load libraties
library(ggplot2)
library(dplyr)   #gives an error, becuz ther might be new functions loaded that were already loaded under the same names.
                  # the last loaded library will overload them
#what if you DO want to use the original functions?

mean(df[df$Reactor.phase == "Control", "ph"])   # ph = column   #this selects any rows of ph where reactof.phase equals 'control'

levels(df$Reactor.phase)   # => shows you that the factor contains 4 levels! => we're gonna efficiently calculate the mean for each level

###Select ###
physicochemical <- dplyr :: select(df,ph,temp,Conductivity)
head(physicochemical)

#piping => use Ctrl+ Shift+ m
physicochemical <- df %>% select(ph,temp,Conductivity)

physicochemical.control <- df %>% 
  filter(Reactor.phase == "Control") %>%  
  select(ph,temp,Conductivity)


## Challenge
# select only the diversity parameters for reacto.phase startup

Diversity <- df %>%    
  filter(Reactor.phase == "Startup") %>%  
  select(Diversity...D0, Diversity...D1, Diversity...D2)
Diversity

