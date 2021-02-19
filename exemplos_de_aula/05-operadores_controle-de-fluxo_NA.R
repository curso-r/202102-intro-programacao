# Comparações lógicas ------------------------------------------------------

# Valores lógicos

class(TRUE)
class(FALSE)

# TRUE e FALSE são nomes reservados 

TRUE <- 1

class(T) 
# 
# True <- 1
# 
# true 

x <- 1

# Testes com resultado verdadeiro
x == 1 

x == 1 # comparacao

# x = 2 # atribuicao
# x <- 2 # atribuicao

"a" == "a"



# Testes com resultado falso
x == 2
"a" == "b"
"a" == "A"

# Maior
x > 3
x > 0

# Maior ou igual
x > 1
x >= 1


# Menor
x < 3 
x < 0

# Menor ou igual
x < 1
x <= 1

# Diferente
x != 1 

x != 2

x %in% c(1, 2, 3) 

"a" %in% c("b", "c")

# Comparações lógicas serão a base dos filtros!

avaliacao_do_cliente <- c(1, 3, 0, 10, 2, 5, 20)
estado_de_nascimento <- c("SP", "PB", "PB", "RJ", "MT", "MT", "SP")

avaliacao_do_cliente > 3


avaliacao_do_cliente[avaliacao_do_cliente > 3]

estado_de_nascimento %in% c("SP", "MT")

estado_de_nascimento[estado_de_nascimento %in% c("SP", "MT")]


avaliacao_do_cliente[estado_de_nascimento %in% c("SP", "MT")]






# Exercícios --------------------------------------------------------------

# 1. Escreva um código que devolva apenas os valores maiores
# ou iguais a 10 do vetor abaixo:

vetor <- c(4, 8, 15, 16, 23, 42)

vetor[c(FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)]

vetor[vetor >= 10]

vetor[c(3, 4, 5, 6)]

vetor[c(3:6)]

# Operadores lógicos ----------

## & - E - Para ser verdadeiro, os dois lados 
# precisam resultar em TRUE

x <- 5
x >= 3 & x <=7
# TRUE, TRUE
# TRUE

y <- 2
y >= 3 & y <= 7
# FALSE, TRUE  -> FALSE


## | - OU - Para ser verdadeiro, apenas um dos 
# lados precisa ser verdadeiro

y <- 2 

y >= 3 | y <=7
# FALSE, TRUE -> TRUE


y <- 1 
y >= 3 | y == 0
# FALSE | FALSE

## ! - Negação - É o "contrário"

!TRUE

!FALSE


w <- 5
(!w < 4)


# Filtrando linhas do data.frame  com vetores lógicos --------------
library(readr)
base_de_dados <- read.csv2("dados/voos_de_janeiro.csv")



base_de_dados$atraso_chegada
base_de_dados$atraso_chegada == 4  # Retorna um vetor de VERDADEIRO ou FALSO

# Podemos filtrar linhas baseadas no retorno do vetor com TRUE e FALSE,
# sendo que: o que for TRUE ficará na base, e o que for FALSE será removido.
voos_origem_ewr <- base_de_dados[base_de_dados$origem == "EWR", ]
View(voos_origem_ewr)


voos_tempo_maior_100 <- base_de_dados[base_de_dados$tempo_voo > 100,   ]

#  Podemos combinar!
ex1 <- base_de_dados[base_de_dados$origem == "EWR" | base_de_dados$tempo_voo > 100,
                     
                     c("horario_saida", "origem", "tempo_voo")
                     ]


ex2 <- base_de_dados[base_de_dados$origem == "EWR" & base_de_dados$tempo_voo > 100,]


# base[linhas, colunas]


# Exercícios --------------------------------------------------------------

# 1. Usando a base de voos, escreva um código que devolva apenas os voos 
# que aconteceram no dia 15/01/2013:

resposta1 <- base_de_dados[base_de_dados$dia == 15 & 
                             base_de_dados$mes == 1,
                           ]

View(resposta1)


base_de_dados$data <-  as.Date(base_de_dados$data_hora)
resposta1_v2 <- base_de_dados[base_de_dados$data == "2013-01-15", ]
View(resposta1_v2)

# 4. Usando a base de voos, escreva um código que devolva apenas os voos 
# que aconteceram nos dias 15/01/2013 ou 16/01/2013:


ex4 <-
  base_de_dados[base_de_dados$dia == 15 | base_de_dados$dia == 16 ,]

