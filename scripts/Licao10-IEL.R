#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######                  Lição 10: Teste-t                  ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


### (1%) Carregar pacotes necessários


### Definir como diretório de trabalho pasta que contém arquivo Pretonicas.csv
# setwd()

### Carregar dados
pretonicas <- read_csv("Pretonicas.csv",
                       col_types = cols(.default = col_guess(),
                         AMOSTRA = col_factor(levels = c("PBSP", "SP2010")),
                         VOGAL = col_factor(levels = c("i", "e", "a", "o", "u"))
                       ))
### (3%) Inspecionar df


# Criar subconjuntos de dados
# (4%) Vogal /e/ em PBSP


# (6%) Vogal /e/ em SP2010


# (7%) Vogal /e/ em ambas as amostras


# (9%_) Visualizar distribuição dos dados em histograma
ggplot(df, aes(x = VAR)) +
  geom_histogram() + 
  facet_grid(VAR ~ .) 


### (10%_) Calcular médias e desvio padrão 
novo.df <- df %>%
  group_by(VAR) %>%
  summarize(media_F1 = funcao(VAR),
            desvio_F1 = funcao(VAR)) %>%
  print()


### (14%_) Visualizar dispersão dos dados
df %>%
  ggplot(., aes(x = VAR, y = VAR)) +
  geometria() + 
  reverterEixo() 


# Teste de Shapiro para checar normalidade da distribuição
### (21%) Teste de Shapiro para PSBP


### (23%) Teste de Shapiro para SP2010


# (24%*) Por curiosidade, também seria possível fazer esses cálculos com dplyr; neste caso, é necessário envolver a função do teste de Shapiro na função list(): 
shapiro <- pretonicas %>%
  filter(VOGAL == "e") %>%
  group_by(AMOSTRA) %>%
  summarize(res = list(shapiro.test(F1.NORM))) 

# (26%*)
shapiro$res

### (34%) Teste-t nos dados de PBSP


# (43%) Cálculo do teste-t pela fórmula


# (49%) Teste-t unidirecional, com alternative = less


### (51%) Teste de Wilcoxon nos dados de SP2010


### (53%) Teste de Wilcoxon nos dados de SP2010 com intervalo de confiança


### (57%) Teste-t/Wilcoxon para todos os dados, começando pelo teste de Shapiro


### (60%) Teste comparando as amostras


# (63%) Fazendo manualmente o cômputo da diferença entre média para PBSP e para SP2010


### (66%) Teste-t comparando as amostras (só para ver o output)


### (70%) Checar ordem dos níveis da variável AMOSTRA


### (71%) Teste de Wilcoxon direcional


### Teste-t pareado
# (77%) Visualizar conjunto de dados sleep


# (80%) Criar vetor com dados do primeiro grupo: g1


# (81%) Criar vetor com dados do segundo grupo: g2


# (83%) Aplicar teste de Shapiro a g1


# (84%) Aplicar teste de Shapiro a g2


# (86%) Aplicar teste-t pareado


# (87%) Comparação do resultado com teste não pareado

