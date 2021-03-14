# Funções proprias ---------------------------------------------------------

# 1. Crie uma função que receba um número e retorne o quadrado deste
# número.

elevar_ao_quadrado <- function(numero){
  numero ^ 2
}

# testando a função
elevar_ao_quadrado(2)

elevar_ao_quadrado(4)

# 2. Crie uma função que receba dois valores (numéricos) e devolva o maior deles. 
# - A função deve ter exatamente dois argumentos. 
# - Você pode escolher qualquer nome para a função e para os argumentos.

# Podemos fazer a função de forma que ela apenas retorne o número
qual_e_o_maior <- function(num1, num2) {
  if (num1 > num2) {
    num1
  } else{
    num2
  }
}

# Teste se o resultado faz sentido
qual_e_o_maior(1, 2)

qual_e_o_maior(5, 10)

qual_e_o_maior(10, 5)

# Podemos fazer de forma que ela retorne também um texto explicativo

qual_e_o_maior <- function(num1, num2) {
  if (num1 > num2) {
    paste0("Dentre os números informados (",
           num1,
           " e ", num2,
           ") o maior número é o ",
           num1, ".")
  } else{
    paste0("Dentre os números informados (",
           num1,
           " e ", num2,
           ") o maior número é o ",
           num2, ".")
  }
}

# Teste se o resultado faz sentido
qual_e_o_maior(1, 2)

qual_e_o_maior(5, 10)

qual_e_o_maior(10, 5)


# [desafio] 3. Crie uma função que recebe 2 números x e y
# e devolve a raiz quadrada da soma desses números.
# Depois teste a função para valores (x=2, y=3).
# Dica: sqrt() é a função para raiz quadrada.

raiz_quadrada_da_soma <- function(x, y) {
  soma <- x + y
  sqrt(soma)
}

raiz_quadrada_da_soma(x = 2, y = 3)

# raiz_quadrada_da_soma(x = 2, y = 3)
# [1] 2.236068

# Funções e controle de fluxo ----------------------------

# 3.  O pai de Julio pediu para ele ir ao mercado. 
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


o_que_julio_comprou_a <- function(preco_kg_arroz) {
  if (preco_kg_arroz < 12) {
    "Julio comprou arroz e feijão."
  } else {
    "Julio comprou apenas feijão."
  }
}

o_que_julio_comprou_a(8)
o_que_julio_comprou_a(12)

# b) Julio deve comprar arroz e feijão, mas
# apenas se o quilo do arroz estiver abaixo 
# de 10 reais. Caso contrário, não deve comprar
# nada.

o_que_julio_comprou_b <- function(preco_kg_arroz) {
  if (preco_kg_arroz < 10) {
    "Julio comprou arroz e feijão."
  } else {
    "Julio não comprou nada!"
  }
}

o_que_julio_comprou_b(8)
o_que_julio_comprou_b(12)

# c) Julio deve comprar arroz e feijão se o quilo
# do arroz estiver menor de 10 reais; apenas 
# feijão se o quilo do arroz estiver entre 10 
# (inclusive) e 12 reais; e não deve comprar nada
# se o quilo do arroz estiver 12 reais ou mais 
# caro.

o_que_julio_comprou_c <- function(preco_kg_arroz) {
  if (preco_kg_arroz < 10) {
    "Julio comprou arroz e feijão."
  } else if(preco_kg_arroz < 12){
    "Julio comprou apenas feijão"

  } else {
    "Julio não comprou nada!"
  }
}

o_que_julio_comprou_c(8)
o_que_julio_comprou_c(10)
o_que_julio_comprou_c(12)

# d) Julio deve comprar arroz e feijão se o quilo
# do arroz estiver abaixo de 10 reais E se o quilo
# do feijão estiver abaixo de 8 reais. Caso contrário,
# ele não deve comprar nada.

# DICA: você deve inserir outro argumento (preco_kg_feijao)
# na função o_que_julio_comprou.

o_que_julio_comprou_d <- function(preco_kg_arroz, preco_kg_feijao) {
  if (preco_kg_arroz < 10 & preco_kg_feijao < 8) {
    "Julio comprou arroz e feijão."
  } else {
    "Julio não comprou nada!"
  }
}

o_que_julio_comprou_d(8, 7)
o_que_julio_comprou_d(8, 9)
o_que_julio_comprou_d(12, 10)