View(ex4)

# verificando

unique(ex4$dia)
table(ex4$dia)

# 2. Usando a base de voos, escreva um código que devolva apenas os voos 
# que NÃO sairam do aeroporto JFK:

unique(base_de_dados$origem)


resolucao_2 <- base_de_dados[base_de_dados$origem != "JFK", ]

View(resolucao_2)

unique(resolucao_2$origem)

# 3. Usando a base de voos, escreva um código que devolva apenas os voos 
# que sairam do aeroporto JFK, e foram para Atlanta ("ATL"), 
# e salve em um objeto chamado voos_jfk_atlanta:
resolucao3 <- base_de_dados[base_de_dados$origem == "JFK" & base_de_dados$destino == "ATL", ]


View(resolucao3)

unique(resolucao3$origem)

unique(resolucao3$destino)



# Controle de fluxo -------------------------------------------------------

# É muito comum usarmos operadores lógicos para fazer os nossos códigos 
# tomarem decisões.
# Para isso, utilizamos os controladores de fluxo.

# if: faz uma ação se a condição for atendida

# estrutura:
# if(CONDICAO) {
# ACAO
# }


x <- 1

if(x == 1) {         
  Sys.time()    
}

# if/else: faz uma ação se as condições anteriores não forem atendidas.

x <- 0

if(x < 0){ # se
  "negativo"
} else { # se não
  "não negativo"
}

# else-if: generaliza o comportamento do if

if(x < 0) {
  "negativo"
} else if(x == 0) {
  "neutro"
} else {
  "positivo"
}

# Mais um exemplo de if! Contagem regressiva para o carnaval!

hoje <- Sys.Date()
carnaval <- as.Date("2021-02-16")


carnaval - hoje
as.numeric(carnaval) - as.numeric(hoje) 



if(hoje < carnaval){
  
  dias_para_carnaval <- as.numeric(carnaval - hoje) 
  paste("Faltam", dias_para_carnaval, "dias para o carnaval!")
  
}  else if(hoje == carnaval){
  
  paste("Hoje é carnaval!")
  
} else {
  
  paste("O carnaval de 2021 já passou... agora só ano que vem!")
  
}





# Exercícios --------------------------------------------------------------

# 1. Imagine que você é uma pessoa professora, e quer usar o R para saber
# se as pessoas alunas foram aprovadas ou não na disciplina,
# segundo a nota final.
# Usando o if, preencha os campos com ... abaixo para que o if retorne:
# aprovada se tiver nota maior  ou igual a 5,
# reprovada se tiver nota menor que 3,
# e recuperação se tiver nota maior ou igual que 3 e menor que 5.


nota <- 3

if(nota >= 5) {
  print("Aprovada")
} else if (nota < 3) {
  print("Reprovada")
  
} else {
  print("Fazer a prova de recuperacao")
}

# 2. Continuando o exercício anterior: 
# Depois de preencher os campos, teste o código com diferentes notas!
# O que o código retorna é coerente com a nota que você passou?


# outro exemplo

sigla_estado <- "RS" # Criamos um exemplo pra testar

if (sigla_estado %in% c("DF")) {
  print("Distrito Federal")
} else if (sigla_estado %in% c("AC", "AP", "AM", "RR", "PA", "RO", "TO")) {
  print("Norte")
} else if (sigla_estado %in% c("AL",  "BA", "CE", "MA",  "PB",
                               "PE", "PI", "SE" , "RN")) {
  print("Nordeste")
} else if (sigla_estado %in% c("GO", "MT", "MS")) {
  print("Centro-Oeste")
} else if (sigla_estado %in% c("ES", "MG", "RJ", "SP")) {
  print("Sudeste")
} else if (sigla_estado %in% c("PR", "RS", "SC")) {
  print("Sul")
} else {
  print("Não encontrei este estado... Você pode conferir se digitou corretamente?")
}


# Voltando a falar sobre tabelas!  ------------------------------------

# Vamos carregar mais uma base! Voos de fevereiro


library(readr)
base_de_dados <- read.csv2("dados/voos_de_janeiro.csv")



base_de_dados_fev <- read_csv2("dados/voos_de_fevereiro.csv")

head(base_de_dados_fev)


# Queremos juntar as bases com dados de janeiro em fevereiro, e uma única base.
# a base contém as mesmas colunas!
# usar a funcao rbind() (de row bind)

