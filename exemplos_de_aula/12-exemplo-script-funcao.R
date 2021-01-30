# Esse será o nosso primeiro exemplo de script

# Ele é uma sequência de passos que começa com a criação de um vetor de dados e depois

# 1. Calcula uma série de estatísticas desse vetor
# 2. Imprime essas estatísticas em texto para que você possa colar isso em outro lugar
# como um relatório, uma apresentação ou outro tipo de documento.


# Carregando pacotes ------------------------------------------------------

library(readr)

# Carregando os dados -----------------------------------------------------

base_de_dados <- read_csv2("dados/voos_de_janeiro.csv")


# Criando a função -----------------------------------------

calcula_estatisticas_descritivas <- function(df, coluna, meta = 5){

  
  # Filtrando os dados! ----------------------------------------------------
  
  
  coluna_desejada <- df[[coluna]]
  
  # Calculando estatísticas -------------------------------------------------
  
  media <- round(mean(coluna_desejada, na.rm = TRUE), 2)
  
  desvio_padrao <- round(sd(coluna_desejada, na.rm = TRUE), 2)
  
  coeficiente_de_variacao <- round(100*desvio_padrao/media, 2)
  
  maximo <- max(coluna_desejada, na.rm = TRUE)
  
  minimo <- min(coluna_desejada, na.rm = TRUE)
  

  # Criando um data.frame com as estatísticas descritivas -------------------
  
  
  est_descr <- data.frame(media, desvio_padrao, coeficiente_de_variacao, maximo, minimo)
  
  # salvar a tabela no computador -------------------------------------------
  
  
  write_csv2(est_descr, file = paste0("estatisticas_descritivas_", coluna, ".csv"))
  
  
  # Imprimindo os resultados finais -----------------------------------------
  
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
  
  
  
  
  
}


# Exemplo de uso da função
calcula_estatisticas_descritivas(base_de_dados, "atraso_saida")




