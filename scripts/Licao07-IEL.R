#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######      Lição 07: Variáveis Numéricas - Gráficos       ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (3%) Carregar pacote tidyverse


# Definir o diretório de trabalho
#setwd()

# Carregar dados
pretonicas <- read_csv("Pretonicas.csv",
                       col_types = cols(
                         AMOSTRA = col_factor(levels = c("PBSP", "SP2010")),
                         VOGAL = col_factor(levels = c("i", "e", "a", "o", "u"))
                       ))

# (5%) Inspecionar dados


# (6%) Checar ordem dos níveis das vogais


######## Gráficos ########

### Gráfico de linhas dos espaços vocálicos ####

# (17%_) Obter coordenadas de x (F2) e y (F1)
novo.df <- df %>%
  group_by(VAR, VAR) %>%
  summarize(novaVAR1 = mean(VAR),
            novaVAR2 = mean(VAR)) %>%
  print()


# (27%_, 30%, 32%_, 33%) Plotar espaços vocálicos de PBSP e SP2010
ggplot(df, aes(x = VAR, y = VAR, color = VAR)) +
  geom_line() + 
  #  geom_label() +
  #  scale_x_reverse() + 
  #  scale_y_reverse() +
  #  ggtitle("Valores médios de F1 e F2 normalizados nas amostras PBSP e SP2010") + 
  #  labs(x = "F2 normalizado", y = "F1 normalizado") + 
  theme_bw()


### Gráfico de dispersão dos espaços vocálicos ####

# (42%_) Plotar gráfico de dispersão das medições de F1 e F2 normalizados em PBSP e SP2010
ggplot(df, aes(x = VAR, y = VAR, color = VAR)) + 
  geom_point() + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  facet_grid(. ~ VAR) + 
  ggtitle("Dispersão das medidas de F1 e F2 normalizados nas amostras PBSP e SP2010") + 
  labs(x = "F2 normalizado", y = "F1 normalizado") + 
  theme_bw()


### Boxplot ####

# (62%_, 65%_) Plotar boxplots das medidas de F1.NORM por VOGAL e por AMOSTRA
ggplot(df, aes(x = VAR, y = VAR, color = VAR)) +
  geom_boxplot(notch = FALSE) +
  scale_y_reverse() + 
  labs(x = "Amostra", y = "F1 normalizado") +
  facet_grid(. ~ VAR) + 
  theme_bw() 


### Histograma ####

# (76%_) Plotar histograma das medições de F1.NORM da vogal /e/ dos dados de PBSP
pretonicas %>%
  filter(VOGAL == "e" & AMOSTRA == "PBSP") %>%
  ggplot(., aes(x = VAR)) +
  geom_histogram(binwidth = n, fill = "white", color = "black") +
  labs(x = "F1 normalizado", y = "Frequência") + 
  theme_bw() 


# (82%*) Calcular média e mediana de F1.NORM da vogal /e/ dos dados de PBSP
med_centrais_PBSPe <- pretonicas %>%
  filter(., VOGAL == "e" & AMOSTRA == "PBSP") %>%
  summarize(media = mean(F1.NORM),
            mediana = median(F1.NORM)) %>%
  print()

# (85%_) Plotar histograma das medições de F1.NORM da vogal /e/ dos dados de PBSP com indicação da média e da mediana
pretonicas %>%
  filter(., VOGAL == "e" & AMOSTRA == "PBSP") %>%
  ggplot(., aes(x = VAR)) +
  geom_histogram(binwidth = n, fill = "white", color = "black") +
  labs(x = "F1 normalizado", y = "Frequência") + 
  theme_bw() +
  geom_vline(xintercept = med_centrais_PBSPe$media, color = "blue") +
  geom_vline(xintercept = med_centrais_PBSPe$mediana, color = "red") 


# Outros histogramas:
# Plotar histograma das medições de F1.NORM da vogal /e/ dos dados de PBSP e SP2010
pretonicas %>%
  filter(VOGAL == "e") %>%
  ggplot(., aes(x = F1.NORM, fill = AMOSTRA)) +
  geom_histogram(binwidth = 20, position = "identity", alpha = 0.4) +
  theme_bw()

# Plotar histograma das medições de F1.NORM das cinco vogais dos dados de PBSP e SP2010
ggplot(pretonicas, aes(x = F1.NORM, fill = AMOSTRA)) +
  geom_histogram(binwidth = 10, position = "identity", alpha = 0.4) +
  labs(x = "F1 normalizado", y = "Frequência") + 
  facet_grid(VOGAL ~ .) +
  theme_bw() 

