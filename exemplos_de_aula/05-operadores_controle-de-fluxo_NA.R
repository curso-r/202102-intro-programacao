# Comparações lógicas ------------------------------------------------------

# Valores lógicos

class(TRUE)
class(FALSE)

# TRUE e FALSE são nomes reservados 

TRUE <- 1

x <- 1

# Testes com resultado verdadeiro
x == 1
"a" == "a"

# Testes com resultado falso
x == 2
"a" == "b"

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
estado_de_nascimento <- c("SP", "PB", "PB", "RJ", "MT", "MT")

avaliacao_do_cliente > 3
estado_de_nascimento %in% c("SP", "MT")

avaliacao_do_cliente[avaliacao_do_cliente > 3]
avaliacao_do_cliente[estado_de_nascimento %in% c("SP", "MT")]



# Exercícios --------------------------------------------------------------

# 1. Escreva um código que devolva apenas os valores maiores
# ou iguais a 10 do vetor abaixo:

vetor <- c(4, 8, 15, 16, 23, 42)



# Operadores lógicos ----------

## & - E - Para ser verdadeiro, os dois lados 
# precisam resultar em TRUE

x <- 5
x >= 3 & x <=7


y <- 2
y >= 3 & y <= 7

## | - OU - Para ser verdadeiro, apenas um dos 
# lados precisa ser verdadeiro

y <- 2
y >= 3 | y <=7

y <- 1
y >= 3 | y == 0


## ! - Negação - É o "contrário"

!TRUE

!FALSE


w <- 5
(!w < 4)


# Filtrando linhas do data.frame  com vetores lógicos --------------

base_de_dados$atraso_chegada
base_de_dados$atraso_chegada == 4  # Retorna um vetor de VERDADEIRO ou FALSO

# Podemos filtrar linhas baseadas no retorno do vetor com TRUE e FALSE,
# sendo que: o que for TRUE ficará na base, e o que for FALSE será removido.
base_de_dados[base_de_dados$origem == "EWR",]
base_de_dados[base_de_dados$tempo_voo > 100,]

#  Podemos combinar!
base_de_dados[base_de_dados$origem == "EWR" | base_de_dados$tempo_voo > 100,]
base_de_dados[base_de_dados$origem == "EWR" & base_de_dados$tempo_voo > 100,]


# Exercícios --------------------------------------------------------------

# 1. Usando a base de voos, escreva um código que devolva apenas os voos 
# que aconteceram no dia 15/01/2013:


# 2. Usando a base de voos, escreva um código que devolva apenas os voos 
# que NÃO sairam do aeroporto JFK:


# 3. Usando a base de voos, escreva um código que devolva apenas os voos 
# que sairam do aeroporto JFK, e foram para Atlanta ("ATL"), 
# e salve em um objeto chamado voos_jfk_atlanta:



# 4. Usando a base de voos, escreva um código que devolva apenas os voos 
# que aconteceram nos dias 15/01/2013 ou 16/01/2013:



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

x <- 1

if(x < 0){
  "negativo"
} else {
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
# e recuperação se tiver nota maior que 3 e menor que 5.


nota <- 5 

if(nota >= 5){
  
  print("....")
  
} else if(....) {
  
  print("Reprovada")
  
} else {
  
  print("...")
}

# 2. Continuando o exercício anterior: 
# Depois de preencher os campos, teste o código com diferentes notas!
# O que o código retorna é coerente com a nota que você passou?





# Voltando a falar sobre tabelas!  ------------------------------------

# Vamos carregar mais uma base! Voos de fevereiro

base_de_dados_fev <- read_csv2("dados/voos_de_fevereiro.csv")

head(base_de_dados_fev)


# Queremos juntar as bases com dados de janeiro em fevereiro, e uma única base.
# a base contém as mesmas colunas!
# usar a funcao rbind() (de row bind)

base_jan_fev <- rbind(base_de_dados, base_de_dados_fev)

# E se eu quiser adicionar uma nova coluna? 
# cbind()   (de column bind)

nome_mes <- "janeiro"
cbind(base_de_dados, nome_mes)


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

is.nan(NaN)
is.infinite(10 ^ 309)
is.null(NULL)


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


# ... e se quisermos ignorar o NA? 
# Algumas funções possuem um argumento para remover os NA:
# na.rm = TRUE

# Qual é a soma ....?
sum(base_de_dados$atraso_chegada, na.rm = TRUE)

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


# Exercícios ------------------------------------------
# 1. Calcule o valor mínimo e valor máximo da coluna "atraso_saida". O que 
# esses valores significam?


