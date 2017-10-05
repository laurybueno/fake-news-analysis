# Compute os dados totais de falsos e verdadeiros positivos e negativos para criar a Matriz de Confusão
# Adicionalmente, reúna dados de interesse sobre esses grupos

headlines <- read.csv(file="data/headline-responses.csv", header=TRUE, sep=",")
people <- read.csv(file="data/raw-data.csv", header=TRUE, sep=",")

dados <- merge(x = headlines, y = people, by = 'ID', all.x = TRUE)

# Separe os dados da matriz de confusão
falsos_positivos = dados[which(dados$is_fake == 'True' & dados$accuracy_bool == 'True'),]

falsos_negativos = dados[which(dados$is_fake == 'False' & dados$accuracy_bool == 'False'),]

verdadeiros_positivos = dados[which(dados$is_fake == 'False' & dados$accuracy_bool == 'True'),]

verdadeiros_negativos = dados[which(dados$is_fake == 'True' & dados$accuracy_bool == 'False'),]

# Descubra a principal fonte de notícias de cada grupo
fonte_principal <- function(segmento) {
    cnn = 0
    fox = 0
    facebook = 0
    new_york_times = 0
    google_news = 0
    yahoo_news = 0

    f <- function(pessoa) {
        temp <<- pessoa
        if(pessoa['GRID_DWD11_8_DWD11'] == 1) cnn <<- cnn + 1
        if(pessoa['GRID_DWD11_15_DWD11'] == 1) fox <<- fox + 1
        if(pessoa['GRID_DWD11_4_DWD11'] == 1) facebook <<- facebook + 1
        if(pessoa['GRID_DWD11_3_DWD11'] == 1) new_york_times <<- new_york_times + 1
        if(pessoa['GRID_DWD11_12_DWD11'] == 1) google_news <<- google_news + 1
        if(pessoa['GRID_DWD11_13_DWD11'] == 1) yahoo_news <<- yahoo_news + 1
    }

    apply(segmento, 1, f)

    print(paste("CNN: ", cnn))
    print(paste("Fox: ", fox))
    print(paste("Facebook: ", facebook))
    print(paste("New York Times: ", new_york_times))
    print(paste("Google News: ", google_news))
    print(paste("Yahoo News: ", yahoo_news))
}

print(paste("Falsos positivos: ", nrow(falsos_positivos)))
fonte_principal(falsos_positivos)
print("=================")

print(paste("Falsos negativos: ", nrow(falsos_negativos)))
fonte_principal(falsos_negativos)
print("=================")

print(paste("Verdadeiros positivos: ", nrow(verdadeiros_positivos)))
fonte_principal(verdadeiros_positivos)
print("=================")

print(paste("Verdadeiros negativos: ", nrow(verdadeiros_negativos)))
fonte_principal(verdadeiros_negativos)
print("=================")
