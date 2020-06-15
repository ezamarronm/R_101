install.packages("ggplot2")
require("ggplot2")
install.packages("plotly")
install.packages("RColorBrewer")
install.packages("knitr")

library("plotly")
library(stringr)

#Dispersion plot
plot(mtcars$mpg ~ mtcars$cyl, xlab = "cylinders", ylab = "miles per gallon", main= "miles per gallon & cylinders")
plot(mtcars$mpg ~ mtcars$hp, xlab = "horsepower", ylab = "miles per gallon", main= "miles per gallon & horsepower")
plot(orangeec$Unemployment ~ orangeec$Education.invest...GDP, xlab = "Education Investment", ylab = "Unemployment", main= "Graph x,y")
plot(orangeec$GDP.PC ~ orangeec$Creat.Ind...GDP, xlab = "Creative Industry contribution to the GDP", ylab = "GDP per Capita", main= "Graph x,y")

#Histograms
qplot(mtcars$hp,geom="histogram", xlab = "hp", main="cars as hp")
##Gplot
ggplot(mtcars, aes(x=hp) ) + geom_histogram(binwidth = 30) +
  labs(x = "horsepower" , y = "Frequency", title = "Horsepower frequency")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(legend.position = "none")
ggplot() + geom_histogram(data=mtcars, aes(x=hp), fill = "blue", color = "red", binwidth = 20) +
  labs(x = "horsepower" , y = "Frequency", title = "Horsepower frequency")+
  xlim(c(80,280)) + 
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(legend.position = "none")
 
#orangeec
ggplot() + geom_histogram(data=orangeec, aes(x=GDP.PC), fill = "blue", color = "red", binwidth = 2000) +
  labs(x = "GDP.PC" , y = "Frequency", title = "GDP.PC latam countries")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(legend.position = "none")

ggplot() + geom_histogram(data=orangeec, aes(x=Creat.Ind...GDP), fill = "blue", color = "red", binwidth = 1) +
  labs(x = "Creat.Ind...GDP" , y = "Frequency", title = "Contribution orange economy in latam countries")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(legend.position = "none")

ggplot() + geom_histogram(data=orangeec, aes(x=Internet.penetration...population), fill = "blue", color = "red", binwidth = 5) +
  labs(x = "Internet.penetration...population" , y = "Frequency", title = "Internet Penetration in latam countries")+
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(legend.position = "none")+
  scale_x_continuous(breaks = seq(30, 100, by=5))


##Boxplot
boxplot(mtcars$hp, ylab="horsepower", main="horsepower in cars")

ggplot(mtcars, aes(x=as.factor(cyl), y=hp, fill=cyl)) +
  geom_boxplot(alpha = 0.6 ) +
  labs(x = "cylinders", y = "horsepower", title = "horsepower vs cylinders") +
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(legend.position = "none")

mtcars$am  <- factor(mtcars$am, levels = c(1,0), labels = c("Manual", "Automatic"))

ggplot(mtcars, aes(x=as.factor(am), y=mpg, fill=am)) +
  geom_boxplot(alpha = 0.6 ) +
  labs(x = "box type", y = "miles per gallon", title = "miles per gallon vs box type") +
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(legend.position = "none")

##Boxplot orange economy
economy <- mean(orangeec$GDP.PC)

orangeec <- orangeec %>% 
  mutate(Strong_economy = ifelse(GDP.PC < economy, 'Lower GDP average', 'Upper GDP average'))

ggplot(orangeec, aes(x=Strong_economy, y = Creat.Ind...GDP, fill=Strong_economy)) +
  geom_boxplot(alpha = 0.4 ) +
  labs(x = "Country type", y = "orange economy addition to GDP", title = "") + 
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(legend.position = "none")
  
ggplot(orangeec, aes(x=Strong_economy, y = Internet.penetration...population, fill=Strong_economy)) +
  geom_boxplot(alpha = 0.4 ) +
  labs(x = "Country type", y = "Internet Penetration (%)", title = "") + 
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(legend.position = "none")

##Dispersion plot 3+ variables
ggplot(mtcars, aes(hp,mpg)) + 
  geom_point() + 
  labs(x = "horsepower", y = "miles per gallon", title = "") + 
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(legend.position = "none")

