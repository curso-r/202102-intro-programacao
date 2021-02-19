# Loops de repetição -------------------------------------------------------

# Uma das maiores vantagens de usar linguagens de programação para análise
# de dados é que podemos fazer o computador resolver em segundos
# coisas que nós demoraríamos muito tempo para fazer.

# Temos muitos exemplos de quando isso acontece, mas o mais direto
# é quando precisamos repetir uma mesma tarefa várias vezes

# for: repete uma mesma ação várias vezes, dentro de um determinado escopo

# escopo = contexto em que a ação será repetida

# estrutura:
# for(ESCOPO) {
# ACAO
# }

# Exemplos de ACAO

# ideia de programa: criar um programa imprima no nosso console os números de 1 a 10

# escopo ou contexto: os números de 1 a 10. Vamos repetir uma ação (imprimir) para cada um dos pedaços
# do nosso escopo

for (i in 1:10) {
# escopo: números de 1 a 10, representados pela letra "i"
  
  print(i)
  # ação, que faz menção à letra i
}

# a AÇÃO sempre deve se aplicar a um elemento nosso contexto. vamos a mais elementos de ACAO, sem mudar o contexto:

for (i in 1:10) {
  # escopo: números de 1 a 10, representados pela letra "i"
  
  # DAQUI PRA BAIXO VEM A AÇÃO:
  
  quadrado_de_i <- i^2
  # a ação pode ter quantas linhas você quiser, é um trecho de código em que aplicam as mesmas regras
  # que estamos estudando até agora
  
  # podemos criar uma variável, por exemplo!
  
  vetor_de_i <- 1:i
  
  print(vetor_de_i)
  # terminamos igual fizemos na última vez: imprimindo algo no console
  
}

# outro exemplo de ação

for (i in 1:10) {
  # escopo: números de 1 a 10, representados pela letra "i"
  # DAQUI PRA BAIXO VEM A AÇÃO:
  
  textinho_a_ser_impresso <- paste0("Esse é o passo: ", i)
  # a ação pode ter quantas linhas você quiser, é um trecho de código em que aplicam as mesmas regras
  # que estamos estudando até agora
  
  # podemos criar uma variável, por exemplo!
  
  print(textinho_a_ser_impresso)
  # terminamos igual fizemos na última vez: imprimindo algo no console
}

# Exemplos de ESCOPO

# o ESCOPO segue sempre um formato específico:

# VARIAVEL in VETOR_TOTAL

# nossa ACAO será executada dentro dos elementos do VETOR_TOTAL, um por um, em ordem.

# descrevemos a ACAO usando a VARIAVEL

# VARIAVEL e VETOR_TOTAL podem ser quaisquer nomes que você quiser, só precisa se lembrar
# das regras de nomes que temos no R!

# Não permitido

1x <- 1
_objeto <- 2
meu-objeto <- 3

# voltando ao primeiro exemplo:

# for (PEDACO in VETOR_TOTAL){
for (i in 1:10) {
  
  if(i == 8){
    browser()
  }
  
# VARIAVEL, aqui chamamos de i
# o 1:10 representa o VETOR_TOTAL
  
  vetor_da_flavia_e_da_natasha <- 1:i
  
  print(vetor_da_flavia_e_da_natasha)
  # nossa ação. precissa mencionar a letra i
}

# você pode inclusive criar o VETOR_TOTAL fora do loop:

aonde_vou_iterar <- 1:10

for (i in aonde_vou_iterar) {
  # VARIAVEL, aqui chamamos de i
  # o 1:10 representa o VETOR_TOTAL
  
  print(i)
  # nossa ação. precisa mencionar a letra i
}

# VETOR_TOTAL pode até não ter números

aonde_vou_iterar <- c("a", "b", "c", "d", "e", "f")

for (i in aonde_vou_iterar) {
  # VARIAVEL, aqui chamamos de i
  # o aonde_vou_iterar representa o VETOR_TOTAL
  
  print(i)
  # nossa ação. precisa mencionar a letra i
}

# PRESTE ATENÇÃO! A ORDEM IMPORTA!

aonde_vou_iterar <- c("c", "a", "d", "b", "e", "f")
# embaralhamos a ordem das letras

for (i in aonde_vou_iterar) {
  # VARIAVEL, aqui chamamos de i
  # o 1:10 representa o VETOR_TOTAL
  
  print(i)
  # nossa ação. precisa mencionar a letra i
}

# o VARIAVEL, pode ter qualquer nome também! você só precisa se lembrar de fazer menção a ela
# na ação

aonde_vou_iterar <- c("c", "a", "d", "b", "e", "f")
# embaralhamos a ordem das letras

for (variavel in aonde_vou_iterar) {
  # VARIAVEL, aqui chamamos de variavel
  # o 1:10 representa o VETOR_TOTAL
  
  print(variavel)
  # nossa ação. precisa mencionar a letra i
}


# Exercícios --------------------------------------------------------------


3 minutos para o exercício 1

# 1. Crie um script que imprima o texto "Esse aqui é o número XX", onde XX varia de 1 a 50.

for (numero in 1:50) {
  print(paste0("Esse aqui é o número ", numero))
}

# como o R processa isso?

# for (numero in 1:50) 
# esse comando diz que eu vou rodar 50 vezeses, os seguintes comandos:

# numero = 1
# print(paste0("Esse aqui é o número ", numero))

# depois

