dados <- read.csv(file="data/headline-responses.csv", header=TRUE, sep=",")

moda <- function(x) {
  t <- table(x)
  return(as.numeric(names(t)[t == max(t)]))
  
}

quantitava <- function(nome, x){
  print(nome)
  print(paste("Media: ",mean(dados$Weightvar)))
  print(paste("Mediana: ",median(dados$Weightvar)))
  print(paste("Moda: ",moda(dados$Weightvar)))
  print(paste("Desvio Padrao: ",sd(dados$Weightvar)))
  print("")
}

qualitativa <- function(nome,x,n,...){
  print(nome)
  
  #numero de observações
  t <- length(x)
  
  #tipos de resposta
  labls <- list(...)
  
  for(i in 1:n){
    #frequencia da resposta
    f = length(x[x == labls[i]])
    
    #porcentagem em relação ao total
    p = round(f/t,2)*100
    
    print(paste(labls[i],": ",p,"%"))
  }
  print("")
}

quantitava('--Weightvar--',dados$Weightvar)
qualitativa('--Recalled--',dados$recalled,3,'no', 'unsure', 'yes')