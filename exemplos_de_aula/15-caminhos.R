# Caminhos até arquivos --------------------------------------------------

# Uma habilidade importante quando estamos analisando dados é 
# conseguir escrever os caminhos corretos até os arquivos.

# Por exemplo: caso a gente não consiga informar para o R o caminho
# da planilha que queremos ler, não conseguiremos abrir estes dados 
# no R para fazer as análises.

# O primeiro conceito importante neste momento é o de diretórios de trabalho.
# O diretório de trabalho, ou working directory, é a pasta no computador 
# onde o R está considerando como nosso "local de trabalho" atual.


# Quando trabalhamos com projetos no R (R projects), o diretório de trabalho
# é a pasta onde o arquivo .Rproj atual está salvo. Essa é uma grande vantagem
# de trabalhar com projetos!

# E quando não estamos em projetos? É possível ver (e mudar!) qual é o diretório
# de trabalho utilizado por padrão pelo RStudio no seu computador através
# do caminho:
# "Tools"(na barra de navegação superior) > "Global Options" > "General" >
# "Default working directory (when not in a project):" 

# Como saber qual o nosso diretório de trabalho atual?
getwd()

# Existem duas formas de informar para o R os caminhos até um arquivo ou pasta
# no computador: caminhos absolutos e relativos.

# Caminhos absolutos: são completos, partindo da "raíz" do computador.
"/home/william/Documents/Curso-R/main-r4ds-1/dados/imdb.csv"

# Caminhos relativos: são relativos ao  diretório de trabalho atual, partem dele.
"dados/imdb.csv"

# (cara(o) professora(o), favor lembrar de falar da dica 
# de navegação entre as aspas e a tecla tab)





# Lidando com arquivos


# A função list.files permite saber quais arquivos estão no diretório de trabalho,
# ou também em outros diretórios, e saber utilizar ela será muito útil!

list.files() # Lista os arquivos no diretório atual de trabalho (working directory)

list.files("dados/") # Usando caminho relativo, lista arquivos que estão na 
# pasta 'dados/' no projeto atual


list.files("/Users/") # Usando caminho absoluto, consigo navegar fora do meu 
# projeto e listar os arquivos presentes em outros locais do meu computador


# Essa função possui argumentos muito interessantes! por exemplo:

# o argumento pattern define qual extensão deseja pesquisar. 

list.files(pattern = ".csv")

# o argumento recursive, caso seja verdadeiro, também procurará arquivos nas pastas 
# que fazem parte da pasta que você está verificando
list.files(recursive = TRUE)

# o argumento full.names, caso seja verdadeiro, mantém o caminho relativo 
# completo até o arquivo.
list.files(full.names = TRUE)


# Podemos combinar estes argumentos também! No exemplo abaixo, queremos os arquivos
# na pasta dados, que tenham extensão '.csv', e queremos manter o caminho completo
# até esse arquivo.

arquivos <- list.files("dados", pattern = ".csv", full.names = TRUE) 

# Com esse vetor, com uso de outras funções, será possível abrir diversas tabelas
# (com a mesma estrutura) em uma única base no R com poucas linhas de código.



# Pacote fs ----------------

# O pacote fs tem como foco lidar com arquivos! A seguir mostraremos alguns 
# exemplos de uso onde este pacote foi útil.

 
# install.packages("fs") # instale caso seja necessário!
library(fs) # carregue o pacote para usar

# Exemplo 1: Quero criar uma pasta no meu projeto diretamente do R!
# obs: caso a pasta já exista, nada acontecerá.

fs::dir_create("exemplo_dir_create")


# Exemplo 2: Quero criar um arquivo diretamente do R!
# obs: caso a arquivo já exista, nada acontecerá.

fs::file_create("exemplo_file_create.R")

# Exemplo 3: Ver a estrutura do projeto no console: quais arquivos estão presentes?
# como estão organizados nas pastas?

fs::dir_tree()

# Exemplo 4: É possível copiar todos os arquivos de uma pasta para outra usando
# a função dir_copy(). O primeiro argumento é o caminho para  pasta a ser copiada,
# e o segundo argumento é o caminho para a nova pasta 
# (caso ela não exista, ela será criada).

fs::dir_copy("dados", "dados2")

# Exemplo 5: arruma os nomes dos arquivos de uma pasta

# Primeiro vamos criar uma pasta para fazer isso
fs::dir_create("pasta_com_arquivos_baguncados")

# Vamos criar dois arquivos como exemplo, com nomes escritos em caixa alta
fs::file_create("pasta_com_arquivos_baguncados/UM_ARQUIVO_COM_CAPS_LOCK.R")

fs::file_create("pasta_com_arquivos_baguncados/OUTRO_ARQUIVO_COM_CAPS_LOCK.R")

# Agora vamos criar vetores: com os nomes originais, e com os novos nomes
nomes_originais <- list.files("pasta_com_arquivos_baguncados/", full.names = TRUE) 

novos_nomes <- tolower(nomes_originais)  
# a função tolower() é usada para transformar letras maiúsculas em minúsculas

# usaremos a função file_move() para mover os arquivos com os caminhos originais, 
# para os caminhos com nomes corrigidos. 
fs::file_move(nomes_originais, novos_nomes)

# Exemplo 5: podemos também deletar os arquivos diretamente do R, usando a função
# file_delete()

fs::file_delete("pasta_com_arquivos_baguncados")
