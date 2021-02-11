# Funções proprias ---------------------------------------------------------

# 1. Crie uma função que receba um número e retorne o quadrado deste
# número.


# 2. Crie uma função que receba dois valores (numéricos) e devolva o maior deles. 
# - A função deve ter exatamente dois argumentos. 
# - Você pode escolher qualquer nome para a função e para os argumentos.

# [desafio] 3. Crie uma função que recebe 2 números x e y
# e devolve a raiz quadrada da soma desses números.
# Depois teste a função para valores (x=2, y=3).
# Dica: sqrt() é a função para raiz quadrada.


# Funções e controle de fluxo ----------------------------

# 1.  O pai de Julio pediu para ele ir ao mercado. 
# Ele pediu para o garoto comprar feijão e, se 
# o quilo do arroz estiver abaixo de 10 reais,
# trazer também um quilo de arroz.

# Se o quilo do arroz estivesse custando 12 reais,
# o cenário acima poderia ser expresso na linguagem
# R, pelo código abaixo.

preco_kg_arroz <- 12

if (preco_kg_arroz < 10) {
  "Julio comprou arroz e feijão."
} else {
  "Julio comprou apenas feijão."
}

# Nesse caso, o "resultado" é Julio ter comprado apenas
# feijão.

# Podemos generalizar esse código para testarmos 
# com vários preços de arroz. Para isso, vamos 
# transformá-lo em uma função

o_que_julio_comprou <- function(preco_kg_arroz) {
  if (preco_kg_arroz < 10) {
    "Julio comprou arroz e feijão."
  } else {
    "Julio comprou apenas feijão."
  }
}

o_que_julio_comprou(8)
o_que_julio_comprou(12)

# Agora podemos testar o nosso cenário
# qualquer valor do quilo do arroz que quisermos.

# Modifique a função "o_que_julio_comprou" para
# representar os seguintes novos cenários:

# a) Julio deve comprar feijão e, se o quilo
# do arroz estiver abaixo de 12 reais, comprar
# arroz.

# b) Julio deve comprar arroz e feijão, mas
# apenas se o quilo do arroz estiver abaixo 
# de 10 reais. Caso contrário, não deve comprar
# nada.

# c) Julio deve comprar arroz e feijão se o quilo
# do arroz estiver menor de 10 reais; apenas 
# feijão se o quilo do arroz estiver entre 10 
# (inclusive) e 12 reais; e não deve comprar nada
# se o quilo do arroz estiver 12 reais ou mais 
# caro.

# d) Julio deve comprar arroz e feijão se o quilo
# do arroz estiver abaixo de 10 reais E se o quilo
# do feijão estiver abaixo de 8 reais. Caso contrário,
# ele não deve comprar nada.

# DICA: você deve insirir outro argumento (preco_kg_feijao)
# na função o_que_julio_comprou.