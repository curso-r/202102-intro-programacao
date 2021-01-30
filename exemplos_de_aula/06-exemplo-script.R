# Esse será o nosso segundo exemplo de script

# Ele é similar ao anterior, mas começa com a leitura de uma tabela externa e no final a saída do script se dá
# em função das estatísticas calculadas.

# No geral, o script é similar aos anteriores:

# 1. Calcula uma série de estatísticas de uma coluna da base
# 2. Verifica se as estatísticas estão de acordo com uma determinada meta pré-definida
# 3. Imprime uma mensagem personalizada de acordo com o resultado dos cálculos


# Carregando pacotes ------------------------------------------------------

library(readr)

# Carregando os dados -----------------------------------------------------

base_de_dados <- read_csv2("dados/voos_de_janeiro.csv")

# Filtrando os dados! ----------------------------------------------------


base_filtrada <- base_de_dados[base_de_dados$origem == "JFK" & base_de_dados$destino == "ATL",]


# Calculando estatísticas -------------------------------------------------

media <- round(mean(base_filtrada$atraso_chegada, na.rm = TRUE), 2)

desvio_padrao <- round(sd(base_filtrada$atraso_chegada, na.rm = TRUE), 2)

coeficiente_de_variacao <- round(100*desvio_padrao/media, 2)

maximo <- max(base_filtrada$atraso_chegada, na.rm = TRUE)

minimo <- min(base_filtrada$atraso_chegada, na.rm = TRUE)

# Criando um data.frame com as estatísticas descritivas -------------------


est_descr <- data.frame(media, desvio_padrao, coeficiente_de_variacao, maximo, minimo)

# salvar a tabela no computador -------------------------------------------


write_csv2(est_descr, file = "estatisticas_descritivas.csv")


# Imprimindo os resultados finais -----------------------------------------

meta <- 5 # meta é a média de até 5 min de atraso

mensagem_que_vou_imprimir <- paste0("A média dos dados é ", media, ", já o desvio padrão é ", desvio_padrao,
                                    ". O coeficiente de variação, portanto, é ", coeficiente_de_variacao,
                                    ", enquanto o máximo e o mínimo, por sua vez, são ", minimo, " e ", maximo,
                                    ".")

if(media > meta){
  
  paste(mensagem_que_vou_imprimir, " A média do atraso foi de", media,
        "minutos, o que é maior do que a meta de", meta, "minutos.")
  
} else if(media <= meta) {
  paste(mensagem_que_vou_imprimir, " A média do atraso foi de", media,
        "minutos, o que é menor do que a meta de", meta, "minutos.")
}





