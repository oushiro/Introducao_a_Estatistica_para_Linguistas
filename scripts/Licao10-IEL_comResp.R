#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######                  Lição 10: Teste-t                  ######
#################################################################

# O hashtag é o caractere de comentário. Tudo que é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


### (1%) Carregar pacotes necessários
library(tidyverse)

### Definir como diretório de trabalho pasta que contém arquivo Pretonicas.csv
# setwd()

### Carregar dados
pretonicas <- read_csv("Pretonicas.csv",
                       col_types = cols(.default = col_guess(),
                         AMOSTRA = col_factor(levels = c("PBSP", "SP2010")),
                         VOGAL = col_factor(levels = c("i", "e", "a", "o", "u"))
                       ))
### (3%) Inspecionar df
str(pretonicas)

# Criar subconjuntos de dados
# (4%) Vogal /e/ em PBSP
PBSP_e <- filter(pretonicas, VOGAL == "e" & AMOSTRA == "PBSP")

PBSP_e <- filter(pretonicas, AMOSTRA == "PBSP" & VOGAL == "e")
PBSP_e <- pretonicas %>% filter(VOGAL == "e" & AMOSTRA == "PBSP")
PBSP_e <- pretonicas %>% filter(AMOSTRA == "PBSP" & VOGAL == "e")
PBSP_e <- pretonicas %>% filter(., VOGAL == "e" & AMOSTRA == "PBSP")
PBSP_e <- pretonicas %>% filter(., AMOSTRA == "PBSP" & VOGAL == "e")

# (6%) Vogal /e/ em SP2010
SP2010_e <- filter(pretonicas, VOGAL == "e" & AMOSTRA == "SP2010")

SP2010_e <- filter(pretonicas, AMOSTRA == "SP2010" & VOGAL == "e")
SP2010_e <- pretonicas %>% filter(VOGAL == "e" & AMOSTRA == "SP2010")
SP2010_e <- pretonicas %>% filter(AMOSTRA == "SP2010" & VOGAL == "e")
SP2010_e <- pretonicas %>% filter(., VOGAL == "e" & AMOSTRA == "SP2010")
SP2010_e <- pretonicas %>% filter(., AMOSTRA == "SP2010" & VOGAL == "e")

# (7%) Vogal /e/ em ambas as amostras
VOGAL_e <- filter(pretonicas, VOGAL == "e")

VOGAL_e <- pretonicas %>% filter(VOGAL == "e")
VOGAL_e <- pretonicas %>% filter(., VOGAL == "e")

# (9%_) Visualizar distribuição dos dados em histograma
ggplot(df, aes(x = VAR)) +
  geom_histogram() + 
  facet_grid(VAR ~ .) 

ggplot(VOGAL_e, aes(x = F1.NORM)) +
  geom_histogram() + 
  facet_grid(AMOSTRA ~ .) 

### (10%_) Calcular médias e desvio padrão 
novo.df <- df %>%
  group_by(VAR) %>%
  summarize(media_F1 = funcao(VAR),
            desvio_F1 = funcao(VAR)) %>%
  print()

estatisticas <- VOGAL_e %>%
  group_by(AMOSTRA) %>%
  summarize(media_F1 = mean(F1.NORM),
            desvio_F1 = sd(F1.NORM)) %>%
  print()

### (14%_) Visualizar dispersão dos dados
df %>%
  ggplot(., aes(x = VAR, y = VAR)) +
  geometria() + 
  reverterEixo() 

VOGAL_e %>%
  ggplot(., aes(x = AMOSTRA, y = F1.NORM)) +
  geom_boxplot(notch = TRUE) + 
  scale_y_reverse() 
  
# Teste de Shapiro para checar normalidade da distribuição
### (21%) Teste de Shapiro para PSBP
shapiro.test(PBSP_e$F1.NORM)

### (23%) Teste de Shapiro para SP2010
shapiro.test(SP2010_e$F1.NORM)

# (24%*) Por curiosidade, também seria possível fazer esses cálculos com dplyr; neste caso, é necessário envolver a função do teste de Shapiro na função list(): 
shapiro <- pretonicas %>%
  filter(VOGAL == "e") %>%
  group_by(AMOSTRA) %>%
  summarize(res = list(shapiro.test(F1.NORM))) 

# (26%)
shapiro$res

### (34%) Teste-t nos dados de PBSP
t.test(PBSP_e$F1.NORM, mu = 440)

aa <- pretonicas %>%
  filter(VOGAL == "e" & AMOSTRA == "PBSP") %>%
  summarize(res = list(t.test(F1.NORM, mu = 440)))

# (43%) Cálculo do teste-t pela fórmula
(estatisticas$media_F1[1] - 440) / (estatisticas$desvio_F1[1] / sqrt(length(PBSP_e$F1.NORM)))

# (49%) Teste-t unidirecional, com alternative = less
t.test(PBSP_e$F1.NORM, mu = 440, alternative = "less")

### (51%) Teste de Wilcoxon nos dados de SP2010
wilcox.test(SP2010_e$F1.NORM, mu = 410)

### (53%) Teste de Wilcoxon nos dados de SP2010 com intervalo de confiança
wilcox.test(SP2010_e$F1.NORM, mu = 410, conf.int = T)

### (57%) Teste-t/Wilcoxon para todos os dados, começando pelo teste de Shapiro
shapiro.test(VOGAL_e$F1.NORM)

### (60%) Teste comparando as amostras
wilcox.test(F1.NORM ~ AMOSTRA, data = VOGAL_e, conf.int = T)

# (63%) Fazendo manualmente o cômputo da diferença entre média para PBSP e para SP2010
estatisticas$media_F1[1] - estatisticas$media_F1[2]

### (66%) Teste-t comparando as amostras (só para ver o output)
t.test(F1.NORM ~ AMOSTRA, data = VOGAL_e)

### (70%) Checar ordem dos níveis da variável AMOSTRA
levels(VOGAL_e$AMOSTRA)

### (71%) Teste de Wilcoxon direcional
wilcox.test(F1.NORM ~ AMOSTRA, data = VOGAL_e, conf.int = T, alternative = "greater")

### Teste-t pareado
# (77%) Visualizar conjunto de dados sleep
sleep

# (80%) Criar vetor com dados do primeiro grupo: g1
g1 <- sleep[1:10, 1]

# (81%) Criar vetor com dados do segundo grupo: g2
g2 <- sleep[11:20, 1]

# (83%) Aplicar teste de Shapiro a g1
shapiro.test(g1)

# (84%) Aplicar teste de Shapiro a g2
shapiro.test(g2)

# (86%) Aplicar teste-t pareado
t.test(g1, g2, paired = T)

# (87%) Comparação do resultado com teste não pareado
t.test(g1, g2)
