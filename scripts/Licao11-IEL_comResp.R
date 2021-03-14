#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######          Lição 11: Correlação e Regressão           ######
#################################################################

# O hashtag é o caractere de comentário. Tudo que é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


### (1%) Carregar pacote tidyverse
library(tidyverse)

### (2%) Carregar pacote GGally
library(GGally)

### (5%) Inspecionar df criancas
criancas

### (6%_) Visualizar distribuição
ggplot(df, aes(x = VAR, y = VAR)) + 
  geom_point() 

ggplot(criancas, aes(x = idade, y = altura)) + 
  geom_point() 

### (9%) Teste de correlação de Pearson idade vs altura
cor.test(criancas$idade, criancas$altura)

# (10%) Teste de correlação de Pearson altura vs idade: mesmo resultado
cor.test(criancas$altura, criancas$idade)

### (17%) Teste de Shapiro para testar normalidade do vetor idade
shapiro.test(criancas$idade)

### (18%) Teste de Shapiro para testar normalidade do vetor altura
shapiro.test(criancas$altura)

# (20%) Teste de correlação de Pearson não paramétrico (apenas para ver output)
cor.test(criancas$idade, criancas$altura, method = "spearman")

### (24%) Modelo linear
modelo <- lm(altura ~ idade, data = criancas)

# (26%) Ver resultado do modelo linear
modelo

# (35%*) Plotar linha de regressão em gráfico de dispersão
ggplot(criancas, aes(x = idade, y = altura)) +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE, color = "lightgrey")
  
# (41%) Inspecionar estrutura do modelo linear
str(modelo) 

# (43%) Valores previstos
previsao <- modelo$fitted.values

# (44%) Visualizar valores previstos
previsao 

# (45%) Diferença entre valores observados e valores previstos: resíduos
residuos <- modelo$residuals 

# (46%) Visualizar resíduos
residuos 

# (48%) Os resíduos equivalem a criancas$altura - modelo$fitted.values
criancas$altura - modelo$fitted.values

# (49%*) Visualizar resíduos no gráfico 
ggplot(criancas, aes(x = idade, y = altura)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "lightgrey") +  
  geom_segment(aes(xend = idade, y = altura, yend = previsao), alpha = .2) 

### (50%) Aplicar função summary() a `modelo`
summary(modelo)

# (56%) Cálculo do valor-t do Intercept: estimativa / erro padrão
62.504 / 3.7691

# (57%) Cálculo do valor-t do coeficiente angular: estimativa / erro padrão
7.5453 / 0.5135

# (66%) Visualizar novamente o valor de r de Pearson
cor.test(criancas$idade, criancas$altura)$estimate

# (67%) Calcular o valor de r de Pearson ao quadrado R^2
cor.test(criancas$idade, criancas$altura)$estimate ^ 2

### Com dados linguísticos: planilha Covariaveis.csv

### (71%) Inspecionar dataframe cov
str(cov)

### (72%) Visualizar dataframe cov com View()
View(cov)

### (74%_) Visualizar gráfico de dispersão com linha de regressão
ggplot(df, aes(x = VAR, y = VAR)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "lightgrey")

ggplot(cov, aes(x = CV3PP, y = CN)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "lightgrey")

### (76%) Teste de Shapiro nos vetor CV3PP
shapiro.test(cov$CV3PP)

### (77%) Teste de Shapiro nos vetor CN
shapiro.test(cov$CN)

### (78%) Teste de correlação nao paramétrico entre CV3PP e CN
cor.test(cov$CV3PP, cov$CN, method = "spearman")

# (80%) Criar modelo linear
modelo1 <- lm(CN ~ CV3PP, data = cov)

# (83%) Visualizar resultado do modelo linear com summary()
summary(modelo1)

### (88%_) Visualizar múltiplas correlações com ggpairs (requer pacote GGally)
ggpairs(df, columns = i:i)

ggpairs(cov, columns = 10:15)

### (94%_) Visualizar múltiplas correlações e separar dados por outra variável
ggpairs(df, columns = i:i, ggplot2::aes(color = VAR))

ggpairs(cov, columns = 10:15, ggplot2::aes(color = REGIAO))

# Ver também: visualizar múltiplas correlações com pairscor.fnc (requer pacote languageR - Baayen 2013)
library(languageR)

pairscor.fnc( ~ cov$EN + 
                cov$RT + 
                cov$R0 + 
                cov$CN + 
                cov$CV3PP + 
                cov$CV1PP, 
              hist = T, smooth = T)

