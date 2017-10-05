# As manchetes foram apresentadas em ordens aleatórias para os respondentes.
# Este script tenta descobrir se a frequência de notícias consideradas verdadeiras ou falsas
# tem alguma correlação com a ordem de apresentação.

dados <- read.csv(file="data/headline-responses.csv", header=TRUE, sep=",")

fp = vector()
fn = vector()
vp = vector()
vn = vector()

# Itera as 6 posições possíveis de manchetes
for(i in 1:6) {
    print(paste("Manchetes na posição", i))

    posicao_atual = dados[dados$order == i, ]

    # Quantas notícias falsas foram colocadas nesta posição?
    falsas = posicao_atual[posicao_atual$is_fake == 'True', ]
    print(paste("Notícias falsas:", nrow(falsas)))

    verdadeiras = nrow(posicao_atual[posicao_atual$is_fake == 'False', ])
    print(paste("Notícias verdadeiras:", verdadeiras))

    # De quantas notícias as pessoas não se lembraram?
    não_lembradas = posicao_atual[posicao_atual$recalled_bool == 'False', ]
    print(paste("Notícias não lembradas:", nrow(não_lembradas)))

    # De quantas notícias as pessoas se lembram nessa posição?
    lembradas = posicao_atual[posicao_atual$recalled_bool == 'True', ]
    print(paste("Notícias lembradas:", nrow(lembradas)))

    # Dessas, faça uma matriz de falsos positivos, verdadeiros positicos, falsos negativos e verdadeiros negativos
    falsos_positivos = lembradas[which(lembradas$is_fake == 'True' & lembradas$accuracy_bool == 'True'),]
    print(paste("Consideradas verdadeiras, mas são falsas:", nrow(falsos_positivos)))
    fp = c(fp, nrow(falsos_positivos))

    falsos_negativos = lembradas[which(lembradas$is_fake == 'False' & lembradas$accuracy_bool == 'False'),]
    print(paste("Consideradas falsas, mas são verdadeiras:", nrow(falsos_negativos)))
    fn = c(fn, nrow(falsos_negativos))

    verdadeiros_positivos = lembradas[which(lembradas$is_fake == 'False' & lembradas$accuracy_bool == 'True'),]
    print(paste("Consideradas verdadeiras, e são verdadeiras:", nrow(verdadeiros_positivos)))
    vp = c(vp, nrow(verdadeiros_positivos))

    verdadeiros_negativos = lembradas[which(lembradas$is_fake == 'True' & lembradas$accuracy_bool == 'False'),]
    print(paste("Consideradas falsas, e são falsas:", nrow(verdadeiros_negativos)))
    vn = c(vn, nrow(verdadeiros_negativos))

    print("======================")
}

# Produza gráficos da matriz de confusão
plot(fn, type="b", ylim=c(50,400), main="Falsos negativos pela ordem em que foram declarados", xlab="Momento em que a manchete é apresentada", ylab="Quantidade de declarações")

plot(fp, type="b", ylim=c(50,400), main="Falsos positivos pela ordem em que foram declarados", xlab="Momento em que a manchete é apresentada", ylab="Quantidade de declarações")

plot(vn, type="b", ylim=c(50,400), main="Verdadeiros negativos pela ordem em que foram declarados", xlab="Momento em que a manchete é apresentada", ylab="Quantidade de declarações")

plot(vp, type="b", ylim=c(50,400), main="Verdadeiros positivos pela ordem em que foram declarados", xlab="Momento em que a manchete é apresentada", ylab="Quantidade de declarações")


# Crie um arquivo CSV com os resultados encontrados
df <- data.frame(vp, vn, fp, fn)
names(df) <- c('verdadeiros positivos', 'verdadeiros negativos', 'falsos positivos',  'falsos negativos')
write.csv(file='matriz-confusao-ordenados.csv', x=df)