#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######      Lição 06: Medidas de Tendências Centrais       ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (3%) Inspecionar notas da turma A
notas_turmaA

# (5%) Inspecionar notas da turma B
notas_turmaB

# (6%) Calcular a média da turma A com as funções sum() e length()
sum(notas_turmaA) / length(notas_turmaA)

# (8%) Calcular a média da turma B com as funções sum() e length()
sum(notas_turmaB) / length(notas_turmaB)

# (10%) Calcular a média da turma A
mean(notas_turmaA)

# (11%) Calcular a média da turma B
mean(notas_turmaB)

# (16%) Colocar as notas da turma A em ordem crescente
sort(notas_turmaA)

# (17%) Colocar as notas da turma B em ordem crescente
sort(notas_turmaB)

# (19%) Calcular a mediana da turma A
median(notas_turmaA)

# (21%) Calcular a mediana da turma B
median(notas_turmaB)

# (24%) Calcular a moda da turma A
Mode(notas_turmaA)

# (25%) Calcular a moda da turma B
Mode(notas_turmaB)

# (38%) Acrescentar um zero a notas_turmaA
notas_turmaA2 <- c(notas_turmaA, 0)

# (40%) Acrescentar um zero a notas_turmaB
notas_turmaB2 <- c(notas_turmaB, 0)

# (41%) Recalcular a média da turma A (notas_turmaA2)
mean(notas_turmaA2)

# (43%) Recalcular a média da turma B (notas_turmaB2)
mean(notas_turmaB2)

# (51%) Calcular a variância da turma A
var(notas_turmaA)

# (52%) Calcular a variância da turma B
var(notas_turmaB)

# (56%) Calcular desvio padrão da turma A
sd(notas_turmaA)

# (57%) Calcular desvio padrão da turma B
sd(notas_turmaB)

# (60%) Calcular erro padrão da turma A 
sd(notas_turmaA) / sqrt(length(notas_turmaA))

# (62%) Calcular erro padrão da turma B 
sd(notas_turmaB) / sqrt(length(notas_turmaB))

# (67%) Definir novo diretório de trabalho para cópia da planilha Pretonicas.csv
setwd("~/Dropbox/_R/swirl/arquivosDados")

# (70%) Carregar pacote tidyverse
library(tidyverse)

# (71%) Carregar dados da planilha Pretonicas.csv no df `pretonicas`
pretonicas <- read_csv("Pretonicas.csv",
                       col_types = cols(
                         AMOSTRA = col_factor(levels = c("PBSP", "SP2010")),
                         VOGAL = col_factor(levels = c("i", "e", "a", "o", "u"))
                       ))

# (73%) Checar estrutura do df pretonicas
str(pretonicas)

# (75%) Aplicar função summary() a pretonicas
summary(pretonicas)

# (89%_) Calcular média dos valores de F1 por AMOSTRA e VOGAL
df %>%
  group_by(VAR, VAR) %>%
  summarize(nomeVar = mean(VAR)) 

pretonicas %>%
  group_by(AMOSTRA, VOGAL) %>%
  summarize(media_F1 = mean(F1)) 

# (92%) Calcular média dos valores de F1 por VOGAL e AMOSTRA
pretonicas %>%
  group_by(VOGAL, AMOSTRA) %>%
  summarize(media_F1 = mean(F1)) 

# (95%) Calcular média, mediana e desvio padrão dos valores de F1 por AMOSTRA + VOGAL
pretonicas %>%
  group_by(VOGAL, AMOSTRA) %>%
  summarize(media_F1 = mean(F1),
            mediana_F1 = median(F1),
            sd_F1 = sd(F1)) 

