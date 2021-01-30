# Esse é o nosso quarto exemplo de script

# Ele é uma sequência de passos que começa com a criação de um vetor de dados e depois

# 1. Calcula uma série de estatísticas desse vetor
# 2. Imprime essas estatísticas em texto para que você possa colar isso em outro lugar
# como um relatório, uma apresentação ou outro tipo de documento.


# Carregando pacotes ------------------------------------------------------

library(readr)

# Lista de arquivos -------------------------------------------------------

arquivos <- c("dados/voos_de_janeiro.csv", "dados/voos_de_fevereiro.csv", "dados/voos_de_marco.csv",
              "dados/voos_de_abril.csv", "dados/voos_de_maio.csv", "dados/voos_de_junho.csv")


# Parâmetros do script ----------------------------------------------------

meta <- 5 # meta é a média de até 5 min de atraso

# Resultados - Loop -------------------------------------------------------

for(arquivo in arquivos){
  
  dados <- readr::read_csv2(arquivo,
                            col_types = "dddddddddcdcccddddT",
                            col_names = TRUE,
                            locale = locale(decimal_mark = ",", grouping_mark = "."))
  
  # Filtrando os dados! ----------------------------------------------------
  
  base_filtrada <- dados[dados$origem == "JFK" & dados$destino == "ATL",]
  

  # Calcula a média do dia --------------------------------------------------
  
  media <- round(mean(base_filtrada$atraso_saida, na.rm = TRUE), digits = 2)
  
  
  # Imprime a mensagem final em função dos dados ----------------------------
  
  if(media > meta){
    
    mensagem_final <- paste("No arquivo ", arquivo, " a média do atraso foi de", media,
          "minutos, o que é maior do que a meta de", meta, "minutos.")
    
  } else if(media <= meta) {
    
    mensagem_final <- paste("[ALERTA - NÃO BATEU A META] No arquivo ", arquivo, " a média do atraso foi de", media,
          "minutos, o que é menor do que a meta de", meta, "minutos.")
    
  }
  
  print(mensagem_final)
  
}

# Exercício

# 1. Amplie a abrangência desse script para os 12 meses de dados

# 2. Adapte o script para que ele tome a média em todos os voos, não mais em só nos que tem origem JFK e destino ATL


