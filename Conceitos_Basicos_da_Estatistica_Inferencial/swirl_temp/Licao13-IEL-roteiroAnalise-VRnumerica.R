#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######      Roteiro para Análise de Variáveis Numéricas    ######
#################################################################

### Preliminares: carregar pacotes e dados; ajustar dados ####
### Carregar pacotes necessários
library(tidyverse)
library(effects)
library(car)
library(lme4)
library(lmerTest)

### Definir diretório de trabalho ####
#setwd("~/Dropbox/_R/swirl/Introducao_a_Estatistica_para_Linguistas/data")

### Carregar dados ####
pretonicas <- read_csv("Pretonicas.csv",
                       col_types = cols(.default = col_factor(),
                                        VOGAL = col_factor(levels = c("i", "e", "a", "o", "u")),
                                        F1 = col_double(),
                                        F2 = col_double(),
                                        F1.NORM = col_double(),
                                        F2.NORM = col_double(),
                                        F1.SIL.SEG = col_double(),
                                        F2.SIL.SEG = col_double(),
                                        F1.SEG.NORM = col_double(),
                                        F2.SEG.NORM = col_double(),
                                        DIST.TONICA = col_double(),
                                        Begin.Time.s = col_double(),
                                        End.Time.s = col_double(),
                                        Duration.ms = col_double(),
                                        IDADE = col_integer(),
                                        IDADE.CHEGADA = col_integer(),
                                        ANOS.SP = col_integer()
                       )
)

### Ajustar dados ####
pretonicas$CONT.PREC <-  fct_collapse(pretonicas$CONT.PREC,
                                      dental.alveolar = c("t", "d", "n", "l"),
                                      labial = c("p", "b", "m", "f", "v"),
                                      palatal.sibilante = c("S", "Z", "L", "s", "z"),
                                      velar = c("k", "g"),
                                      vibrante = c("h", "R")
)

pretonicas$CONT.PREC <- fct_relevel(pretonicas$CONT.PREC, "dental.alveolar", "labial", "palatal.sibilante", "velar", "vibrante")

pretonicas$CONT.SEG <- fct_collapse(pretonicas$CONT.SEG,
                                    dental.alveolar = c("t", "d", "n", "l"),
                                    labial = c("p", "b", "m", "f", "v"),
                                    palatal.sibilante = c("S", "Z", "L", "N", "s", "z"),
                                    velar = c("k", "g"),
                                    vibrante = c("r", "h", "R")
)

pretonicas$CONT.SEG <- fct_relevel(pretonicas$CONT.SEG, "dental.alveolar", "labial", "palatal.sibilante", "velar", "vibrante")

### Subconjuntos de dados ####
VOGAL_e <- filter(pretonicas, VOGAL == "e") %>%
  droplevels()

PBSP_e <- filter(pretonicas, VOGAL == "e" & AMOSTRA == "PBSP")

SP2010_e <- filter(pretonicas, VOGAL == "e" & AMOSTRA == "SP2010")

### Checar dados 
str(VOGAL_e)
#View(VOGAL_e)
str(PBSP_e)
str(SP2010_e)

### Análises descritivas e univariadas ####
#Cálculo de média, mediana, desvio padrão
pretonicas %>%
  group_by(VOGAL, AMOSTRA) %>%
  summarize(media_F1 = mean(F1.NORM),
            mediana_F1 = median(F1.NORM),
            sd_F1 = sd(F1.NORM)) 

# Espaços vocálicos de PBSP e SP2010
ggplot(medias, aes(x = media_F2, y = media_F1, color = AMOSTRA, label = VOGAL)) +
  geom_line() + 
  geom_label() +
  scale_x_reverse() + 
  scale_y_reverse() +
  ggtitle("Valores médios de F1 e F2 normalizados nas amostras PBSP e SP2010") + 
  labs(x = "F2 normalizado", y = "F1 normalizado") + 
  theme_bw()

### F1.NORM ~ AMOSTRA (vogal /e/)
#Teste-t
# Checar normalidade da distribuição com Teste de Shapiro
shapiro.test(PBSP_e$F1.NORM)
shapiro.test(SP2010_e$F1.NORM)
# t.test(F1.NORM ~ AMOSTRA, data = VOGAL_e)
wilcox.test(F1.NORM ~ AMOSTRA, data = VOGAL_e, conf.int = T)

### Outras vogais?... Outras variáveis previsoras?...

# Gráfico de dispersão das medições de F1 e F2 normalizados em PBSP e SP2010
ggplot(pretonicas, aes(x = F2.NORM, y = F1.NORM, color = VOGAL)) + 
  geom_point() + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  facet_grid(. ~ AMOSTRA) + 
  ggtitle("Dispersão das medidas de F1 e F2 normalizados nas amostras PBSP e SP2010") + 
  labs(x = "F2 normalizado", y = "F1 normalizado") + 
  theme_bw()

