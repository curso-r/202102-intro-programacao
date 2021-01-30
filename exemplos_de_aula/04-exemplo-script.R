# Esse será o nosso segundo exemplo de script

# Ele é similar ao anterior, mas começa com a leitura de uma tabela externa 

# Depois, o script é similar ao anterior:

# 1. Calcula uma série de estatísticas de uma coluna da base
# 2. Imprime essas estatísticas em texto para que você possa colar isso em outro lugar
# como um relatório, uma apresentação ou outro tipo de documento.


# Carregando pacotes ------------------------------------------------------

library(readr)

# Carregando os dados -----------------------------------------------------

base_de_dados <- read_csv2("dados/voos_de_janeiro.csv")

# Calculando estatísticas -------------------------------------------------

media <- round(mean(base_de_dados$atraso_chegada, na.rm = TRUE), 2)

desvio_padrao <- round(sd(base_de_dados$atraso_chegada, na.rm = TRUE), 2)

coeficiente_de_variacao <- round(100*desvio_padrao/media, 2)

maximo <- max(base_de_dados$atraso_chegada, na.rm = TRUE)

minimo <- min(base_de_dados$atraso_chegada, na.rm = TRUE)

# Criando um data.frame com as estatísticas descritivas -------------------


est_descr <- data.frame(media, desvio_padrao, coeficiente_de_variacao, maximo, minimo)

# salvar a tabela no computador -------------------------------------------


write_csv2(est_descr, file = "estatisticas_descritivas.csv")


# Imprimindo os resultados finais -----------------------------------------

mensagem_que_vou_imprimir <- paste0("A média dos dados é ", media, ", já o desvio padrão é ", desvio_padrao,
                                    ". O coeficiente de variação, portanto, é ", coeficiente_de_variacao,
                                    ", enquanto o máximo e o mínimo, por sua vez, são ", minimo, " e ", maximo,
                                    ".")

paste0(mensagem_que_vou_imprimir)



