# tabelas -------------------------------------------------------------

# 1. Use o data.frame airquality para responder às questões abaixo:

airquality


# (a) quantas colunas airquality tem?
ncol(airquality)

# (b) quantas linhas airquality tem?

nrow(airquality)

# (c) o que a função head() retorna?

head(airquality)
# A função head() retorna as 6 primeiras linhas da base de dados

# (d) quais são os nomes das colunas?

colnames(airquality)

# (e) qual é a classe da coluna Ozone? Dicas: class() e '$'

class(airquality$Ozone)

# (f) o que o código str(airquality) retorna?

str(airquality)

# (g) utilizando a resposta da (f), quais são os tipos de
#     cada coluna da tabela airquality?

# > str(airquality)
# $ Ozone  : int  
# $ Solar.R: int 
# $ Wind   : num  
# $ Temp   : int 
# $ Month  : int 
# $ Day    : int  


# [desafio] 2. Use o data.frame airquality para responder às questões abaixo:
# Vamos calcular o desvio padrão de Ozone sem usar a função sd().
# Dica: guarde os resultados de cada item em objetos para poderem ser usados depois.
# (a) tire a média da coluna Ozone. Dica: use mean(x, na.rm = TRUE).

media_ozone <- mean(airquality$Ozone, na.rm = TRUE)


# (b) subtraia da coluna Ozone a sua própria média (centralização).

ozone_centralizado <-  airquality$Ozone - media_ozone


# (c) eleve o vetor ao quadrado.

ozone_centralizado_ao_quadrado <-  ozone_centralizado ^ 2

# (d) tire a média do vetor.

media_ozone_centralizado_ao_quadrado <- mean(ozone_centralizado_ao_quadrado, na.rm = TRUE)


# (e) tire a raíz quadrada.

sd_ozone_calculado <- sqrt(media_ozone_centralizado_ao_quadrado)
sd_ozone_calculado

# (f) compare o resultado com sd(airquality$Ozone)


sd_ozone_funcao <- sd(airquality$Ozone, na.rm = TRUE)
sd_ozone_funcao 
# São iguais?
sd_ozone_calculado == sd_ozone_funcao

# Os resultados são diferentes!