# Boxplots das medidas de F1.NORM por VOGAL e por AMOSTRA
ggplot(pretonicas, aes(x = AMOSTRA, y = F1.NORM, color = VOGAL)) +
  geom_boxplot(notch = TRUE) +
  scale_y_reverse() + 
  labs(x = "Amostra", y = "F1 normalizado") +
  facet_grid(. ~ VOGAL) + 
  theme_bw() 

# Histograma das medições de F1.NORM das cinco vogais dos dados de PBSP e SP2010
ggplot(pretonicas, aes(x = F1.NORM, fill = AMOSTRA)) +
  geom_histogram(binwidth = 10, position = "identity", alpha = 0.4) +
  labs(x = "F1 normalizado", y = "Frequência") + 
  facet_grid(VOGAL ~ .) +
  theme_bw() 

# Scatterplot de F1.NORM por F1.SEG.NORM
ggplot(VOGAL_e, aes(x = F1.SEG.NORM, y = F1.NORM)) + 
  geom_point() +
  scale_y_reverse() + 
  facet_grid(. ~ AMOSTRA) +
  geom_smooth(method = "lm", se = TRUE, color = "lightgrey")

#Teste de correlação de Pearson
# Checar normalidade das distribuições com Teste de Shapiro
shapiro.test(VOGAL_e$F1.NORM)
shapiro.test(VOGAL_e$F1.SEG.NORM)

cor.test(VOGAL_e$F1.NORM, VOGAL_e$F1.SEG.NORM, method = "spearman") # para distribuição não normal - teste não paramétrico

#Modelo de regressão linear
mod <- lm(F1.NORM ~ F1.SEG.NORM, data = VOGAL_e)
summary(mod)
plot(effect("F1.SEG.NORM", mod), grid = T, ylim = c(460, 410))

### Análises multivariadas ####

### Modelo de regressão linear ####
mod <- lm(F1.NORM ~ AMOSTRA + SEXO + F1.SEG.NORM + CONT.PREC + CONT.SEG, data = VOGAL_e2)
summary(mod)

### Função step() ####
m0 <- lm(F1.NORM ~ 1, data = VOGAL_e2)
m.fw <- step(m0, direction = "forward", scope = ~ AMOSTRA + SEXO + F1.SEG.NORM + CONT.PREC + CONT.SEG)
m.fw

m.bw <- step(mod, direction = "backward")
m.bw

m.both <- step(m0, scope = ~ AMOSTRA + SEXO + F1.SEG.NORM + CONT.PREC + CONT.SEG)
m.both

### Função drop1() ####
drop1(mod, test = "F")

### Novo modelo linear sem variável SEXO
modelo <- lm(F1.NORM ~ F1.SEG.NORM + AMOSTRA + CONT.SEG + CONT.PREC, data = VOGAL_e2)
summary(modelo)

### Checagem de pressupostos ####

### (a) relação entre variável resposta e variável previsora numérica é linear?
# Aplicar função crPlot() (depende do pacote car)
crPlot(modelo, var = "F1.SEG.NORM") # valores atípicos F1.SEG.NORM > 500Hz

VOGAL_e3 <- filter(VOGAL_e2, F1.SEG.NORM < 500) 

# Novo modelo linear
modelo2 <- lm(F1.NORM ~ AMOSTRA + F1.SEG.NORM + CONT.PREC + CONT.SEG, data = VOGAL_e3)
summary(modelo2)
crPlot(modelo2, var = "F1.SEG.NORM")

### (b) Há multicolinearidade? (função vif() depende do pacote car)
vif(modelo2)

### (c) Resíduos têm distribuição normal?
shapiro.test(modelo2$residuals)

### (d) Observações são independentes? -- em dados linguísticos, quase nunca são! --> MODELOS DE EFEITOS MISTOS

### Criar modelo linear de efeitos mistos ###
# função lmer() depende dos pacotes lme4 e lmerTest
mod1.lmer <- lmer(F1.NORM ~ AMOSTRA + F1.SEG.NORM + CONT.PREC + CONT.SEG + (1|INFORMANTE) + (1|PALAVRA), data = VOGAL_e3)
summary(mod1.lmer)

# Função step backward
m.bw.lmer <- step(mod1.lmer, direction = "backward")
m.bw.lmer

### ~  Plotar estimativas do modelo: plot_model() ~ #### 
#https://cran.r-project.org/web/packages/sjPlot/vignettes/plot_model_estimates.html (requer pacote sjPlot); somente para efeitos fixos
library(sjPlot)

plot_model(mod, transform = NULL, show.values = T, value.offset = .3)

