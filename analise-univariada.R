dados <- read.csv(file="headline-responses.csv", header=TRUE, sep=",")
pub <- read.csv(file="raw-data.csv", header=TRUE, sep=",")

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

qualitativa <- function(nome,y,n,...){
  print(nome)
  x = y[y != ""]
  print(y)
  #numero de observações
  t <- length(x)
  print(paste("Total: ",t))
  
  #tipos de resposta
  labls <- list(...)
  
  for(i in 1:n){
    #frequencia da resposta
    f = length(x[x == labls[i]])
    
    #porcentagem em relação ao total
    p = round(f/t,2)*100
    
    print(paste(labls[i],": ",p,"% - ",f))
  }
  print("")
}

#quantitava('--Weightvar--',dados$Weightvar)
#qualitativa('Recalled',dados$recalled,3,'no', 'unsure', 'yes')
#qualitativa('Accuracy',dados$accuracy,4,'very accurate', 'somewhat accurate', 'not very accurate','not at all accurate')
#qualitativa('Accuracy Bool',dados$accuracy_bool,2,'True', 'False')
#qualitativa('Idade/genero',pub$DP_GENAGE,6,'1', '2', '3', '4', '5', '6')
qualitativa('Partido',pub$DWD4,3,'1', '2', '3')