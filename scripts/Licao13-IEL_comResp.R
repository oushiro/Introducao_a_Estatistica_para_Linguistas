#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######          Lição 13: Regressão Linear Parte 2         ######
#################################################################

# O hashtag é o caractere de comentário. Tudo que é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (8%) Carregar pacote tidyverse
library(tidyverse)

# (9%) Carregar pacote car
library(car)

# (11%) Carregar pacote lme4
library(lme4)

# (12%) Carregar pacote lmerTest
library(lmerTest)

# (14%) Aplicar str() ao conjunto de dados VOGAL_e2.
str(VOGAL_e2)

### Modelos lineares multivariados ####

### (15%) Modelo com todas as variáveis previsoras
mod <- lm(F1.NORM ~ AMOSTRA + SEXO + F1.SEG.NORM + CONT.PREC + CONT.SEG, data = VOGAL_e2)

### (17%) Aplicar summary() a mod
summary(mod)

### Função step(): step forward
# (32%) Criar modelo 0, com nenhum variável
m0 <- lm(F1.NORM ~ 1, data = VOGAL_e2)

# (33%) Rodar step foward
m.fw <- step(m0, direction = "forward", scope = ~ AMOSTRA + SEXO + F1.SEG.NORM + CONT.PREC + CONT.SEG)

# (35%) Ver resultado de step forward
m.fw

### Função step(): step backward
# (36%) Rodar step backward
m.bw <- step(mod, direction = "backward")

# (39%) Ver resultado de step backward
m.bw

### Função step(): step both
# (41%) Rodar step both
m.both <- step(m0, scope = ~ AMOSTRA + SEXO + F1.SEG.NORM + CONT.PREC + CONT.SEG)

# (42%) Ver resultado de step both
m.both

### (45%) Função drop1()
drop1(mod, test = "F")

### (50%) Novo modelo linear sem variável SEXO
modelo <- lm(F1.NORM ~ F1.SEG.NORM + AMOSTRA + CONT.SEG + CONT.PREC, data = VOGAL_e2)

### Checagem de pressupostos ####

### (a) relação entre variável resposta e variável previsora numérica é linear?
# (56%) Aplicar função crPlot() (depende do pacote car)
crPlot(modelo, var = "F1.SEG.NORM")

# (58%) Retirar valores atípicos de F1.SEG.NORM
VOGAL_e3 <- filter(VOGAL_e2, F1.SEG.NORM < 500) 

VOGAL_e3 <- VOGAL_e2 %>% filter(F1.SEG.NORM < 500) 
VOGAL_e3 <- VOGAL_e2 %>% filter(., F1.SEG.NORM < 500) 

# (59%) Novo modelo linear
modelo2 <- lm(F1.NORM ~ AMOSTRA + F1.SEG.NORM + CONT.PREC + CONT.SEG, data = VOGAL_e3)

# (61%) Aplicar função crPlot() a modelo2
crPlot(modelo2, var = "F1.SEG.NORM")

### (65%) (b) Há multicolinearidade? (função vif() depende do pacote car)
vif(modelo2)

### (c) Resíduos têm distribuição normal?
# (68%) Aplicar summary() a modelo2
summary(modelo2)

# (71%) Verificar normalidade dos resíduos por meio de teste estatístico
shapiro.test(modelo2$residuals)

### (d) Observações são independentes? -- em dados linguísticos, quase nunca são! --> MODELOS DE EFEITOS MISTOS

### Criar modelo linear de efeitos mistos ###
# (82%) função lmer() depende dos pacotes lme4 e lmerTest
mod1.lmer <- lmer(F1.NORM ~ AMOSTRA + F1.SEG.NORM + CONT.PREC + CONT.SEG + (1|PARTICIPANTE) + (1|PALAVRA), data = VOGAL_e3)

# (83%) Aplicar summary() a mod1.lmer
summary(mod1.lmer)

# (86%) Função step backward
m.bw.lmer <- step(mod1.lmer, direction = "backward")

# (88%) Visualizar resultado do step backward
m.bw.lmer

### ~  Plotar estimativas do modelo: plot_model() ~ #### 
#https://cran.r-project.org/web/packages/sjPlot/vignettes/plot_model_estimates.html (requer pacote sjPlot); somente para efeitos fixos
library(sjPlot)

plot_model(mod, transform = NULL, show.values = T, value.offset = .3)

