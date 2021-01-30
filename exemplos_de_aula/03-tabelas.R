# Introdução ----------

# Nossos dados, no geral, não são digitados manualmente dentro de um script

# Às vezes sim! Entretanto, na esmagadora maioria das vezes não é assim

# Para carregar os dados para dentro do R, a gente usa funções que são estão
# disponíveis no R quando o instalamos. Todos os dias alguém cria um novo jeito
# de importar dados dos mais variados formatos! 


# Pacotes ----------

# A forma de disponibilizar novas funções para que outras pessoas possam 
# utilizar é através de pacotes. Um pacote no R é um conjunto de funções, 
# bases de dados, e documentação (textos que explicam o que as funções fazem,
# quais dados as bases tem disponível, tutoriais como usar as funções, etc). 

# o pacote que vamos instalar se chama "readr", do inglês read = ler + r

# para instalar um pacote você usa uma função que se chama "install.packages" 
# e aplica ela num texto, entre aspas. As aspas são importantes!


install.packages("readr")

# para que todas as funções de leitura de dados fiquem disponíveis para você, 
# você usa a função "library". Neste caso, funciona com ou sem aspas!

library("readr")


# a função library deixa todas as funções que fazem parte do pacote readr
# disponíveis pra você utilizar. 
# se você fechar o RStudio por qualquer motivo, ou reiniciar a sessão do R,
# essas funções não estarão mais disponíveis e você vai precisar 
# usar a função library novamente.

# Apenas é necessário instalar o pacote uma vez no seu computador/usuário.
# Porém é necessário carregar as funções, utilizando a função library(), 
# todas as vezes que você iniciar o seu RStudio.

# Carregando os dados de uma planhila -------

# um formato muito comum de dados que a gente encontra por aí é a planilha. 
# Para ler uma planilha para dentro do R 
# que esteja salva com a extensão ".csv", 
# você pode utilizar a função read_csv2() :

base_de_dados <- read_csv2("dados/voos_de_janeiro.csv")

## Exercício! ------------
# Carregue a base de dados correspondente aos voos de fevereiro, 
# e guarde em um objeto chamado 'base_de_dados_fev'








# Bases no R - o que é um data.frame? -------

#  O objeto mais importante para a pessoa que é cientista de dados 
# é a base de dados.
# No R, uma base de dados é representada por objetos chamados de data.frames.
# Eles são equivalentes a uma tabela do SQL ou uma planilha do Excel.

# A principal característica de um data.frame é possuir linhas e colunas! 

# Na aula, usamos várias palavras para falar sobre a base de dados:
# base de dados, dataset, tabela, data.frame

# Explorando o que tem na base --------------

base_de_dados # somente o nome da base: visualizar no console

View(base_de_dados) # a função View() abre uma nova aba onde 
# é possível ver a base. Cuidado com o View() com bases muito
# grandes, pois sua sessão do RStudio pode ficar lenta!


# Retorna o número de colunas 
ncol(base_de_dados)

# Retorna o número de linhas
nrow(base_de_dados)

# Retorna o número de colunas e linhas (as dimensões do data.frame!)
dim(base_de_dados)


# Primeiras 6 linhas de uma tabela
head(base_de_dados)

# Últimas 6 linhas de uma tabela
tail(base_de_dados)

# Retorna algumas informações sobre a base

summary(base_de_dados)

str(base_de_dados)

## Exercícios! ------------
# Use as funções que apresentamos agora para descobrir:

# a) Quantos voos a base que carregamos referente à fevereiro
# (base_de_dados_fev) apresenta? (Dica: cada voo é apresentado em uma linha)


# b) Qual é a dimensão do data.frame base_de_dados_fev? E o que significa?


# c) Considerando os meses de Janeiro e Fevereiro, em qual mês a distância
# total voada foi maior?



# Datas no R ------------

# Datas e horas tem uma classe diferente no R, específica para isso!

class(base_de_dados$data_hora)

base_de_dados$data_hora

# função para transformar em data: neste caso, perderemos
# a informação sobre a hora

as.Date(base_de_dados$data_hora)


# também podemos converter um texto em formato data!

nascimento_texto <- c("1993-02-15")
class(nascimento_texto)

nascimento_data <- as.Date(nascimento_texto)
class(nascimento_data)


# e datas formatadas de outra forma?
nascimento_texto_br <- c("15-02-1993")

as.Date(nascimento_texto_br) # Resultado incorreto!


# usar argumento format para informar qual o formato da data
nascimento_data_br <- as.Date(nascimento_texto_br, format = "%d-%m-%Y") 

class(nascimento_data_br)


# Função Sys.Date() informa a data de hoje

Sys.Date()

# Podemos fazer operações matemáticas com datas

dias_desde_o_nascimento <- Sys.Date() - nascimento_data_br


# Função Sys.time() informa a data e hora de hoje, 
# além do fuso horário utilizado

hoje <- Sys.time()

class(hoje)

as.numeric(hoje) # segundos desde o dia 01 de janeiro de 1970



# Como criar um data.frame? -------------------

# A função data.frame() é uma forma de criar um data.frame:

amostra_avioes <- data.frame(
           codigo_cauda = c("N10156", "N102UW", "N103US"),
           ano = c(2004, 1998, 1999),
           motores = c(2, 2, 2), 
           assentos = c(55, 182, 182)
           )

# Obs:dados parciais da base dados::avioes: 
# dados::avioes[1:3, c(1, 2, 6, 7)]


# Outra forma de criar, é juntando vetores com a função data.frame():

codigo_cauda <- c("N10156", "N102UW", "N103US")
ano <- c(2004, 1998, 1999)
motores <- c(2, 2, 2)
assentos <- c(55, 182, 182)

amostra_avioes2 <- data.frame(codigo_cauda, ano, motores, assentos)


# Operadores de seleção de data.frames -------

## Selecionando elementos em um data.frame com o $ -------

# Usa o nome da coluna, e a retorna como um vetor!

base_de_dados$origem

base_de_dados$companhia_aerea

# Dica: use o tab do teclado para usar a funcionalidade de autocompletar.

## Selecionando elementos em um data.frame com o [ ] -------

# Outra forma de selecionar elementos é utilizando 
# os colchetes, Exemplos: 

# Selecionando a coluna pelo nome:
base_de_dados[["origem"]]
base_de_dados[["companhia_aerea"]]

# Selecionando a coluna pela posição (indexação):
base_de_dados[[13]]
base_de_dados[[10]]


# A classe data frame tem uma característica especial: dimensão

dim(base_de_dados)

# vetores não tem dimensão!
vetor <- c(1, 2)
dim(vetor) 

# Subsetting em objetos com 2 dimensões

# Sinxtaxe: data_frame[indice_linha, indice_coluna]

# Seleciona a linha 1 e a coluna 2
base_de_dados[1, 2] 

# Seleciona a linha 1 e TODAS as colunas
base_de_dados[1, ] 

# Seleciona TODAS as linhas e apenas a coluna 2
base_de_dados[ , 2] 


# Selecionando colunas

base_de_dados[, c(13, 10)]
base_de_dados[, c("origem", "companhia_aerea")]


# Dataframes e funções ------------

# Qual é a soma ....?
sum(base_de_dados$distancia)

# Menor valor encontrado: o menor número encontrado na coluna
min(base_de_dados$distancia)

# Maior valor encontrado: o maior número encontrado na coluna
max(base_de_dados$distancia)


# Média 
mean(base_de_dados$distancia)

# Mediana 
median(base_de_dados$distancia)

# Variância
var(base_de_dados$distancia)

# Desvio padrão
sd(base_de_dados$distancia)
