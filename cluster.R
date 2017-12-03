#install.packages("klaR")
#install.packages("MASS")
library(MASS)
library(klaR)

pub <- read.csv(file="raw-data.csv", header=TRUE, sep=",")

#Limpar Dados
ld <- function(x){
  x[x=="" | is.na(x)] <- 0
  as.character(x)
  return (x)
}

#define as variaveis que serao utilizadas
gen = ld(pub$resp_gender)
rind = ld(pub$DP_INCOME)
rfam = ld(pub$DP_USHHI2_der)
raca = ld(pub$USRACE4_der)
regiao = ld(pub$HCAL_STDREGION_US)


#Cria Novo banco com as variaveis que serão utilizadas
pessoas <- matrix(c(gen,rind,rfam,raca,regiao), ncol=5)

#nome das variaveis para o plot
colnames(pessoas) <- c("genero","renda individual","renda familiar","raca","regiao")

#Executa o k-modes
kpres <- kmodes(pessoas, 4)

#adiciona um pouco de ruido nos dados para abrir espaco no plot
pessoasR <- jitter(pessoas, factor = 2)

#faz o plot
plot(pessoasR, col = kpres$cluster)
points(kpres$modes, col = 1:4, pch = 8)