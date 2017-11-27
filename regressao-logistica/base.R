

headlines <- read.csv(file="data/headline-responses.csv", header=TRUE, sep=",", na.strings=c(""))

# Colunas com mais de 90% de dados faltantes nas informações sobre pessoas, devem ser eliminadas agora
people <- read.csv(file="data/raw-data.csv", header=TRUE, sep=",", na.strings=c(""))
people <- people[, -which(colMeans(is.na(people)) > 0.1)]

# Una os dados de pessoas com os de respostas
dados <- merge(x = headlines, y = people, by = 'ID', all.x = TRUE)

# Contabilize todos as informações faltantes na lista "dados"
faltantes <- sapply(dados, function(x) sum(is.na(x)))
write.csv(file='regressao-logistica/dados-faltantes.csv', x=faltantes)

# Remova a coluna ID
dados$ID <- NULL

# Liste as colunas que têm dados imutáveis
names(dados[, sapply(dados, function(v) var(v, na.rm=TRUE)==0)])

# Remova colunas de dados imutáveis
dados <- dados[,sapply(dados, function(v) var(v, na.rm=TRUE)!=0)]

# Separe os dados que podem ser usados no treinamento e teste do modelo
dados_regressao = dados[which(dados$recalled_bool == 'True'),]

# Divida os dados em dois blocos: treinamento (60% das observações) e teste (40%)
set.seed(74564)
spl <- sample(1:2, size=nrow(dados_regressao), replace=TRUE, prob=c(0.6,0.4))
treinamento <- dados_regressao[spl==1,]
teste <- dados_regressao[spl==2,]

# Certifique-se de que todas as variáveis são fatores
# Mais informações sobre a importância disso aqui: https://stackoverflow.com/questions/18171246/error-in-contrasts-when-defining-a-linear-model-in-r
treinamento[] <- lapply(treinamento, factor)
teste[] <- lapply(teste, factor)

modelo <- glm(is_fake ~., family=binomial(link='logit'), data=treinamento)
