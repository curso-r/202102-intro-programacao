# Filtro e vetores logicos ------------------------------------------------

# 1. use o vetor numeross abaixo para responder as questoes seguintes.
numeross <- -4:2

numeross 


# (a) Escreva um código que devolva apenas valores positivos do vetor numeross.

numeross[numeross > 0]


# (b) Escreva um código que devolta apenas os valores pares
#     do vetor numeross.
#     Dica: o operador %% devolve o resto da divisão entre dois números

numeross[numeross %% 2 == 0]


# Explicação: O operador %%  é utilizado para obter o resto da divisão. 
# O código a seguir resulta no resto da divisão dos números por 2:

numeross %% 2
# [1] 0 1 0 1 0 1 0

# Os números pares, quando divididos por 2, não tem resto nenhum! 
# (Ou seja, o resto é zero)
# Então fazemos o seguinte teste: 

numeross %% 2 == 0
# [1]  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE

# Os resultados verdadeiros sabemos que são pares.
# Podemos usar este teste para filtrar o vetor números 
# (deixar apenas os verdadeiros, ou seja, os números que a divisão por 
# 2 tem resto igual a zero)

numeross[numeross %% 2 == 0] 
# [1] -4 -2  0  2

# (c) Filtre o vetor para que retorne apenas aqueles valores que quando
#     elevados a 2 são menores do que 4.

numeross[(numeross ^ 2) < 4]



# 2. Use o data.frame airquality para responder às questões abaixo

airquality

# (a) conte quantos NAs tem na coluna Solar.R. Dica: use '$', is.na() e sum()

sum(is.na(airquality$Solar.R))

# (b) filtre a tabela airquality com apenas linhas em que Solar.R é NA.

airquality[is.na(airquality$Solar.R), ]

# (c) filtre a tabela airquality com apenas linhas em que Solar.R NÃO é NA.

airquality[!is.na(airquality$Solar.R), ]

# (d) filtre a tabela airquality com apenas linhas em que Solar.R NÃO é NA e Month é igual a 5.

airquality[!is.na(airquality$Solar.R) & airquality$Month == 5, ]
