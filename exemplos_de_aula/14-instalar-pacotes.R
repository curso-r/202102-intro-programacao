# Instalar pacotes! -------------------

## Instalar pacotes do CRAN ------------

# É necessário usar a função 
# install.packages("nome_do_pacote") - USAR ASPAS!

install.packages("readr") # Não execute agora. 


## Instalar Pacotes do GitHub ----------

# Para isso, é necessário usar uma função do pacote
# devtools.
# Então primeiro é necessário instalar esse pacote:

install.packages("devtools")  # Não execute agora. 

# Depois use a função install_github(). 
# Você deve indicar entre aspas qual é o pacote 
# que quer instalar,
# sendo neste padrão: "organizacao/pacote"
# (o pacote pode "ser" de alguma pessoa também)

devtools::install_github("tidyverse/readr")  # Não execute agora. 

# https://github.com/tidyverse/readr

# Carregar pacotes --------------

# Use a função library(pacote), não é necessário 
# usar aspas.


library(readr)


# Atualizando pacotes --------

# Os pacotes são constantemente aprimorados, e novas versões são disponibilizadas
# ao longo do tempo.
# Para obter versões mais recentes de pacotes já instalados, é necessário
# atualizar os pacotes.
# É possível atualizar os pacotes utilizando código, 
# ou usando o RStudio.

# Com código
library(utils)
update.packages()


# Na interface gráfica do RStudio: 
# Na barra superior: Tools > "Check for package updates" > Selecione os pacotes 
# para atualizar > "Install updates"