ggplot(mtcars, aes(wt,hp)) + 
  geom_point() + 
  labs(x = "weight", y = "horsepower", title = "") + 
  theme(panel.background = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
  theme(legend.position = "none")

ggplot(mtcars, aes(hp,qsec)) + 
  geom_point(aes(color = am, size = cyl)) + 
  labs(x = "horsepower", y = "time in 1/4 mile", title = "")

#orange economy  
ggplot(orangeec, aes(Internet.penetration...population,Creat.Ind...GDP)) + 
  geom_point(aes(color = factor(Strong_economy), size = GDP.Growth..)) + 
  labs(x = "Internet penetration", y = "Orange economy percentage to GDP", title = "")

my_graph <- ggplot(orangeec, aes(Internet.penetration...population, Creat.Ind...GDP, label = row.names(orangeec)))+
  geom_point() + 
  labs(x = "Internet penetration", 
       y = "Orange economy percentage to GDP", 
       title = "")
my_graph
p = ggplotly(my_graph)
p


##pairs
pairs(mtcars[,2:6])
pairs(mtcars)

#
newdata <- subset(mtcars, select = c(2,7:8,11,12))
pairs(newdata)

#
pairs(mtcars[, -c(1,3,4,5,6,9,10)])

#
efficients <- filter(mtcars, mpg >= 30)
efficients
pairs(efficients[,2:6])

merc <- mtcars %>%
  filter(str_detect(model, "Merc"))
merc

pairs(merc[,2:6])

##Correlations
cor(mtcars[,2:6])
cor(newdata)
cor(merc[,2:6])

##Orangeec pairs and cor
pairs(orangeec[,2:6])
pairs(orangeec[,5:10])

newdata <- subset(orangeec, select = c(5,6,10,11,12,13))
pairs(newdata)
 
cor(orangeec[,2:6],use = "complete.obs")
cor(orangeec[,5:10],use = "complete.obs")
cor(newdata,use="complete.obs")

summary(mtcars)

sd_mpg <- sd(mtcars$mpg)
mean_mpg <- mean(mtcars$mpg)

sd_mpg/mean_mpg

#Drop NA
std_dev <- sd(orangeec$Internet.penetration...population)
mean_ <- mean(orangeec$Internet.penetration...population)
var_coeff <- std_dev /mean_
var_coeff

mean_ <- mean(orangeec$Creat.Ind...GDP)

mean_ <- mean(orangeec$Creat.Ind...GDP, na.rm = TRUE)
std_dev <- sd(orangeec$Creat.Ind...GDP, na.rm = TRUE)
var_coeff <- std_dev /mean_
var_coeff

##Table generating
efficients <- mean(mtcars$mpg)
efficients

mtcars <- mtcars %>%
  mutate(more_efficients=ifelse(mpg<efficients, "under_average", "in_or_over_average"))
View(mtcars)

fastest <- mtcars[mtcars$qsec<16,]
fastest
mtcars <- mtcars %>%
  mutate(fastest_cars=ifelse(qsec < 16, "Less than 16s", "More than 16s"))

mtcars <- mtcars %>%
  mutate(weight_kg=(wt/2)*1000)

mtcars <- mtcars %>%
  mutate(weight=ifelse(weight_kg <= 1500, "Light","Heavy"))

##Table generating orangeec
orangeec <- orangeec %>%
  mutate(GDP_Growth = ifelse(GDP.Growth.. >= 2.5, ">2.5%", "<2.5%"))
orangeec <- orangeec %>%
  mutate(oranges_countries = ifelse(Creat.Ind...GDP >= 2.5, "More orange", "Less orange"))
View(orangeec)

#ranking
orangeec %>%
  arrange(desc(Creat.Ind...GDP))

orange_top <- orangeec %>%
  filter(Country %in% c("Mexico","Panama", "Argentina", "Colombia", "Brazil","Paraguay"))


orange_top %>%
  arrange(desc(Creat.Ind...GDP))

#Facet_wrap
mtcars %>%
 arrange(desc(weight_kg))

heaviest <- mtcars %>%
  filter(model %in% c("Lincoln Continental","Chrysler Imperial", "Cadillac Fleetwood","Merc 450SE"))

ggplot(heaviest, aes(x = hp, y = mpg)) +
  geom_point() + 
  facet_wrap(~model)

ggplot(mtcars, aes(x = cyl, y = mpg, size = weight)) +
  geom_point() + 
  facet_wrap(~am)
ggplot(mtcars, aes(x = cyl, y = mpg, size = weight_kg)) +
  geom_point() + 
  facet_wrap(~am)


#Facet_wrap orangeec
ggplot(orange_top, aes(x = Internet.penetration...population, y = Services...GDP, size = GDP.PC)) + 
  geom_point() + 
  facet_wrap(~Country)

# 
ggplot(orange_top, aes(x = Education.invest...GDP, y = Creat.Ind...GDP, size = Unemployment)) + 
  geom_point() + 
  facet_wrap(~Country)

myColors <- brewer.pal(9,"Reds")
ggplot(orange_top, aes(x = Internet.penetration...population, y = GDP.PC, fill = Creat.Ind...GDP)) + 
  geom_tile() + 
  facet_wrap(~Country) + 
  scale_fill_gradient(colors~myColors)
