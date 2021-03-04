#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######            Lição 03: Tipos de Variáveis             ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (2%) Carregar o pacote tidyverse
library(tidyverse)

# (4%) Definir como diretório de trabalho a pasta que contém o arquivo DadosRT.csv.
setwd("~/Dropbox/_R/swirl/testes")

# (6%*) Carregar DadosRT.csv em um dataframe
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

# (12%) Visualizar estrutura do df `dados`
str(dados)

# (31%) Acessar os elementos da coluna FAIXA.ETARIA
dados$FAIXA.ETARIA

# (35%) Acessar o primeiro elemento da coluna FAIXA.ETARIA
dados$FAIXA.ETARIA[1]

# (51%) Aplicar função levels() à coluna FAIXA.ETARIA
levels(dados$FAIXA.ETARIA)

# (53%) Aplicar função lapply()
lapply(dados, levels)

# (55%) Mudar ordem dos níveis da variável FAIXA.ETARIA
dados$FAIXA.ETARIA <- fct_relevel(dados$FAIXA.ETARIA, sort)

# (59%) Mudar ordem dos níveis da variável ESCOLARIDADE
dados$ESCOLARIDADE <- fct_relevel(dados$ESCOLARIDADE, sort)

# (63%) Mudar ordem dos níveis da variável VD
dados$VD <- fct_relevel(dados$VD, "tepe")

# (65%) Mudar ordem dos níveis da variável ORIGEM.PAIS
dados$ORIGEM.PAIS <- fct_relevel(dados$ORIGEM.PAIS, "SPcapital")

# (71%*) Mudar ordem dos níveis da variável CONT.FON.PREC
dados$CONT.FON.PREC <- fct_relevel(dados$CONT.FON.PREC, "i", "e", "3", "a", "0", "o", "u")

# (75%) Mudar ordem dos níveis da variável ESTILO
dados$ESTILO <- fct_relevel(dados$ESTILO, "conversacao", "depoimento", "jornal", "palavras")

# (78%* e 82%) Definir níveis na importação dos dados
dados <- read_csv("DadosRT.csv", 
                   col_types = cols(.default = col_factor(),
                                    cont.precedente = col_character(),
                                    ocorrencia = col_character(),
                                    cont.seguinte = col_character(),
                                    IDADE = col_integer(),
                                    INDICE.SOCIO = col_double(),
                                    FREQUENCIA = col_double(),
                                    FAIXA.ETARIA = col_factor(levels = c("1a",  "2a", "3a")),
                                    ESCOLARIDADE = col_factor(levels = c("fundamental", "medio", "superior"))
                                    )
                   )

# (80%) Checar se os níveis de FAIXA.ETARIA foram definidos corretamente na importação
levels(dados$FAIXA.ETARIA)

# (92%*) Amalgamar níveis da variável CONT.FON.SEG
dados$CONT.FON.SEG_PC <- fct_collapse(dados$CONT.FON.SEG,
                                   coronal = c("ts", "dz", "t", "d", "n", "s", "z", "x", "j", "l"),
                                   dorsal = c("k", "g", "h"),
                                   labial = c("f", "v", "p", "b", "m"),
                                   pausa = "#"
                                    )

# (96%_) Amalgamar níveis da variável CONT.FON.PREC de acordo com altura
dados$CONT.FON.PREC_altura <- fct_collapse(vetor,
                                           novoFator = c(),
                                           novoFator = c()
)

dados$CONT.FON.PREC_altura <- fct_collapse(dados$CONT.FON.PREC,
                                           alta = c("i", "e", "u", "o"),
                                           baixa = c("3", "a", "0")
                                           )


