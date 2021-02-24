# 1. Considere o vetor booleano abaixo:
dolar_subiu <- c(TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE)

# Este vetor tem informação de uma semana (7 dias) indicando se o dolar subiu (TRUE)
# (ou não subiu - FALSE) no respectivo dia. Interprete os números abaixo:

# (a) length(dolar_subiu)

length(dolar_subiu)

# A função length retorna o tamanho do vetor. 
# O vetor 'dolar_subiu' possui 7 elementos.


# (b) dolar_subiu[2]  (ps: a semana começa no domingo)

dolar_subiu[2]

# O segundo elemento selecionado representa a segunda-feira.
# Na segunda-feira, o dolar subiu (TRUE).

# (c) sum(dolar_subiu)

sum(dolar_subiu)

# A função sum() realiza a soma dos elementos do vetor.
# Como o vetor possui dados do tipo lógico (TRUE ou FALSE), o R entende que TRUE = 1 e FALSE = 0.
# O resultado de sum(dolar_subiu) é 4, portanto o dólar subiu em 4 dias na semana. 


# (d) mean(dolar_subiu)

mean(dolar_subiu)

# A função sum() realiza a média dos elementos do vetor.
# O resultado representa a média de dias em que o dólar subiu.


# Agora observe a saída de as.numeric(dolar_subiu). O que o R fez?

as.numeric(dolar_subiu)

# A função as.numeric() transforma um vetor em numérico (quando possível).
# No vetor que o R retornou, TRUE foi transformado em 1, e FALSE foi transformado em 0.