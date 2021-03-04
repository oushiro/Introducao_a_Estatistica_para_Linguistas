#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######         Lição 15: Regressão Logística Parte 2       ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (2%) Carregar pacote rms
library(rms)

# (3%) Carregar pacote effects
library(effects)

# (5%) Carregar pacote car
library(car)

# (6%) Carregar pacote lme4
library(lme4)

# (8%) Carregar pacote lmerTest
library(lmerTest)

# (11%) Checar estrutura do dataframe
str(dados)

# Checar ortogonalidade entre variáveis previsoras 
# (13%_) Tabular CONT.FON.SEG e POSICAO.R
with(df, table(VAR, VAR))

with(dados, table(CONT.FON.SEG, POSICAO.R))

# (15%) Tabular CLASSE.MORFOLOGICA e POSICAO.R
with(dados, table(CLASSE.MORFOLOGICA, POSICAO.R))

# (16%) Tabular CLASSE.MORFOLOGICA e TONICIDADE
with(dados, table(CLASSE.MORFOLOGICA, TONICIDADE))

# (19%_) Criar modelo com TONICIDADE, POSICAO.R, CLASSE.MORFOLOGIA e CONT.FON.SEG para verificar multicolinearidade
mod <- glm(VAR ~ 
             VAR + 
             VAR + 
             VAR + 
             VAR, 
           data = df, family = binomial)

mod <- glm(VD ~ 
             TONICIDADE + 
             POSICAO.R + 
             CLASSE.MORFOLOGICA + 
             CONT.FON.SEG, 
           data = dados, family = binomial)

# (23%) Aplicar a função vif() para avaliar multicolinearidade (requer pacote car)
car::vif(mod)

### (29%*) Modelo de regressão logística ####
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

# (31%) Aplicar summary() a modelo
summary(modelo)

# (52%) Criar modelo com lrm() (requer pacote rms)
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

### Função step(): step forward
# (55%) Criar modelo 0, com nenhum variável
m0 <- glm(VD ~ 1, data = dados, family = binomial)

# (56%) Rodar step foward
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

# (60%) Visualizar resultado do step forward
m.fw

### Função step(): step backward
# (61%) Rodar step backward
m.bw <- step(modelo, direction = "backward")

# (65%) Visualizar resultado do step backward
m.bw

#  Função step(): step both
# (68%) Rodar step both
m.both <- step(m0, scope = ~ 
                 SEXO.GENERO + 
                 FAIXA.ETARIA * REGIAO + 
                 INDICE.SOCIO + 
                 CONT.FON.PREC + 
                 CONT.FON.SEG + 
                 TONICIDADE + 
                 POSICAO.R + 
                 CLASSE.MORFOLOGICA)

# (69%) Visualizar resultado do step both
m.both

### (71%) Função drop1()
drop1(modelo, test = "LR")

### (74%*) Testar overfitting
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

### (76%) Função validate() - requer pacote rms
validate(mod.lrm, B = 200, bw = T)

### Checagem de pressupostos ####

### (a) A relação entre o logit e as variáveis previsoras numéricas é linear?
# (81%) Fazer modelo sem interação para aplicar crPlot
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

# (82%) Aplicar crPlot() ao modelo (requer pacote car)
crPlot(modelo2, variable = "INDICE.SOCIO")

### (85%) (b) Há multicolinearidade?
car::vif(modelo)

### (c) Observações são independentes? -- em dados linguísticos, quase nunca são! --> MODELOS DE EFEITOS MISTOS

### Criar modelo linear de efeitos mistos ###
# (90%) função glmer() depende dos pacotes lme4 e lmerTest
mod.glmer <- glmer(VD ~ 
                     SEXO.GENERO + 
                     FAIXA.ETARIA * REGIAO + 
                     INDICE.SOCIO + 
                     CONT.FON.PREC + 
                     CONT.FON.SEG + 
                     TONICIDADE + 
                     POSICAO.R + 
                     CLASSE.MORFOLOGICA + 
                     (1|PARTICIPANTE) + 
                     (1|ITEM.LEXICAL), 
                   data = dados, family = binomial)

# (92%) Aplicar summary() a mod.glmer
summary(mod.glmer)

# (95%) Visualizar resultados numéricos em gráfico de efeitos (requer pacote effects)
plot(allEffects(mod.glmer), type = "response")

# (97%) Gráficos de efeitos com argumento ask = T
plot(allEffects(mod.glmer), type = "response", ask = T)
