# for + if é bem poderoso

# existe uma outra maneira de usar o for, que é bem poderosa também: podemos 
# ir evoluindo nossas variáveis passo a passo.

# vamos calcular a soma dos números de 1 a 30 números usando um laço, só pra ilustrar o conceito:

# primeiro iniciamos o "repositório" dessa soma
soma_de_1_a_30 <- 0

for(i in 1:30){
  
  print(paste0("Passo ", i))
  
  print(paste0("soma_de_1_a_30 está valendo ", soma_de_1_a_30))
  
  soma_de_1_a_30 <- soma_de_1_a_30+i
  
  print(paste0("Atualizei o soma_de_1_a_30, somando o valor de i, que é ", i))
  
}

# em cada passo:

# a variável soma_de_1_a_30 começa em 0, que definimos fora do for, vai pouco a pouco recebendo o i da vez.
# conforme o for vai andando dentro do vetor que definimos na linha 11, soma_de_1_a_30 vai ficando maior!

# Outro exemplo:

# Vamos criar um vetor que tenha o atraso médio em cada um dos aeroportos de origem da tabela "voos_em_janeiro.csv"

# Mas primeiro... Como a gente descobre quais são os aeroportos disponiveis?

base_de_dados <- readr::read_csv2("dados/voos_de_janeiro.csv")

# assim nós conseguimos os aeroportos de origem voo por voo, isso é, de cada linha da base e em sequência
base_de_dados$origem

# a função "unique" tira as duplicações, sobrando só o que a gente quer mesmo:
unique(base_de_dados$origem)

# vamos guardar esse vetor para ficar mais fácil de usar depois
lista_de_aeroportos <- unique(base_de_dados$origem)

# vamos iniciar o nosso vetor de médias com NULL, ou seja, VAZIO:
vetor_de_medias <- NULL

for(aeroporto in lista_de_aeroportos){
  
  print(paste0("Calculando média dos voos que saíram de ", aeroporto))
  
  print(paste0("Filtrando a base..."))
  
  base_filtrada <- base_de_dados[base_de_dados$origem == aeroporto, ]
  
  print(paste0("Calculando a média..."))
  
  media <- mean(base_filtrada$atraso_saida, na.rm = TRUE)
  
  print(paste0("A média de atraso dos voos que saíram de ", aeroporto, " é ", media))
  
  print(paste0("Salvando em um vetor..."))
  
  # aqui está o pulo do gato!
  vetor_de_medias <- c(vetor_de_medias, media)
  
  print(paste0("Vetor ao final do cálculo do aeroporto ", aeroporto, ":"))
  print(vetor_de_medias)
  
}

# quando fazemos vetor_de_medias <- c(vetor_de_medias, media)

# o R processa assim:

# Passo do aeporto  EWR

# vetor_de_medias esta valendo NULL
# media vai valer 14.9057
# a atualização fica assim
# vetor_de_medias vai passar a valer NULL com o media empilhado à direita (14.9057)
# vetor_de_medias está valendo 14.9057

# Passo do aeroporto LGA

# vetor_de_medias esta valendo 14.9057
# media vai valer 5.64
# a atualização fica assim
# vetor_de_medias vai passar a valer 14.9057 com o media empilhado à direita (5.64)
# vetor_de_medias está valendo c(14.9057, 5.64)

# as médias estão chegando no "vetor_de_medias" conforme elas vão sendo
# calculadas, mas isso é só porque nós acertamos na linha 65.

# por conta disso, é fácil até criar uma tabela com esses resultados:
tabela_de_medias_por_aeroporto <- data.frame(
  aeroportos = lista_de_aeroportos,
  atraso_medio = vetor_de_medias
)

# podemos ver que o aeroporto LGA costuma ser mais pontual do que o JFK, onde o atraso chega quase a 15 minutos

# poderíamos fazer ao contrário também:

# é preciso reiniciar o vetor, se não ele vai continuar crescendo conforme a gente roda o for
vetor_de_medias <- NULL

