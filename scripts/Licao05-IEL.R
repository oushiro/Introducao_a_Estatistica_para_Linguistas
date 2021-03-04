#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######       Lição 05: Variaveis Nominais - Gráficos       ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (2%) Carregar pacote tidyverse


# (4%) Carregar pacote RColorBrewer


# Definir diretório de trabalho com setwd()
setwd("~/Dropbox/_R/swirl/Introducao_a_Estatistica_para_Linguistas/data")

# Carregar dataframe ds com dados de Labov
ds <- read_csv("LabovDS.csv", col_types = cols(.default = col_factor()))

# Excluir dados duvidosos `d` 
ds2 <- ds %>%
    filter(r != "d") %>%
    droplevels()

# Visualizar estrutura de ds
str(ds2)

# Tabular frequências e proporções da variável store pela variável r
df.store <- ds2 %>% 
    count(store, r) %>%
    group_by(store) %>%
    mutate(prop = prop.table(n))

#### Gráficos de barras ####
# (11%) Visualizar df.store 


#png("figura.png")

# (13%*, 30%, 36%, 38%, 40%, 45%, 49%, 60%, 66%) Plotar gráfico de barras
ggplot(df.store, aes(x = store, y = prop, fill = r)) + 
    geom_bar(stat = "identity", color = "black") + 
#    ggtitle("") +
#    labs(x = "", y = "", fill = "") + 
#    scale_x_discrete() + 
#    scale_fill_brewer() + 
    theme_bw()

#dev.off()

# (26%* -- não rodar!) Outro modo de definir os parâmetros estéticos: aes() em geom_bar()
ggplot(df.store) +
    geom_bar(aes(x = store, y = prop, fill = r), stat = "identity", color = "black")

# (57%) Paleta de cores do RColorBrewer


### Gráfico de Linhas####

# (83%, 85%, 87%) Plotar gráfico de linhas
ggplot(df.store, aes(x = store, y = prop * 100, group = r)) + 
    geom_line(linetype = "dotted", size = 1, color = "blue") + 
#    geom_point(shape = , size = , fill = "") + 
    ggtitle("Proporção das variantes de /r/ pós-vocálico em três lojas de departamento \nem Nova Iorque (N = 730)") +
    labs(x = "Lojas", y = "Proporção", fill = "Variantes de /r/") + 
    scale_x_discrete(labels = c("Saks", "Macy's", "S. Klein")) + 
#    ylim() +
    theme_bw()

# (89%-91%) Plotar gráfico de linhas apenas com dados de r0


    
### Mais sobre como exportar gráficos ###
# Definir arquivo a ser exportado
png("figura.png",
    width = 480,
    height = 480,
    units = "px",
    res = 300) #a resolução pode ser mudada aqui

# Plotar figura

# Fechar o dispositivo de exportação de figuras
dev.off()


