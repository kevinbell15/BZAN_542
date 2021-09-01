
#9/1/2021 lab 1 

library(dplyr)

str(iris)
x=iris$Petal.Length
y=iris$Petal.Width
c=iris$Species
table(c)

plot(x, y, pch=as.numeric(c), xlab='Petal Length', ylab='Petal Width', main ='Iris')
legend('topleft', pch=c(1,2,3), levels(c))
xlimits=c(2.5, 5)
ylimits=c(0.75, 1.75)
for (xlimit in xlimits) {
  abline(v=xlimit)
}
for (ylimit in ylimits) {
  abline(h=ylimit)
}


x1=character()
x1[x<=2.5]='low'
x1[2.5<x & x<=5]='medium'
x1[x>5]='high'
## these lines are equivalent of:
# x1=cut(x, c(-Inf, 2.5, 5, Inf), labels=c('low','medium','high'))

y1=character()
y1[y<=0.75]='low'
y1[0.75<y & y<=1.75]='medium'
y1[y>1.75]='high'
## these lines are equivalent of:
# y1=cut(y, c(-Inf, 0.75, 1.75, Inf), labels=c('low','medium','high'))

x2=cbind(x1=='low',x1=='medium',x1=='high')
y2=cbind(y1=='low',y1=='medium',y1=='high')
labels=c('low','medium','high')
colnames(x2)=colnames(y2)=labels
class(x2)='numeric'
class(y2)='numeric'
# these lines are equivalent of:
# x2=model.matrix(~0+x1)
# y2=model.matrix(~0+y1)

###### quiz q1 #########

#method 1
SUB <- subset(iris,Petal.Length>2.5 & Petal.Length<5 & Petal.Width<1.75)

nrow(SUB)


#method 2
SUB <- filter(iris,Petal.Length>2.5 & Petal.Length<5 & Petal.Width<1.75)
nrow(SUB)


#method 3 
SUB <- iris %>% 
  filter(Petal.Length>2.5) %>%
  filter(Petal.Length<5) %>%
  filter(Petal.Width>.75) %>%
  filter(Petal.Width<1.75)

nrow(SUB)



