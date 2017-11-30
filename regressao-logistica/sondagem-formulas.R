library(glmulti)

# Sobrescreva glmulti com a versão modificada da biblioteca
# Consulte a linha 951 do arquivo externo para ler o patch
source('regressao-logistica/vendor/glmulti.R')

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
dados_regressao <- dados[which(dados$recalled_bool == 'True'),]

# Separe apenas os dados estatisticamente significativos, segundo análise G-test discutida no relatório que acompanha este código
dados_regressao <- dados_regressao[,c("headline", "accuracy_bool", "DP_INCOME", "DP_GENAGE", "DP_EDUCATION_BAN", "DP_HISPANIC_BAN", "DP_USHHI2_der", "EMP01_der", "USRACE4_der", "USRETH3_der", "HCAL_REGION1_US", "HCAL_STDREGION_US", "USHHI2", "resp_gender", "REGION4", "US09KID", "DWD1", "DWD5")]

# Tente construir modelos de regressão logística
# Registre o tempo necessário para fazê-lo
tempo_inicio <- Sys.time()
glmulti.lm.out <-
    glmulti(accuracy_bool ~ headline + DP_GENAGE + DP_EDUCATION_BAN + DP_HISPANIC_BAN + DP_USHHI2_der + EMP01_der + USRACE4_der + USRETH3_der + HCAL_REGION1_US + HCAL_STDREGION_US + USHHI2 + resp_gender + REGION4 + US09KID + DWD1 + DWD5, data = dados_regressao,
            level = 1,               # No interaction considered
            method = "h",            # Exhaustive approach
            crit = "aic",            # AIC as criteria
            confsetsize = 5,         # Keep 5 best models
            plotty = FALSE, report = FALSE,  # No plot or interim reports
            fitfunction = "lm")      # lm function
tempo_fim <- Sys.time()

print(tempo_fim - tempo_inicio)

print(glmulti.lm.out@formulas)