# numero = 2
# print(paste0("Esse aqui é o número ", numero))

# até o 50

# numero = 50
# print(paste0("Esse aqui é o número ", numero))

# 2. Crie um script que calcule o quadrado dos números de 7 a 31, calcule o quadrado desses números e imprima na tela
# Cada ver que a nossa AÇÃO for executada (calcular o quadrado), escreva seu programa de tal maneira que
# o computador indique o que está fazendo, conforme o esquema abaixo:

for(numero in 7:31){
  
  print("Iniciando ação")
  
  primeira_mensagem <- paste0("Calculando o quadrado de ", numero)
  
  print(primeira_mensagem)
  
  numero_ao_quadrado <- numero^2
  
  segunda_mensagem <- paste0("O quadrado de ", numero, " vale ", numero_ao_quadrado)

  print(segunda_mensagem)
}


for(numero in 7:31) {
  print("Iniciando ação")
  
  primeira_mensagem <- paste0("Calculando o quadrado de ", numero)
  
  print(primeira_mensagem)
  
  segunda_mensagem <-
    paste0("O quadrado de ", numero, " vale ", numero ^ 2)
  
  print(segunda_mensagem)
}

for(numero in seq(1, 100, 2)){
  ACAO
}

# "Iniciando ação",
# "Calculando o quadrado de XX" (essa frase será repetida para XX indo de 7 a 31)
# "O quadrado de XX vale YY"

# Uma das repetições do seu código deve imprimir as três frases:

# "Iniciando ação"
# "Calculando o quadrado de 31"
# "O quadrado de 31 vale 961"

str_glue("Calculando o quadrado de {numero}")
str_c("Calculando o quadrado de", numero, sep = " ")

# --------------------------

# Mais utilidades do for

# abrir arquivos manualmente e procurar por informações neles pode tomar muito do nosso tempo...

# podemos usar o for para facilitar a nossa vida!

arquivos_de_dados <- c("dados/voos_de_janeiro.csv", "dados/voos_de_fevereiro.csv", "dados/voos_de_marco.csv")
# vetor de textos com o caminhos dos nossos arquivos

library(readr)

for(arquivo in arquivos_de_dados){
# como ficou o nosso ESCOPO?
# VARIAVEL aqui levou esse nome "arquivo"
# VETOR_TOTAL aqui levou o nome "arquivos_de_dados"
  
  dados <- read_csv2(arquivo)
  
  maior_atraso <- min(dados$atraso_saida)
  
  texto_de_saida <- paste0("O maior atraso no arquivo ", arquivo, " é ", maior_atraso)
  
  print(texto_de_saida)
  
}

# o que não está muito legal nesse código?





















# vamos analisar o que ele já está cuspindo






















# 1. ele imprime varias informações que poluem a tela, mas isso naõ é um erro!

# para cada arquivo, o código de leitura devolve os tipos das colunas lidas
# Isso é bom para sabermos como que fica!

# 2. o máximo está dando NAs


arquivos <- c("dados/voos_de_janeiro.csv", "dados/voos_de_fevereiro.csv", "dados/voos_de_marco.csv")

for(arquivo in arquivos){
  
  dados <- readr::read_csv2(arquivo)
  
  maior_atraso <- max(dados$atraso_saida, na.rm = TRUE)
  
  texto_de_saida <- paste0("O maior atraso no arquivo ", arquivo, " é ", maior_atraso)
  
  print(texto_de_saida)
  
}

# Exercícios --------------------------------------------------------------

# 3 minutos pra fazer os exerícios

# 1. Inclua no nosso loop os arquivos indo até junho

arquivos <- c("dados/voos_de_janeiro.csv", "dados/voos_de_fevereiro.csv", "dados/voos_de_marco.csv",
              "dados/voos_de_abril.csv", "dados/voos_de_maio.csv", "dados/voos_de_junho.csv")

for(arquivo in arquivos){
  
  dados <- readr::read_csv2(arquivo)
  
  maior_atraso <- max(dados$atraso_saida, na.rm = TRUE)
  
  texto_de_saida <- paste0("O maior atraso no arquivo ", arquivo, " é ", maior_atraso)
  
  print(texto_de_saida)
  
}

# 2. Adapte o script anterior para que ele imprima os maiores atrasos e também os voos que saíram mais adiantados.

arquivos <- c("dados/voos_de_janeiro.csv", "dados/voos_de_fevereiro.csv", "dados/voos_de_marco.csv",
              "dados/voos_de_abril.csv", "dados/voos_de_maio.csv", "dados/voos_de_junho.csv")

for(arquivo in arquivos){
  
  dados <- readr::read_csv2(arquivo,
                            
                            col_types = "dddddddddcdcccddddT",
                            col_names = TRUE,
                            locale = locale(decimal_mark = ",", grouping_mark = "."))
  
  maior_atraso <- max(dados$atraso_saida, na.rm = TRUE)
  maior_adianto <- min(dados$atraso_saida, na.rm = TRUE)
  
  texto_de_saida <- paste0("O maior atraso no arquivo ", arquivo, " é ", maior_atraso)
  texto_de_saida_2 <-  paste0("O maior adianto no arquivo ", arquivo, " é ", maior_adianto)
  
  print(texto_de_saida)
  print(texto_de_saida_2)
  
}


# Dica: Na nossa base de dados um valor negativo na coluna "atraso_saida" indica que o voo saiu adiantado
