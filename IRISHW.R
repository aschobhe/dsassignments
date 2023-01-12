iris
iris <-datasets::iris

###top 10 rows &last 10rows
head(iris,10)
tail(iris,10)
names(iris)  #names of all column

iris[,c(1,2)]   #all rows & first two column
df<-iris[,-5]   #excludes column 5
df

summary(iris[,1]) #summary statistics for column 1

iris$Sepal.Length #display column values

summary(iris$Sepal.Length)  #summary of wind column
 summary(iris)
 
 
 ###visualization####
 
 
plot(iris$Sepal.Length) 
plot(iris$Sepal.Width) 
plot(iris$Sepal.Length,iris$Sepal.Width,type = "p") 
plot(iris)
help(plot)

#points & lines

plot(iris$Sepal.Length,type='p') #p;points,l:lines,b:both
plot(iris$Sepal.Length,type='l')
plot(iris$Sepal.Length,type='b')


plot(iris$Sepal.Length,
    xlab='Ozone Concentration',
    ylab='No of Instances',
    main= 'Ozone level in NY city',
    col='blue',
    type='l')

boxplot(iris$Sepal.Length) # boxplot of sepal Length.
boxplot(iris[, 1:4]) # boxplots of four columns of iris.






