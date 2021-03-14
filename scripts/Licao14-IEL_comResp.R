#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######         Lição 14: Regressão Logística Parte 1       ######
#################################################################

# O hashtag é o caractere de comentário. Tudo que é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


### (3%) Carregar pacote tidyverse
library(tidyverse)

### (4%) Carregar pacote car
library(car)

### (6%) Carregar pacote effects
library(effects)

### (7%) Carregar pacote rms
library(rms)

### Definir diretório de trabalho
setwd("~/Dropbox/_R/swirl/Introducao_a_Estatistica_para_Linguistas/data")

### Carregar arquivo DadosRT.csv
dados <- read_csv("DadosRT.csv", 
                  col_types = cols(.default = col_factor(),
                                   VD = col_factor(levels = c("tepe", "retroflexo")),
                                   FAIXA.ETARIA = col_factor(levels = c("1a", "2a", "3a")),
                                   REGIAO = col_factor(levels = c("central", "periferica")),
                                   CONT.FON.PREC = col_factor(levels = c("i", "e", "3", "a", "0", "o", "u")),
                                   TONICIDADE = col_factor(levels = c("atona", "tonica")),
                                   POSICAO.R = col_factor(levels = c("final", "medial")),
                                   CLASSE.MORFOLOGICA = col_factor(levels = c("adjetivo", "adverbio", "conj.prep", "morf.inf", "substantivo", "verbo")),
                                   IDADE = col_integer(),
                                   INDICE.SOCIO = col_double(),
                                   FREQUENCIA = col_double()
                                   )
                  )

dados$CONT.FON.SEG <- fct_collapse(dados$CONT.FON.SEG,
                                   pausa = "#",
                                   coronal = c("t", "d", "s", "z", "x", "j", "ts", "dz", "l", "n"),
                                   labial = c("p", "b", "f", "v", "m"),
                                   dorsal = c("k", "g", "h")
                                   )

dados$CONT.FON.SEG <- fct_relevel(dados$CONT.FON.SEG, "pausa", "coronal", "dorsal", "labial")

### (8%) Checar estrutura do dataframe
str(dados)

# (10%) Visualizar a planilha
View(dados)

# (14%) Visualizar níveis da VD: resultados da regressão logística referem-se ao segundo nível
levels(dados$VD)

### Modelos de regressão logística ####
#(com poucas variáveis apenas para treinamento da leitura dos resultados! idealmente, você quer fazer uma análise MULTIvariada!)

### 1 VP nominal/binária ####
# (17%) Fazer mod1
mod1 <- glm(VD ~ SEXO.GENERO, data = dados, family = binomial)

### (18%) Aplicar summary() a mod1
summary(mod1)

# (22%_) Excursus... como calcular logodds ####
df %>%
  count(VAR, VAR) %>%
  print()

dados %>%
  count(SEXO.GENERO, VD) %>%
  print()

# ... da tabela de frequências acima:
# (24%) odds para mulheres
odds_F <- 3478 / 1087

# (25%) odds para homens
odds_M <- 3137 / 1524

# (26%) odds-ratio
odds_ratio <- odds_F / odds_M 

# (28%) logodds
log(odds_ratio) 

# Ver Gries (2013:300) -- figura transformações odds, logodds, probabilidades
# Transformar logodds em probabilidades: ilogit()
# (36%) probabilidade para homens de usar retroflexo
ilogit(-0.7219327)
ilogit(-1.16304 + 0.4411073) 

# (38%) probabilidade para mulheres de usar retroflexo
ilogit(-1.16304) 

# (39%) Comparar com tabela de proporções!
df %>%
  count(VAR, VAR) %>%
  group_by(VAR) %>%
  mutate(prop = prop.table(n)) %>%
  print()

dados %>%
  count(SEXO.GENERO, VD) %>%
  group_by(SEXO.GENERO) %>%
  mutate(prop = prop.table(n)) %>%
  print()

###### fim de excursus ###########

# (44%) Aplicar summary() a mod1 novamente
summary(mod1)

### (53%) Gráfico de efeitos de mod1
plot(allEffects(mod1), type = "response")

# Outro modelo logístico: função lrm() -- gera medidas estatísticas úteis
# (56%) função lrm() depende do pacote rms
lrm(VD ~ SEXO.GENERO, data = dados) 

# 1 VP mais de 2 fatores ####
# (60%) Fazer mod2
mod2 <- glm(VD ~ FAIXA.ETARIA, data = dados, family = binomial)

# (61%) Aplicar summary() a mod2
summary(mod2)

# (64%) Gráfico de efeitos de mod2
plot(allEffects(mod2), type = "response")

# (67%) Regressão logística com lrm()
lrm(VD ~ FAIXA.ETARIA, data=dados)

# 1 VP numérica ####
# (68%) Fazer mod3
mod3 <- glm(VD ~ INDICE.SOCIO, data = dados, family = binomial)

