source("C:\\rcode\\linintpol.R")##change to your working directory

all_names <- read.csv("baby-names.csv")

population <- read.csv("usapop.csv")

population <- linintpol(population) ##linearly interpolating the missing values

population <- data.frame(population) ##converting it to a data.frame object

my_name <- subset(all_names, name == "Garrett" & sex == "boy") ##put your name here

prop<-my_name$prop

date1<-my_name$year

len <- nrow(date1)
> for(i in 1:len)
+ { 
+    poplen <- nrow(population)
+     for(j in 1:poplen){
+    if(as.numeric(population[j,1]) == as.numeric(date1[i])){
+    x <- c( x ,as.numeric(population[j,2])*as.numeric(prop[i]))
+    }
+ }
+ }

cat("Total number of people who had the name since 1800 AD:",(do.call(sum,x)), "\n")
