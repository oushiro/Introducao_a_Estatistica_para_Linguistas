#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######          Lição 13: Regressão Linear Parte 2         ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (8%) Carregar pacote tidyverse


# (9%) Carregar pacote car


# (11%) Carregar pacote lme4


# (12%) Carregar pacote lmerTest


# (14%) Aplicar str() ao conjunto de dados VOGAL_e2.


### Modelos lineares multivariados ####

### (15%) Modelo com todas as variáveis previsoras


### (17%) Aplicar summary() a mod


### Função step(): step forward
# (32%) Criar modelo 0, com nenhum variável


# (33%) Rodar step foward


# (35%) Ver resultado de step forward


### Função step(): step backward
# (36%) Rodar step backward


# (39%) Ver resultado de step backward


### Função step(): step both
# (41%) Rodar step both


# (42%) Ver resultado de step both


### (45%) Função drop1()


### (50%) Novo modelo linear sem variável SEXO


### Checagem de pressupostos ####

### (a) relação entre variável resposta e variável previsora numérica é linear?
# (56%) Aplicar função crPlot() (depende do pacote car)


# (58%) Retirar valores atípicos de F1.SEG.NORM


# (59%) Novo modelo linear


# (61%) Aplicar função crPlot() a modelo2


### (65%) (b) Há multicolinearidade? (função vif() depende do pacote car)


### (c) Resíduos têm distribuição normal?
# (68%) Aplicar summary() a modelo2


# (71%) Verificar normalidade dos resíduos por meio de teste estatístico


### (d) Observações são independentes? -- em dados linguísticos, quase nunca são! --> MODELOS DE EFEITOS MISTOS

### Criar modelo linear de efeitos mistos ###
# (82%) função lmer() depende dos pacotes lme4 e lmerTest


# (83%) Aplicar summary() a mod1.lmer


# (86%) Função step backward


# (88%) Visualizar resultado do step backward


### ~  Plotar estimativas do modelo: plot_model() ~ #### 
#https://cran.r-project.org/web/packages/sjPlot/vignettes/plot_model_estimates.html (requer pacote sjPlot); somente para efeitos fixos
library(sjPlot)

plot_model(mod, transform = NULL, show.values = T, value.offset = .3)

