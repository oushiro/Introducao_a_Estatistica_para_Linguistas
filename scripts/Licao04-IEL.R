#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######        Lição 04: Variáveis Nominais - Tabelas       ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (5%) Carregar pacote tidyverse


# (7%) Definir diretório de trabalho com setwd()


# (11%) Carregar dataframe ds com dados de Labov


# (12%) Visualizar estrutura de ds


# (18%) Checando total de dados de LabovDS


# (23%*) Tabular frequências da variável r
ds %>% 
  count(r)

# (32% e 36%) Excluir dados duvidosos `d` 


# (34%) Aplicar str() a ds2


# (38%) Tabular frequências da variável r, sem nível `d`


# (39%*) Tabular frequências e proporções da variável r, sem nível `d`
ds2 %>%
  count(r) %>%
  mutate(prop = prop.table(n))

# (41%) Tabular frequências da variável store


# (48%) Tabular frequências da variável store pela variável r


# (52%*) Tabular frequências e proporções da variável store pela variável r
ds2 %>% 
  count(store, r) %>%
  group_by(store) %>%
  mutate(prop = prop.table(n))

# (54%*) Tabular frequências e proporções da variável r pela variável store -- não faz sentido!
ds2 %>% 
  count(r, store) %>%
  group_by(r) %>%
  mutate(prop = prop.table(n))

# (59%) Tabular frequências e proporções de emphasis pela variável r


# (62%) Tabular frequências e proporções de word pela variável r


# Outro modo de fazer tabelas de frequências e de proporções (com instalação base) 
# (70%*) Tabular frequências da variável r
freq.r <- with(ds2, table(r))

# (71%) Visualizar freq.r


# (73%) Tabular as proporções das variantes de /r/ 


# (75%) Visualizar prop.r


# (77%) Tabular frequências da variável store pela variável r


# (79%) Visualizar freq.store


# (84%) Tabular proporções da variável store pela variável r


# (86%) Visualizar prop.store


# (89%) Acessar elemento na 2a linha, 1a coluna de uma tabela


# (91%) Visualizar totais de linhas e colunas