base_jan_fev <- rbind(base_de_dados, base_de_dados_fev)

View(base_jan_fev)

unique(base_jan_fev$mes)

# E se eu quiser adicionar uma nova coluna? 
# cbind()   (de column bind)

nome_mes <- "janeiro"

janeiro <- cbind(base_de_dados, nome_mes)

data <- as.Date(base_de_dados$data_hora)

janeiro2 <- cbind(base_de_dados, data)

# Valores especiais -------------------------------------------------------

# Existem valores reservados para representar dados faltantes,
# infinitos, e indefinições matemáticas.

NA   # (Not Available) significa dado faltante/indisponível.

NaN  # (Not a Number) representa indefinições matemáticas, como 0/0 e log(-1).
# Um NaN é um NA, mas a recíproca não é verdadeira.

Inf  # (Infinito) é um número muito grande ou o limite matemático, por exemplo,
# 1/0 e 10^310. Aceita sinal negativo -Inf.

NULL # representa a ausência de objeto (no R).

# Comparações lógicas

idade_ana <- 30
idade_beto <- NA
idade_carla <- NA

idade_ana == idade_beto

idade_beto == idade_carla

5 == NA

# Use as funções is.na(), is.nan(), is.infinite() e is.null()
# para testar se um objeto é um desses valores.

x <- NA
is.na(x)



0 / 0 == NaN
is.nan(0 / 0)


idades <- c(15, 64, 31, NA, 59)
is.na(idades)

sum(idades)

idades[!is.na(idades)]

sum(idades[!is.na(idades)])

is.nan(NaN)
is.infinite(10 ^ 309)
is.null(NULL)

library(readr)

base_de_dados <- read_csv2("dados/voos_de_janeiro.csv")

# Dataframes e funções ------------

# E se quisermos calcular coisas com a coluna atraso_chegada?

sum(base_de_dados$atraso_chegada) 

# A coluna atraso_chegada possui NA, por isso a soma dela será NA!

# Verificando os NA:

is.na(base_de_dados$atraso_chegada) # retornará um vetor com TRUE e FALSE,
# sendo que TRUE representa a presença de NA.

sum(is.na(base_de_dados$atraso_chegada)) # Quantos NA tem na coluna?
# Assim somaremos quantos NA tem na coluna,
# pois cada TRUE (presença de NA) será contabilizado como 1.

# como o comando da linha 313 é processado pelo R?

# primeiro passo é rodar is.na(base_de_dados$atraso_chegada)
preliminar <- is.na(base_de_dados$atraso_chegada)

# segundo passo é rodar o que tinha dentro do parenteses
sum(preliminar)

# por outro lado...

sum(base_de_dados$atraso_chegada)

# ... e se quisermos ignorar o NA? 
# Algumas funções possuem um argumento para remover os NA:
# na.rm = TRUE

# Qual é a soma ....?
sum(base_de_dados$atraso_chegada, na.rm = FALSE)

# Menor valor encontrado: o menor número encontrado na coluna
min(base_de_dados$atraso_chegada, na.rm = TRUE)

# Maior valor encontrado: o maior número encontrado na coluna
max(base_de_dados$atraso_chegada, na.rm = TRUE)

# Média 
mean(base_de_dados$atraso_chegada, na.rm = TRUE)

# Mediana 
median(base_de_dados$atraso_chegada, na.rm = TRUE)

# Variância
var(base_de_dados$atraso_chegada, na.rm = TRUE)

# Desvio padrão
sd(base_de_dados$atraso_chegada, na.rm = TRUE)

# exemplo... o nosso desafio da na bse airquality

?airquality

# (a) tire a média da coluna Ozone. Dica: use mean(x, na.rm = TRUE).

mean(airquality$Ozone)
# isso daqui dá errado

mean(airquality$Ozone, na.rm = TRUE)

# outro jeito de fazer...

qualidade_do_ar <- airquality

coluna_ozone <- airquality$Ozone

sum(is.na(coluna_ozone))

mean(is.na(coluna_ozone))

airquality_sem_na <- airquality[!is.na(airquality$Ozone), ]

numero_de_linhas_sem_na <- nrow(airquality_sem_na)

sum(airquality_sem_na$Ozone)/numero_de_linhas_sem_na

# Exercícios ------------------------------------------
# 1. Calcule o valor mínimo e valor máximo da coluna "atraso_saida". O que 
# esses valores significam?


