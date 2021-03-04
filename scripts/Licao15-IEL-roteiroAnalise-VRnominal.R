#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
###### Roteiro para Análise de Variáveis Nominais Binárias ######
#################################################################

### Preliminares: carregar pacotes e dados; ajustar dados ####
### Carregar pacotes necessários ####
library(rms)
library(effects)
library(car)
library(lme4)
library(lmerTest)

### Definir diretório de trabalho ####
# setwd("~/Dropbox/_R/swirl/Introducao_a_Estatistica_para_Linguistas/data")

### Carregar dados ####
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

### Ajustar dados ####
dados$CONT.FON.SEG <- fct_collapse(dados$CONT.FON.SEG,
                                   pausa = "#",
                                   coronal = c("t", "d", "s", "z", "x", "j", "ts", "dz", "l", "n"),
                                   labial = c("p", "b", "f", "v", "m"),
                                   dorsal = c("k", "g", "h")
)

dados$CONT.FON.SEG <- fct_relevel(dados$CONT.FON.SEG, "pausa", "coronal", "dorsal", "labial")

### Checar dados ####
str(dados)
View(dados)

### Análises descritivas e univariadas ####
# VD ###
dados %>%
  count(VD) %>%
  mutate(prop = prop.table(n))

# VD ~ SEXO.GENERO ####   
tab.prop.SEXO.GENERO <- dados %>% 
  count(SEXO.GENERO, VD) %>%
  group_by(SEXO.GENERO) %>%
  mutate(prop = prop.table(n)) %>%
  print()

ggplot(tab.prop.SEXO.GENERO, aes(x = SEXO.GENERO, y = prop * 100, fill = VD)) + 
  geom_bar(stat = "identity", color = "black") + 
  ggtitle("Proporção das variantes de /r/ por Sexo/Gênero do falante") +
  labs(x = "Sexo", y = "Proporção", fill = "Variantes de /r/") + 
  scale_x_discrete(labels = c("feminino", "masculino")) + 
  scale_fill_brewer(palette = "Purples", labels = c("tepe", "retroflexo")) + 
  theme_bw()

tab.SEXO.GENERO <- with(dados, table(SEXO.GENERO, VD)); tab.SEXO.GENERO
prop.SEXO.GENERO <- with(dados, prop.table(tab.SEXO.GENERO) * 100); prop.SEXO.GENERO

chisq.test(tab.SEXO.GENERO)
mod <- glm(VD ~ SEXO.GENERO, data = dados, family = binomial)
summary(mod)
plot(allEffects(mod), type = "response")

# VD ~ FAIXA.ETARIA ####
tab.prop.FAIXA.ETARIA <- dados %>% 
  count(FAIXA.ETARIA, VD) %>%
  group_by(FAIXA.ETARIA) %>%
  mutate(prop = prop.table(n)) %>%
  print()

ggplot(tab.prop.FAIXA.ETARIA, aes(x = FAIXA.ETARIA, y = prop * 100, fill = VD)) + 
  geom_bar(stat = "identity", color = "black") + 
  ggtitle("Proporção das variantes de /r/ por Faixa Etária do falante") +
  labs(x = "Faixa Etária", y = "Proporção", fill = "Variantes de /r/") + 
  scale_x_discrete(labels = c("20-34", "35-59", "60+")) + 
  scale_fill_brewer(palette = "Purples", labels = c("tepe", "retroflexo")) + 
  theme_bw()

tab.prop.FAIXA.ETARIA %>%
  filter(VD == "retroflexo") %>%
  ggplot(., aes(x = FAIXA.ETARIA, y = prop * 100, group = VD)) + 
  geom_line(linetype = "dotted", size = 1, color = "blue") + 
  geom_point(shape = 18, size = 3, fill = "black") + 
  ggtitle("Proporção de retroflexo por Faixa Etária do falante") +
  labs(x = "Faixa Etária", y = "Proporção", fill = "Variantes de /r/") + 
  scale_x_discrete(labels = c("1a", "2a", "3a")) + 
  ylim(0, 50) +
  theme_bw()

tab.FAIXA.ETARIA <- with(dados, table(FAIXA.ETARIA, VD)); tab.FAIXA.ETARIA
prop.FAIXA.ETARIA <- with(dados, prop.table(tab.FAIXA.ETARIA) * 100); prop.FAIXA.ETARIA

chisq.test(tab.FAIXA.ETARIA)
chisq.test(tab.FAIXA.ETARIA[c(2, 3), ]) # 2a vs 3a
mod <- glm(VD ~ FAIXA.ETARIA, data = dados, family = binomial)
summary(mod)
plot(allEffects(mod), type = "response")

# VD ~ INDICE.SOCIO ####
mod <- glm(VD ~ INDICE.SOCIO, data = dados, family = binomial)
summary(mod)
plot(allEffects(mod), type = "response")

# Outras variáveis?... ESCOLARIDADE, REGIAO, ORIGEM.PAIS, CONT.FON.PREC...

