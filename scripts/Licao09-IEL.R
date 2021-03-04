#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######    Lição 09: Testes de Proporção e Qui-quadrado     ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


### (2%) Carregar pacotes necessários


### Definir como diretório de trabalho a pasta em que está o arquivo LabovDS.csv


### Carregar os dados
ds <- read_csv("LabovDS.csv",
               col_types = cols(.default = col_factor())) %>%
  filter(r != "d") %>%
  droplevels()

### (5%) Inspecionar ds


### (8%_) Computar frequências e proporções dos dados da VD com dplyr
novo.df <- df %>%
  count(VAR) %>%
  mutate(nomeVAR = funcao(n)) %>%
  print()


### (9%_) Plotar proporções com ggplot
ggplot(df, aes(x = VAR, y = VAR, fill =VAR)) + 
  geom_bar(stat = "identity") 


### (10%) Fazer tabela de frequências com base R


### (11%) Visualizar tabela de frequências com base R


# (13%) Teste de proporções com prop.test() sob hipótese nula de probabilidade = 0.5; teste deve ser feito sobre a tabela de frequências, não de proporções


# (14%) Visualizar resultado de teste.prop


# (21%) Ver ajuda de prop.test


# Teste de proporções sob hipótese nula de probabilidade = 0.7
# (24%) hipótese bidirecional


# (28%) hipótese unidirecional


# (29%) hipótese unidirecional


### (32%_) Comparação entre dois grupos
novo.df <- df %>% 
  count(VAR, VAR) %>%
  group_by(VAR) %>%
  mutate(nomeVAR = funcao(n)) %>%
  print()


### (33%_) Plotar gráfico de barras
ggplot(df, aes(x = VAR, y = VAR, fill = VAR)) + 
  geom_bar(stat = "identity")


### (34%) Tabela de frequências com base R


### (35%) Visualizar tabela de frequências com base R


### (36%) Teste de qui-quadrado para comparação entre dois grupos ###


### (38%) Visualizar resultado do teste de qui-quadrado


# (41%) Visualizar valores gerados pelo teste de qui-quadrado com str()


# (43%) Computar valores observados do teste de qui-quadrado


# (45%) Computar valores esperados do teste de qui-quadrado


# (46%) Visualizar O


# (47%) Visualizar E


# (48%, 49%, 50%, 51%, 52%) Adicionar margens à tabela de valores observados O, para computar valores esperados 'manualmente': (T-linha * T-coluna) / T-geral


(499 * 347) / 730


# (53%*, 54%*) O que são os valores esperados: valores caso não houvesse diferença entre grupo 1 e grupo 2


# (61%) Fórmula do cálculo de X2


# (62%) Visualizar novamente resultado de x2.word


# (63%) Teste de qui-quadrado sem a correção


# (65%) Cálculo dos graus de liberdade: (nrow - 1) * (ncol - 1)


#### (71%_) Teste de qui-quadrado para comparação entre mais de dois grupos: variável store ####
novo.df <- df %>% 
  count(VAR, VAR) %>%
  group_by(VAR) %>%
  mutate(nomeVAR = funcao(n)) %>%
  print()


### (72%) Plotar gráfico de barras
ggplot(df, aes(x = VAR, y = VAR, fill = VAR)) + 
  geom_bar(stat = "identity")


### (73%) Tabela de frequências com base R, de store por r


### (74%) Visualizar tabela de frequências de store por r


### (75%) Teste de qui-quadrado sobre tabela tab.store


### (76%) Visualizar resultado do teste de qui-quadrado


# (78%) Computar valores observados do teste de qui-quadrado


# (79%) Computar valores esperados do teste de qui-quadrado


# (80%) Computar valor de qui-quadrado por célula


# (83%_) Visualizar diferença no gráfico
ggplot(df, aes(x = VAR, y = VAR, fill = VAR)) + 
  geom_bar(stat = "identity") +
  geom_hline(yintercept = prop_r1) 


# (85%) Outra maneira de encontrar a diferença: visualizar resíduos


# (86%) Teste de qui-quadrado entre dois níveis específicos: Saks vs Macys


# (96%) Dividir tab.store por 20


# (97%) Fazer teste de qui-quadrado sobre tab.store / 20

