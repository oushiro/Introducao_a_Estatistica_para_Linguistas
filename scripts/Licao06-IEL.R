#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######      Lição 06: Medidas de Tendências Centrais       ######
#################################################################

# O hashtag é o caractere de comentário. Tudo é escrito depois dele é ignorado pelo R. Use-o para fazer anotações que achar necessárias. 

# Para rodar uma linha de comando a partir do script, posicione o cursor em qualquer ponto do comando e pressione CTRL + ENTER. Para rodar uma linha de comando diretamente no Console, pressione ENTER. 

# Leia as instruções no Console e digite as linhas de comando na linha logo abaixo ao texto resumido neste script. Para a maioria dos comandos, você precisará digitá-lo por completo. Atente-se à digitação! Algumas linhas de comando estão parcialmente digitadas, e você precisará fazer modificações em pontos específicos  (_) para torná-la legível ao R. Outras podem já estar prontas (*). Questões de múltipla escolha devem ser respondidas diretamente no Console.


# (3%) Inspecionar notas da turma A


# (5%) Inspecionar notas da turma B


# (6%) Calcular a média da turma A com as funções sum() e length()


# (8%) Calcular a média da turma B com as funções sum() e length()


# (10%) Calcular a média da turma A


# (11%) Calcular a média da turma B


# (16%) Colocar as notas da turma A em ordem crescente


# (17%) Colocar as notas da turma B em ordem crescente


# (19%) Calcular a mediana da turma A


# (21%) Calcular a mediana da turma B


# (24%) Calcular a moda da turma A


# (25%) Calcular a moda da turma B


# (38%) Acrescentar um zero a notas_turmaA


# (40%) Acrescentar um zero a notas_turmaB


# (41%) Recalcular a média da turma A (notas_turmaA2)


# (43%) Recalcular a média da turma B (notas_turmaB2)


# (51%) Calcular a variância da turma A


# (52%) Calcular a variância da turma B


# (56%) Calcular desvio padrão da turma A


# (57%) Calcular desvio padrão da turma B


# (60%) Calcular erro padrão da turma A 


# (62%) Calcular erro padrão da turma B 


# (67%) Definir novo diretório de trabalho para cópia da planilha Pretonicas.csv


# (70%) Carregar pacote tidyverse


# (71%) Carregar dados da planilha Pretonicas.csv no df `pretonicas`



# (73%) Checar estrutura do df pretonicas


# (75%) Aplicar função summary() a pretonicas


# (89%_) Calcular média dos valores de F1 por AMOSTRA e VOGAL
df %>%
  group_by(VAR, VAR) %>%
  summarize(nomeVar = mean(VAR)) 

# (92%) Calcular média dos valores de F1 por VOGAL e AMOSTRA



# (95%) Calcular média, mediana e desvio padrão dos valores de F1 por AMOSTRA + VOGAL


