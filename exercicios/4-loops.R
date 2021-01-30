# 1. Quando programamos o despertador do nosso
# celular para acordar de manhã, estamos, 
# internamente, programando um laço (for) para 
# que uma mesma tarefa (despertar) seja
# executada várias vezes.

# Vamos imaginar que todos os dias o nosso 
# celular verifica se ele precisa despertar 
# às 8 horas da manhã. Se quisermos acordar
# todos os dias nesse horário, isso poderia ser
# representado, no R, pelo seguinte código

dias_da_semana <- c("seg", "ter", "qua", "qui", "sex", "sab", "dom")

for (dia in dias_da_semana) {
  mensagem <- paste0("8 horas da manhã de ", dia, "! Hora de acordar!")
  print(mensagem)
  beepr::beep(1)
  Sys.sleep(1)
}

# O comando Sys.sleep(1) faz o R esperar
# 1 segundo antes de continuar executando
# o código. (Esse 1 segundo representa
# no nosso exemplo as 24 horas entre dois dias.)

# a) Complete o código abaixo para 
# fazer o nosso despertador não "tocar" no
# fim de semana.

dias_da_semana <- c("seg", "ter", "qua", "qui", "sex", "sab", "dom")

for (dia in dias_da_semana) {
  if (..........) {
    mensagem <- paste0("8 horas da manhã de ", dia, "! Hora de acordar!")
    print(mensagem)
    beepr::beep(1)
    Sys.sleep(1)
  }
}

# b) Complete o código abaixo para fazer
# o nosso despertador iterar (caminhar) no 
# dia do mês e não mais no dia da semana.
# Pode considerar que todo mês tem 30 dias.


dias_do_mes <- ..........

for (dia in ..........) {
  mensagem <- paste0("8 horas da manhã de ", ..........)
  print(mensagem)
  beepr::beep(1)
  Sys.sleep(1)
}