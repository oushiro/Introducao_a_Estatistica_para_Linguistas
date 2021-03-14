#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######                Lição 01: Fundamentos                ######
#################################################################

# O hashtag é o caractere de comentário. Tudo que é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (3%) R como calculadora: somar 4 + 9
4 + 9

# (11%) Criar a variável x, que contém o resultado de 4 + 9
x <- 4 + 9

# (13%) Visualizar `x`
x

# (17%) Quanto é x + 10?
x + 10

# (18%) Criar a variável y, que contém o resultado de x + 10
y <- x + 10

# (20%) Visualizar `y`
y

# (26%) Criar a variável z, que contém os caracteres "gato"
z <- "gato"

# (27%) Visualizar `z`
z

# (39%) Usar função c(): c(1, 5, 7)
c(1, 5, 7)

# (41%) Criar vetor `aleatorio` com os valores x, y e 230.
aleatorio <- c(x, y, 230)

# (42%) Visualizar `aleatorio`
aleatorio

# (47%) Acessar a Ajuda do R: ?funcao
?c

# (50%) Criar vetor `numeros`, com os números de 20 a 39, usando operador :
numeros <- c(20:39)

# (52%) Visualizar `numeros`
numeros

# (58%) Descobrir qual é o diretório de trabalho atual
getwd()

# (70%) Definir novo diretório de trabalho
setwd("~/Dropbox/_R/swirl/testes")

# (77%) Acessar pacote tidyverse
library(tidyverse)

# (82%*) Importar arquivo de dados DadosRT.csv
dados <- read_csv("DadosRT.csv", 
                  col_types = cols(.default = col_factor(),
                                   cont.precedente = col_character(),
                                   ocorrencia = col_character(),
                                   cont.seguinte = col_character(),
                                   IDADE = col_integer(),
                                   INDICE.SOCIO = col_double(),
                                   FREQUENCIA = col_double()
                                   )
                  )

# (86%) Acessar ajuda da função read_csv
?read_csv

# (94%) Visualizar `dados`
dados

