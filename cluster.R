#install.packages("klaR")
#install.MASS("MASS")
library(MASS)
library(klaR)

pub <- read.csv(file="raw-data.csv", header=TRUE, sep=",")

#Limpar Dados
ld <- function(x){
  x[x=="" | is.na(x)] <- 0
  as.character(x)
  return (x)
}

gen = ld(pub$resp_gender)
rind = ld(pub$DP_INCOME)
rfam = ld(pub$DP_USHHI2_der)
raca = ld(pub$USRACE4_der)
regiao = ld(pub$HCAL_STDREGION_US)


#Cria Novo banco com as variaveis que serão utilizadas
pessoas <- data.frame(gen,rind,rfam,raca,regiao)

#Executa o k-modes
kpres <- kmodes(pessoas, 6)

#guarda o grupo em que a pessoa foi colocada
pessoas$cluster <- kpres$cluster

print(kpres)