# (69%) Aplicar summary() a mod3
summary(mod3)

# (72%) Gráfico de efeitos de mod3
plot(allEffects(mod3), type = "response")

# (75%) Cálculo de probabilidades/logodds: falante com INDICE.SOCIO = 4.2
1.53407 + (-0.81609 * 4.2) 

# (76%) Aplicar função ilogit() ao resultado acima
ilogit(-1.893508)

# (78%) Regressão logística com lrm()
lrm(VD ~ INDICE.SOCIO, data=dados)

# 2 VPs nominais ####
# (79%) Fazer mod4
mod4 <- glm(VD ~ FAIXA.ETARIA + REGIAO, data = dados, family = binomial)

# (81%) Aplicar summary() a mod4
summary(mod4)

# (83%) Gráfico de efeitos de mod4
plot(allEffects(mod4), type = "response")

# (85%) Regressão logística com lrm()
lrm(VD ~ FAIXA.ETARIA + REGIAO, data=dados)

## Interação ####
# (88%) Fazer mod5
mod5 <- glm(VD ~ FAIXA.ETARIA * REGIAO, data = dados, family = binomial)

# (89%) Aplicar summary() a mod5
summary(mod5)

# Cálculo de probabilidades/logodds
# (92%) falante de 1a faixa etária que mora na periferia
-1.31754 + 1.33476 

# (93%) falante de 2a faixa etária que mora na periferia
-1.31754 -0.10887 + 1.33476 -0.69440 

# (94%) Gráfico de efeitos de mod5
plot(allEffects(mod5), type = "response")

# (97%) Regressão logística com lrm()
lrm(VD ~ FAIXA.ETARIA * REGIAO, data=dados)

#### ~ Visualizar resultados com gráfico de efeitos com ggplot2 ~ ####
library(gridExtra)

# Extrair dados do modelo: mod1, com SEXO.GENERO
gref <- as.data.frame(effect('SEXO.GENERO', mod1, se=TRUE, confidence.level=.95))
gref
# Plotar gráfico de efeitos
ggplot(gref, aes(x = SEXO.GENERO, y= fit)) + 
  geom_point() + 
  geom_errorbar(aes(ymin = lower, ymax = upper), color = "black", width = .3) 

# Extrair dados do modelo: mod, com FAIXA.ETARIA
gref <- as.data.frame(effect('FAIXA.ETARIA', mod2, se=TRUE, confidence.level=.95))
gref
# Plotar gráfico de efeitos
ggplot(gref, aes(x = FAIXA.ETARIA, y= fit)) + 
  geom_point() + 
  geom_errorbar(aes(ymin = lower, ymax = upper), color = "black", width = .3) 

# Extrair dados do modelo: mod3, com INDICE.SOCIO
gref <- as.data.frame(effect('INDICE.SOCIO', mod3, se=TRUE, confidence.level=.95))
gref
# Plotar gráfico de efeitos
ggplot(gref, aes(x = INDICE.SOCIO, y= fit)) + 
  geom_smooth(method = "lm", se = TRUE, color = "lightgrey") 

# Extrair dados do modelo: mod4: duas variáveis nominais: um para cada variável
gref1 <- as.data.frame(effect("FAIXA.ETARIA", mod4, se=TRUE, confidence.level=.95))
gref1
gref2 <- as.data.frame(effect("REGIAO", mod4, se=TRUE, confidence.level=.95))
gref2
# Plotar gráfico de efeitos
p1 <- ggplot(gref1, aes(x = FAIXA.ETARIA, y= fit)) + 
  geom_point() + 
  geom_errorbar(aes(ymin = lower, ymax = upper), color = "black", width = .3) 
p2 <- ggplot(gref2, aes(x = REGIAO, y= fit)) + 
  geom_point() + 
  geom_errorbar(aes(ymin = lower, ymax = upper), color = "black", width = .3) 
grid.arrange(p1, p2, ncol=2)

# Extrair dados do modelo: mod5: para uma interação, passos são como para uma variável
gref <- as.data.frame(effect("FAIXA.ETARIA * REGIAO", mod5, se=TRUE, confidence.level=.95))
gref
# Plotar gráfico de efeitos
ggplot(gref, aes(x = FAIXA.ETARIA, y= fit)) + 
  geom_point() + 
  geom_errorbar(aes(ymin = lower, ymax = upper), color = "black", width = .3) +
  facet_grid(. ~ REGIAO)

### ~ Funções usadas nesta lição ~ ##
# Essas funções não existem na instalação base do R nem em outros pacotes
# de Gries 2013
logit <- function(x) { # logit: maps the range (0,1) to the range -infinite to + infinite)
  log(x/(1-x)) # Gelman & Hill (2007:80)
}

ilogit <- function(x) { # inverse logit: maps the range (-∞,∞) to the range (0,1)
  1/(1+exp(-x)) # Gelman & Hill (2007:80)
}


