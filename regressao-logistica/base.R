headlines <- read.csv(file="data/headline-responses.csv", header=TRUE, sep=",", na.strings=c(""))

# Colunas com mais de 90% de dados faltantes nas informações sobre pessoas, devem ser eliminadas agora
people <- read.csv(file="data/raw-data.csv", header=TRUE, sep=",", na.strings=c(""))
people <- people[, -which(colMeans(is.na(people)) > 0.1)]

# Una os dados de pessoas com os de respostas
dados <- merge(x = headlines, y = people, by = 'ID', all.x = TRUE)

# Contabilize todos as informações faltantes na lista "dados"
faltantes <- sapply(dados, function(x) sum(is.na(x)))
write.csv(file='regressao-logistica/dados-faltantes.csv', x=faltantes)

# Separe os dados que podem ser usados no treinamento e teste do modelo
dados_regressao = dados[which(dados$recalled_bool == 'True'),]

# Separe apenas os dados estatisticamente significativos, segundo análise G-test discutida no relatório que acompanha este código
dados_regressao <- dados_regressao[,c("headline", "accuracy_bool", "DP_INCOME", "DP_USHHI2_der", "USRACE4_der", "USRETH3_der", "HCAL_REGION1_Label_abbreviation_US", "HCAL_STDREGION_US", "USHHI2", "resp_gender")]

# Divida os dados em dois blocos: treinamento (60% das observações) e teste (40%)
set.seed(74564)
spl <- sample(1:2, size=nrow(dados_regressao), replace=TRUE, prob=c(0.6,0.4))
treinamento <- dados_regressao[spl==1,]
teste <- dados_regressao[spl==2,]

# Certifique-se de que todas as variáveis são fatores
# Mais informações sobre a importância disso aqui: https://stackoverflow.com/questions/18171246/error-in-contrasts-when-defining-a-linear-model-in-r
treinamento[] <- lapply(treinamento, factor)
teste[] <- lapply(teste, factor)

# Construa o modelo de regressão logística
# Registre o tempo necessário para fazê-lo
tempo_inicio <- Sys.time()
modelo <- glm(accuracy_bool ~., family=binomial(link='logit'), data=treinamento)
tempo_fim <- Sys.time()

print(tempo_fim - tempo_inicio)
