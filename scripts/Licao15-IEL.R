#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######         Lição 15: Regressão Logística Parte 2       ######
#################################################################

# O hashtag é o caractere de comentário. Tudo que é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (2%) Carregar pacote rms


# (3%) Carregar pacote effects


# (5%) Carregar pacote car


# (6%) Carregar pacote lme4


# (8%) Carregar pacote lmerTest


# (11%) Checar estrutura do dataframe


# Checar ortogonalidade entre variáveis previsoras 
# (13%_) Tabular CONT.FON.SEG e POSICAO.R
with(df, table(VAR, VAR))


# (14%) Tabular CLASSE.MORFOLOGICA e POSICAO.R


# (16%) Tabular CLASSE.MORFOLOGICA e TONICIDADE


# (19%_) Criar modelo com TONICIDADE, POSICAO.R, CLASSE.MORFOLOGIA e CONT.FON.SEG para verificar multicolinearidade
mod <- glm(VAR ~ 
             VAR + 
             VAR + 
             VAR + 
             VAR, 
           data = df, family = binomial)


# (22%) Aplicar a função vif() para avaliar multicolinearidade (requer pacote car)


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

# (30%) Aplicar summary() a modelo


# (51%) Criar modelo com lrm() (requer pacote rms)


### Função step(): step forward
# (54%) Criar modelo 0, com nenhum variável


# (56%) Rodar step foward


# (59%) Visualizar resultado do step forward


### Função step(): step backward
# (60%) Rodar step backward


# (63%) Visualizar resultado do step backward


#  Função step(): step both
# (67%) Rodar step both


# (68%) Visualizar resultado do step both


### (70%) Função drop1()


### (73%*) Testar overfitting
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

### (75%) Função validate() - requer pacote rms


### Checagem de pressupostos ####

### (a) A relação entre o logit e as variáveis previsoras numéricas é linear?
# (79%) Fazer modelo sem interação para aplicar crPlot


# (81%) Aplicar crPlot() ao modelo (requer pacote car)


### (84%) (b) Há multicolinearidade?


### (c) Observações são independentes? -- em dados linguísticos, quase nunca são! --> MODELOS DE EFEITOS MISTOS

### Criar modelo linear de efeitos mistos ###
# (89%) função glmer() (depende dos pacotes lme4 e lmerTest)


# (90%) Aplicar summary() a mod.glmer


# (95%) Visualizar resultados numéricos em gráfico de efeitos (requer pacote effects)


# (fora do swirl) Gráficos de efeitos com argumento ask = T

