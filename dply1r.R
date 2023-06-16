#dplyr package: is a structure o f data manipulation.
# very useful in advance data analysis task.
#the dplyr package does not provide any new functionality to R.


install.packages("dyplr")
library(dplyr)



#nycflights13 package is only for dataset that we are going to study

install.packages("nycflights13")
library(nycflights13)

#find dimensions of flights,see flight ass a table in different tab.
# see first & last rows,check no of rows & columns,check structre
#display name of columns

dim(flights)
View(flights)
head(flights,20)   #first 20 records
tail(flights)  #by default last 6 records
nrow(flights)
ncol(flights)
str(flights)
help(flights)


#filter out all records based  on some criteria


new<-filter(flights,month==1,day==1)
filter(flights,month==12,day==13)





#pipe/chaining operator %>%

flights%>% filter(month==10,day==8)

#eg.log(sin(exp(cos(x))))
#x%>%cos()%>%exp()%>%sin()%>%log()


##arrange first by year then month then day in ascending order

arrange(flights,year,month,day)


  ##---
arrange(flights,desc(arr_delay))
    

####----
#select column by name

select(flights,year,month,day)

#select all columns between year & day(inclusive)
select(flights,year:day)

###select all columns except those year to day(inclusive)
select(flights,-(year:day))


##create/add  new columns----

newdf<-mutate(flights,
     gain=arr_delay-dep_delay,
     speed=distance/arr_time*60
     )
View(newdf)

##--only output ...not storing

mutate(flights,
        gain=arr_delay-dep_delay,
        speed=distance/arr_time*60
)


############---

sample_n(flights,10) #select any 10 random samples
sample_frac(flights,0.01) #1% records to be selected at random

###----
flights$dest  #destination column shows
unique(flights$dest)
length(unique(flights$dest))

###-----
dfdept<-data.frame(name=c('Asha','Ashwini','priya','sona','Mona','Lata'),
                  dept=c('trainer','admin','trainer','trainer','Marketing','admin'),
                  salary=c(45000,82000,40000,40000,50000,80000)
                  )
dfdept
depgrp<-group_by(dfdept,dept)

summarise(depgrp,
          sal=n_distinct(salary),
          depgrp=n()
          )

# `year` represents the integer 1
select(flights, year)
select(flights, 3)

## ----------------
filter(
  summarise(
    select(
      group_by(flights, year, month, day),
      arr_delay, dep_delay
    ),
    arr = mean(arr_delay, na.rm = TRUE),
    dep = mean(dep_delay, na.rm = TRUE)
  ),
  arr > 30 | dep > 30
)

#chaining

flights %>%
  group_by(year,month,day) %>% 
  select(arr_delay,dep_delay) %>%
  summarise(arr=mean(arr_delay,na.rm=T),
            dep=mean(dep_delay,na.rm=T)) %>%
  filter(arr>30 | dep>30)
