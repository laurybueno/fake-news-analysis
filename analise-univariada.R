dados <- read.csv(file="headline-responses.csv", header=TRUE, sep=",")
pub <- read.csv(file="raw-data.csv", header=TRUE, sep=",")
isString = FALSE
moda <- function(x) {
  t <- table(x)
  return(as.numeric(names(t)[t == max(t)]))
  
}

quantitava <- function(nome, x){
  print(nome)
  hist(x,main="Idade dos entrevistados",xlab = "idade", ylab = "quantidade")
  print(paste("Media: ",mean(x)))
  print(paste("Mediana: ",median(x)))
  print(paste("Moda: ",moda(x)))
  print(paste("Desvio Padrao: ",sd(x)))
  print(paste("Max: ",max(x)))
  print(paste("Min: ",min(x)))
  t = length(x)
  y = x[x > 19 & x < 71]
  print(paste("Desvio Padrao: ",sd(y)))
  print(length(y)*100/t)
  print("")
}

qualitativa <- function(nome,y,...){
  print(nome)
  if(isString != TRUE){
    y[y=="" | is.na(y)] <- 0
  }else{
    y = y[y != ""]
  }
  x = y
  
  #numero de observações
  t <- length(x)
  print(paste("Total: ",t))
  
  #tipos de resposta
  labls <- list(...)
  n = length(labls)
  for(i in 1:n){
    #frequencia da resposta
    f = length(x[x == labls[i]])
    
    #porcentagem em relação ao total
    p = round(f/t,2)*100
    
    print(paste(labls[i],": ",p,"% - ",f))
  }
  print("")
}

quantitava('Idade',pub$resp_age)
isString = TRUE
qualitativa('Recalled',dados$recalled,'no', 'unsure', 'yes')
qualitativa('Accuracy',dados$accuracy,'very accurate', 'somewhat accurate', 'not very accurate','not at all accurate')
qualitativa('Accuracy Bool',dados$accuracy_bool,'True', 'False')
isString = FALSE
qualitativa('Genero',pub$resp_gender,'1', '2')
qualitativa('Partido',pub$DWD1,'0','1', '2', '3', '4')
qualitativa('Candidato',pub$DWD6,'0','1', '2', '3', '4','5')
qualitativa('BuzzFeed',pub$GRID_DWD11_1_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Huffington Post',pub$GRID_DWD11_2_DWD11,'0','1', '2', '3', '4','5')
qualitativa('New York Times',pub$GRID_DWD11_3_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Facebook',pub$GRID_DWD11_4_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Twitter',pub$GRID_DWD11_5_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Snapchat',pub$GRID_DWD11_6_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Vice',pub$GRID_DWD11_7_DWD11,'0','1', '2', '3', '4','5')
qualitativa('CNN',pub$GRID_DWD11_8_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Vox',pub$GRID_DWD11_9_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Business Insider',pub$GRID_DWD11_10_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Washington Post',pub$GRID_DWD11_11_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Google News',pub$GRID_DWD11_12_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Yahoo News',pub$GRID_DWD11_13_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Drudge Report',pub$GRID_DWD11_14_DWD11,'0','1', '2', '3', '4','5')
qualitativa('Fox News',pub$GRID_DWD11_15_DWD11,'0','1', '2', '3', '4','5')