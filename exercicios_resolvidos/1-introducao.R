# Exercícios - Introdução ao R

# objetos -----------------------------------------------------------------

# (a) Crie um vetor com o nome de tres frutas e guarde em um objeto chamado frutas.

frutas <- c("Banana", "Melancia", "Melão")

# (b) Use a função length() para contar o tamanho do vetor. Certifique-se que retorna 3.

length(frutas)

# (c) Use [] para retornar a primeira fruta do vetor.

frutas[1]

# (d) Inspecione a saída de 'paste("eu gosto de", frutas)' e responda se o tamanho do vetor mudou.

paste("eu gosto de", frutas)
# O tamanho do vetor continua sendo 3.

# vetores e funcoes ---------------------------------------------------------

# 1. Analise as duas linhas de códigos abaixo:
c(1,2,3) - 1           # código 1
c(1,2,3) - c(1,1,1)    # código 2
# Os resultados são iguais? Porquê?


# Os resultados são iguais. Na primeira linha acontece a reciclagem:
c(1,2,3) - 1   

# Estamos fazendo uma operação com dois vetores de tamanhos diferentes, então
# o vetor de tamanho menor será repetido até obter o tamanho do vetor maior.
# Portanto, é equivalente a fazer a seguinte operação:
c(1,2,3) - c(1,1,1)  
# Nesta operação, a subtração acontecerá utilizando a posição dos elementos 
# dos vetores: 
# o primeiro elemento do primeiro vetor menos o primeiro elemento do segundo vetor
# (1-1),
# e assim sucessivamente .. 

# O resultado nos dois casos será o mesmo! 

# > c(1,2,3) - 1           # código 1
# [1] 0 1 2
# > c(1,2,3) - c(1,1,1)    # código 2
# [1] 0 1 2