#install.packages("rcompanion")
#install.packages(c("Rcpp", "readr"))
library(rcompanion)
library(readr)
setwd("C:/Users/anact/Documents/MQA/fake-news-analysis")

pub <- read.csv(file="data/remembered-headlines.csv", header=TRUE, sep=",")
#pub <- read_csv("data/headlines-and-raw-data.csv.txt")
print(pub)
enganados <- pub[(pub$classifying == 1 | pub$classifying == 3),]

enganados$classifying[enganados$classifying == 2] <- 0
enganados$classifying[enganados$classifying == 4] <- 1

print(enganados)
f = factor(enganados$resp_gender)
dummy1 = model.matrix(~f+0)

summary(dummy1)
print(f)

f2 = factor(enganados$USRACE4_der)
dummy2 = model.matrix(~f2+0)

f3 = factor(enganados$HCAL_STDREGION_US)
dummy3 = model.matrix(~f3+0)

f4 = factor(enganados$DP_INCOME)
dummy4 = model.matrix(~f4+0)

f5 = factor(enganados$DP_USHHI2_der)
dummy5 = model.matrix(~f5+0)

f6 = factor(enganados$USHHI2)
dummy6 = model.matrix(~f6+0)

f7 = factor(enganados$DWD1)
dummy7 = model.matrix(~f7)

f8 = factor(enganados$DWD6)
dummy8 = model.matrix(~f8)

f9 = factor(enganados$GRID_DWD11_1_DWD11)
dummy9 = model.matrix(~f9)

#print(dummy)

#modelo = glm(enganados$classifying~dummy1+dummy2+dummy3+dummy4+dummy5+dummy6+dummy7+dummy8+dummy9,family = "binomial"(link = "logit"))
modelo = glm(enganados$classifying~dummy1+dummy2+dummy3+dummy4+dummy5+dummy6,family = "binomial"(link = "logit"))

#exp(confint(modelo))

coe <- nagelkerke(modelo)

print(coe)

