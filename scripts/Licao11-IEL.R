#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######          Lição 11: Correlação e Regressão           ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


### (1%) Carregar pacote tidyverse


### (2%) Carregar pacote GGally


### (5%) Inspecionar df criancas


### (6%_) Visualizar distribuição
ggplot(df, aes(x = VAR, y = VAR)) + 
  geom_point() 


### (9%) Teste de correlação de Pearson idade vs altura


# (10%) Teste de correlação de Pearson altura vs idade: mesmo resultado


### (17%) Teste de Shapiro para testar normalidade do vetor idade


### (18%) Teste de Shapiro para testar normalidade do vetor altura


# (20%) Teste de correlação de Pearson não paramétrico (apenas para ver output)


### (24%) Modelo linear


# (26%) Ver resultado do modelo linear


# (35%*) Plotar linha de regressão em gráfico de dispersão
ggplot(criancas, aes(x = idade, y = altura)) +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE, color = "lightgrey")
  
# (41%) Inspecionar estrutura do modelo linear


# (43%) Valores previstos


# (44%) Visualizar valores previstos


# (45%) Diferença entre valores observados e valores previstos: resíduos


# (46%) Visualizar resíduos


# (48%) Os resíduos equivalem a criancas$altura - modelo$fitted.values


# (49%*) Visualizar resíduos no gráfico 
ggplot(criancas, aes(x = idade, y = altura)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "lightgrey") +  
  geom_segment(aes(xend = idade, y = altura, yend = previsao), alpha = .2) 

### (50%) Aplicar função summary() a `modelo`


# (56%) Cálculo do valor-t do Intercept: estimativa / erro padrão


# (57%) Cálculo do valor-t do coeficiente angular: estimativa / erro padrão


# (66%) Visualizar novamente o valor de r de Pearson


# (67%) Calcular o valor de r de Pearson ao quadrado R^2


### Com dados linguísticos: planilha Covariaveis.csv

### (71%) Inspecionar dataframe cov


### (72%) Visualizar dataframe cov com View()


### (74%_) Visualizar gráfico de dispersão com linha de regressão
ggplot(df, aes(x = VAR, y = VAR)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "lightgrey")


### (76%) Teste de Shapiro nos vetor CV3PP


### (77%) Teste de Shapiro nos vetor CN


### (78%) Teste de correlação nao paramétrico entre CV3PP e CN


# (80%) Criar modelo linear


# (83%) Visualizar resultado do modelo linear com summary()


### (88%_) Visualizar múltiplas correlações com ggpairs (requer pacote GGally)
ggpairs(df, columns = i:i)


### (94%_) Visualizar múltiplas correlações e separar dados por outra variável
ggpairs(df, columns = i:i, ggplot2::aes(color = VAR))


# Ver também: visualizar múltiplas correlações com pairscor.fnc (requer pacote languageR - Baayen 2013)
library(languageR)

pairscor.fnc( ~ cov$EN + 
                cov$RT + 
                cov$R0 + 
                cov$CN + 
                cov$CV3PP + 
                cov$CV1PP, 
              hist = T, smooth = T)

