library(rms)

headlines <- read.csv(file="data/headline-responses.csv", header=TRUE, sep=",", na.strings=c(""))

# Colunas com mais de 10% de dados faltantes nas informações sobre pessoas, devem ser eliminadas agora
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
dados_regressao <- dados_regressao[,c("headline", "accuracy_bool", "DP_INCOME", "DP_USHHI2_der", "USRACE4_der", "HCAL_REGION1_Label_abbreviation_US", "resp_gender")]

# Construa o modelo de regressão logística
# Registre o tempo necessário para fazê-lo
tempo_inicio <- Sys.time()
# modelo <- glm(accuracy_bool ~., family=binomial(link='logit'), data=treinamento)
modelo <- lrm(accuracy_bool ~., x=TRUE, y=TRUE, data = dados_regressao)
tempo_fim <- Sys.time()

print(tempo_fim - tempo_inicio)

print(modelo)