for(aeroporto in lista_de_aeroportos){
  
  print(paste0("Calculando média dos voos que saíram de ", aeroporto))
  
  print(paste0("Filtrando a base..."))
  
  base_filtrada <- base_de_dados[base_de_dados$origem == aeroporto, ]
  
  print(paste0("Calculando a média..."))
  
  media <- mean(base_filtrada$atraso_saida, na.rm = TRUE)
  
  print(paste0("A média de atraso dos voos que saíram de ", aeroporto, " é ", media))
  
  print(paste0("Salvando em um vetor..."))
  
  # aqui está o pulo do gato!
  vetor_de_medias <- c(media, vetor_de_medias)
  
  print(paste0("Vetor ao final do cálculo do aeroporto ", aeroporto, ":"))
  print(vetor_de_medias)
  
}

# agora entrou ao contrário, por causa do jeito que escrevemos na linha 96
# falando nisso, é claro que a gente poderia também simplesmente não gerar esse vetor!

#vetor_de_medias <- NULL

for(aeroporto in lista_de_aeroportos){
  
  print(paste0("Calculando média dos voos que saíram de ", aeroporto))
  
  print(paste0("Filtrando a base..."))
  
  base_filtrada <- base_de_dados[base_de_dados$origem == aeroporto, ]
  
  print(paste0("Calculando a média..."))
  
  media <- mean(base_filtrada$atraso_saida, na.rm = TRUE)
  
  print(paste0("A média de atraso dos voos que saíram de ", aeroporto, " é ", media))
  
  # sem as linhas abaixo o ródigo roda normal:
  #print(paste0("Salvando em um vetor..."))
  
  # aqui está o pulo do gato!
  #vetor_de_medias <- c(media, vetor_de_medias)
  
  #print(paste0("Vetor ao final do cálculo do aeroporto ", aeroporto, ":"))
  #print(vetor_de_medias)
  
}

# Exercício

# 5 minutos

# 1. Calcule as médias de atraso na chegada (a base de dados tem a coluna atraso_chegada também!)
# para cada um dos destinos e guarde em um vetor "vetor_de_atraso_de_chegada".

base_de_dados <- read_csv2("dados/voos_de_janeiro.csv")

lista_de_aeroportos <- unique(base_de_dados$destino)
vetor_de_atraso_de_chegada <- NULL

for (dest in lista_de_aeroportos){
  print(paste0("Calculando média de atraso na chegada do aeroporto ", dest))
  
  base_filtrada <- base_de_dados[base_de_dados$destino == dest, ]
  
  media <- mean(base_filtrada$atraso_chegada, na.rm = TRUE)
  print(paste0("A média de atraso dos voos com destino ao ", dest, " é ", media))
  vetor_de_atraso_de_chegada <- c(vetor_de_atraso_de_chegada , media)
  #print(vetor_de_atraso_de_chegada)
}


lista_de_aeroportos_de_destino <- unique(base_de_dados$destino)

vetor_de_atraso_de_chegada <- NULL

for(dest in lista_de_aeroportos_de_destino){
  
  base_filtrada <- base_de_dados[base_de_dados$destino == dest, ]
  
  media <- mean(base_filtrada$atraso_chegada, na.rm = TRUE)
  
  vetor_de_atraso_de_chegada <- c(vetor_de_atraso_de_chegada, media)
  
}

print(vetor_de_atraso_de_chegada)

# Você pode conseguir uma lista desses destinos fazendo:
# lista_de_aeroportos_de_destino <- unique(base_de_dados$destino

# 2. Calcule o mínimo o médio e o máximo desse vetor. Quais são os destinos em que os voos chegam com maior atraso?
# Para te ajudar a visualizar o resultado você poderia organizar os resultados em um data.frame.

min(vetor_de_atraso_de_chegada)
mean(vetor_de_atraso_de_chegada)
max(vetor_de_atraso_de_chegada)

atrasos <- data.frame(
  destinos = lista_de_aeroportos_de_destino,
  atraso_medio = vetor_de_atraso_de_chegada
)

atrasos[atrasos$atraso_medio == mean(atrasos$atraso_medio),]
atrasos[atrasos$atraso_medio == max(atrasos$atraso_medio),]
atrasos[atrasos$atraso_medio == min(atrasos$atraso_medio),]
