#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######          Lição 12: Regressão Linear Parte 1         ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


### (3%) Carregar pacote tidyverse


### (4%) Carregar pacote effects


# Definir diretório de trabalho


# Carregar arquivo Pretonicas.csv
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

### Criar subconjunto de dados da vogal /e/ pretônica
VOGAL_e <- filter(pretonicas, VOGAL == "e") %>%
  droplevels()

### (6%) Visualizar estrutura do df


### (7%) Visualizar df com View()


## Modelos Lineares #### 
#(com poucas variáveis apenas para treinamento da leitura dos resultados! idealmente, você quer fazer uma análise MULTIvariada - ver Lição 13!)

# 1 VP nominal/binária ####
# (13%) Fazer mod1


# (14%) Aplicar summary() a mod1


# (18%) Visualizar distribuição de dados de F1.NORM por amostra
ggplot(df, aes(x = VAR, y = VAR)) +
  geometria(notch = TRUE) + 
  reverterEixo() 


# (20%) Excluir dados de F1.NORM acima de 500 Hz


# (21%) Refazer o modelo F1.NORM ~ AMOSTRA com VOGAL_e2


# (23%) Aplicar summary() a mod2


# (30%) Resultado de lm() com 1 VP binária equivale a t.test()


# (34%) Visualizar resultados do modelo com gráfico de efeitos -- funções effect() e allEffects() requerem pacote effects


# 1 VP mais de 2 fatores ####
# (38%) Fazer mod3


# (39%) Aplicar summary() a mod3


# (41%) Ver níveis de CONT.SEG


# (48%) Visualizar resultados do modelo com gráfico de efeitos


# (51%) Ver todos os contrastes possíveis 


# 1 VP numérica ####
# (54%) Fazer mod4


# (55%) Aplicar summary() a mod4


# (58%) Visualizar resultados do modelo com gráfico de efeitos


# 2 VPs nominais ####
# (61%) Fazer mod5


# (62%) Aplicar summary() a mod5


# (66%) Visualizar resultados do modelo com gráfico de efeitos


# Interação ####
# (93%) Fazer mod6


# (94%) Aplicar summary() a mod6


# (97%) Visualizar resultados do modelo com gráfico de efeitos


#### ~ Visualizar resultados com gráfico de efeitos com ggplot2 ~ ####
library(gridExtra)

# Extrair dados do modelo: mod2, com AMOSTRA
gref <- as.data.frame(effect('AMOSTRA', mod2, se=TRUE, confidence.level=.95))
gref
# Plotar gráfico de efeitos
ggplot(gref, aes(x = AMOSTRA, y= fit)) + 
  geom_point() + 
  geom_errorbar(aes(ymin = lower, ymax = upper), color = "black", width = .3) + 
  scale_y_reverse() 

# Extrair dados do modelo: mod3, com CONT.SEG
gref <- as.data.frame(effect('CONT.SEG', mod3, se=TRUE, confidence.level=.95))
gref
# Plotar gráfico de efeitos
ggplot(gref, aes(x = CONT.SEG, y= fit)) + 
  geom_point() + 
  geom_errorbar(aes(ymin = lower, ymax = upper), color = "black", width = .3) + 
  scale_y_reverse() 

#### ~ Visualizar resultados com gráfico do ggplot2 ~ ###
# Para duas variáveis numéricas (VD e VI), é possível fazer o gráfico diretamente no ggplot2
ggplot(VOGAL_e2, aes(x = F1.SEG.NORM, y = F1.NORM)) +
  geom_point() +
  scale_y_reverse() +
  geom_smooth(method = "lm", se = TRUE, color = "lightgrey") 

# Extrair dados do modelo: duas variáveis nominais: um para cada variável
gref1 <- as.data.frame(effect("AMOSTRA", mod5, se=TRUE, confidence.level=.95))
gref1
gref2 <- as.data.frame(effect("SEXO", mod5, se=TRUE, confidence.level=.95))
gref2
# Plotar gráfico de efeitos: um para cada variável
p1 <- ggplot(gref1, aes(x = AMOSTRA, y= fit)) + 
  geom_point() + 
  geom_errorbar(aes(ymin = lower, ymax = upper), color = "black", width = .3) + 
  ylim(440, 410) 
p2 <- ggplot(gref2, aes(x = SEXO, y= fit)) + 
  geom_point() + 
  geom_errorbar(aes(ymin = lower, ymax = upper), color = "black", width = .3) + 
  ylim(440, 410) 
# grid.arrange() depende do pacote gridExtra
grid.arrange(p1, p2, ncol=2) 

# Extrair dados do modelo: para uma interação, passos são como para uma variável
gref <- as.data.frame(effect("AMOSTRA * SEXO", mod6, se=TRUE, confidence.level=.95))
gref
# Plotar gráfico de efeitos
ggplot(gref, aes(x = SEXO, y= fit)) + 
  geom_point() + 
  geom_errorbar(aes(ymin = lower, ymax = upper), color = "black", width = .3) + 
  scale_y_reverse() + 
  facet_grid(. ~ AMOSTRA) 

