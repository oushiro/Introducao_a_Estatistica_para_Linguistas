#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######   Lição 02: Manipulação de Vetores e Dataframes     ######
#################################################################

# O hashtag é o caractere de comentário. Tudo que é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (8%) Carregar pacote tidyverse
library(tidyverse)

# (10%*) Acessar o terceiro elemento do vetor `aleatorio`.
aleatorio[3]

# (12%) Acessar o décimo quinto elemento do vetor `numeros`.
numeros[15]

# (16%) Acessar o elemento x do vetor `numeros`.
numeros[x]

# (20%) Acessar o primeiro e o terceiro elementos do vetor `aleatorio`.
aleatorio[c(1, 3)]

# (22%) Acessar todos os elementos, exceto o segundo, do vetor `numeros`.
numeros[-2]

# (28%) Visualizar o tibble do dataframe `dados`.
dados

# (30%) Aplicar a função View() a `dados`.
View(dados)

# (34%) Visualizar o número de colunas - ncol() - de `dados`.
ncol(dados)

# (36%) Visualizar o número de linhas - nrow() - de `dados`.
nrow(dados)

# (38%) Visualizar a estrutura de um dataframe - str()
str(dados)

# (42%) Visualizar o resumo de um objeto - summary()
summary(dados)

# (50%*) Acessar elemento na linha 5, coluna 6 de dados
dados[5, 6]

# (52%) Acessar o elemento na linha 11, coluna 4 de dados
dados[11, 4]

# (54%) Acessar os elementos das linhas 1 a 10, coluna 9 de dados
dados[1:10, 9]

# (56%) Acessar os elementos de uma linha: deixar o índice para coluna vazio
dados[3, ]

# (58%) Acessar os elementos de uma coluna: deixar o índice para linha vazio
dados[, 10]

# (60%) Acessar os elementos de uma coluna pelo nome: $
dados$CONT.FON.PREC

# (66%) Criar subconjunto de dados com filter(): somente dados de tonicas
dados_tonicas <- filter(dados, TONICIDADE == "tonica")

# (68%) Criar subconjunto de dados: somente dados em sílabas atonas
dados_atonas <- filter(dados, TONICIDADE == "atona")

# (70%) Criar subconjunto de dados: sem /r/ em morf.inf
dados_semInf <- filter(dados, CLASSE.MORFOLOGICA !=  "morf.inf")

# (72%) Criar subconjunto de dados: sem conversacao (só leituras)
dados_leitura <- filter(dados, ESTILO !=  "conversacao")

# (74%) Criar subconjunto de dados: palavras com frequência menor do que 2
dados_menor2 <- filter(dados, FREQUENCIA < 2)

# (76%) Criar subconjunto de dados: palavras com frequência menor ou igual a 2
dados_menor_igual2 <- filter(dados, FREQUENCIA <= 2)

# (80%) Criar subconjunto de dados de palavras com /r/ em sílaba tônica e final
dados_tonica_final <- filter(dados, TONICIDADE == "tonica" & POSICAO.R == "final")

# (86%) Criar subconjunto de dados de palavras com /r/ em sílaba tônica ou em sílaba final
dados_tonica_ou_final <- filter(dados, TONICIDADE == "tonica" | POSICAO.R == "final")

# (90%) Criar novo subconjunto de dados com as variáveis SEXO.GENERO, IDADE, ESCOLARIDADE e REGIAO.
dados_varsociais1 <- select(dados, SEXO.GENERO, IDADE, ESCOLARIDADE, REGIAO)

# (92%) Criar novo subconjunto de dados desde a variável SEXO.GENERO até a variável REGIAO.
dados_varsociais2 <- select(dados, SEXO.GENERO:REGIAO)