### Análises multivariadas ####
# Checar ortogonalidade entre variáveis previsoras 
# CONT.FON.SEG e POSICAO.R
with(dados, table(CONT.FON.SEG, POSICAO.R))

# CLASSE.MORFOLOGICA e POSICAO.R
with(dados, table(CLASSE.MORFOLOGICA, POSICAO.R))

# CLASSE.MORFOLOGICA e TONICIDADE
with(dados, table(CLASSE.MORFOLOGICA, TONICIDADE))

# Modelo com TONICIDADE, POSICAO.R, CLASSE.MORFOLOGIA e CONT.FON.SEG para verificar multicolinearidade
mod <- glm(VD ~ 
             TONICIDADE + 
             POSICAO.R + 
             CLASSE.MORFOLOGICA + 
             CONT.FON.SEG, 
           data = dados, family = binomial)

summary(mod)

# Função vif() para avaliar multicolinearidade (requer pacote car)
car::vif(mod)

### Modelo de regressão logística ####
modelo <- glm(VD ~ 
                SEXO.GENERO + 
                FAIXA.ETARIA * REGIAO + 
                INDICE.SOCIO + 
                CONT.FON.PREC + 
                CONT.FON.SEG + 
                TONICIDADE + 
                POSICAO.R + 
                CLASSE.MORFOLOGICA, 
              data = dados, family = binomial)

summary(modelo)
lrm(VD ~ 
      SEXO.GENERO + 
      FAIXA.ETARIA * REGIAO + 
      INDICE.SOCIO + 
      CONT.FON.PREC + 
      CONT.FON.SEG + 
      TONICIDADE + 
      POSICAO.R + 
      CLASSE.MORFOLOGICA, 
    data = dados)

### Função step() ####
m0 <- glm(VD ~ 1, data = dados, family = binomial)
m.fw <- step(m0, 
             direction = "forward", 
             scope = ~ 
               SEXO.GENERO + 
               FAIXA.ETARIA * REGIAO + 
               INDICE.SOCIO + 
               CONT.FON.PREC + 
               CONT.FON.SEG + 
               TONICIDADE + 
               POSICAO.R + 
               CLASSE.MORFOLOGICA)
m.fw

m.bw <- step(modelo, direction = "backward")
m.bw

m.both <- step(m0, scope = ~ 
                 SEXO.GENERO + 
                 FAIXA.ETARIA * REGIAO + 
                 INDICE.SOCIO + 
                 CONT.FON.PREC + 
                 CONT.FON.SEG + 
                 TONICIDADE + 
                 POSICAO.R + 
                 CLASSE.MORFOLOGICA)
m.both

### Função drop1() ####
drop1(modelo, test = "LR")

### Testar overfitting
mod.lrm <- lrm (VD ~ 
                  SEXO.GENERO + 
                  FAIXA.ETARIA * REGIAO + 
                  INDICE.SOCIO + 
                  CONT.FON.PREC + 
                  CONT.FON.SEG + 
                  TONICIDADE + 
                  POSICAO.R + 
                  CLASSE.MORFOLOGICA, 
                data = dados, x = T, y = T)

### Função validate() - requer pacote rms
validate(mod.lrm, B = 200, bw = T)

### Checagem de pressupostos ####

### (a) A relação entre o logit e as variáveis previsoras numéricas é linear?
# Fazer modelo sem interação para aplicar crPlot
modelo2 <- glm(VD ~ 
                 SEXO.GENERO + 
                 FAIXA.ETARIA + 
                 REGIAO + 
                 INDICE.SOCIO + 
                 CONT.FON.PREC + 
                 CONT.FON.SEG + 
                 TONICIDADE + 
                 POSICAO.R + 
                 CLASSE.MORFOLOGICA, 
               data = dados, family = binomial)

# Aplicar crPlot() ao modelo (requer pacote car)
crPlot(modelo2, variable = "INDICE.SOCIO")

### (b) Há multicolinearidade?
car::vif(modelo)

### (c) Observações são independentes? -- em dados linguísticos, quase nunca são! --> MODELOS DE EFEITOS MISTOS

### Criar modelo linear de efeitos mistos ###
# função glmer() depende dos pacotes lme4 e lmerTest
mod.glmer <- glmer(VD ~ 
                     SEXO.GENERO + 
                     FAIXA.ETARIA * REGIAO + 
                     INDICE.SOCIO + 
                     CONT.FON.PREC + 
                     CONT.FON.SEG + 
                     TONICIDADE + 
                     POSICAO.R + 
                     CLASSE.MORFOLOGICA + 
                     (1|INFORMANTE) + 
                     (1|ITEM.LEXICAL), 
                   data = dados, family = binomial)

# Aplicar summary() a mod.glmer
summary(mod.glmer)

# Visualizar resultados numéricos em gráfico de efeitos (requer pacote effects)
plot(allEffects(mod.glmer), type = "response")

# Gráficos de efeitos com argumento ask = T
plot(allEffects(mod.glmer), type = "response", ask = T)
