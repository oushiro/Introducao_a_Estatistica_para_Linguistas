#################################################################
### Introdução à Estatística para Linguística, v2.0, jan/2021 ###
######                     L. Oushiro                      ######
######          Lição 12: Regressão Linear Parte 1         ######
######                  Lista de Exercícios                ######
#################################################################

##Carregar os dados da planilha Pretonicas.csv. Se nao tiver esse arquivo de dados, refaca a Licao 6 do curso Introducao a Estatistica para Linguistas - Estatistica Descritiva de Variaveis Numericas Medidas de Tendencias Centrais



###Criar subconjunto de dados somente com a vogal pretonica /o/ (p/ Q1)
#(Q1) Há quantos dados de vogal /o/ pretônica na planilha Pretonicas.csv?


###Recodificar dados das variaveis CONT.PREC e CONT.SEG com os mesmos criterios da recodificacao para a vogal /e/ (p/Q2-Q3)
#(Q2) Há quantos dados de vibrantes no contexto seguinte à vogal pretônica /o/?
#(Q3) Há quantos dados de consoantes labiais no contexto precedente à vogal pretônica /o/?




###Modelo linear 1: F1.NORM ~ AMOSTRA (p/ Q4-Q5)
#(Q4) Crie um modelo linear para testar de há correlação entre a altura da vogal pretônica (F1.NORM) e a origem do falante (AMOSTRA). Há diferença significativa entre paraibanos e paulistanos quanto à sua realização da vogal pretônica /o/?
#(Q5) Neste modelo, a distribuição dos resíduos segue a distribuição normal?



###Boxplot da distribuicao de dados de F1.NORM por AMOSTRA (p/ Q6)
#(Q6) Faça um boxplot da distribuição de F1.NORM por AMOSTRA. Se existem valores atípicos, parece adequado excluir dados cujas medidas de F1.NORM estão acima de qual ponto? 
#450 Hz; 
#550 Hz; 
#600 Hz;
#não há valores atípicos



###Novo subconjunto de dados excluindo valores atípicos extremos (p/ Q7)
#(Q7) Faça um novo subconjunto de dados incluindo apenas aqueles que estão abaixo do limite estipulado na questão anterior. Quantos dados foram efetivamente excluídos?


###Novo modelo linear (1b) F1.NORM ~ AMOSTRA a partir de novo subconjunto de dados criado logo acima na Q7 (p/ Q8)
#(Q8) Refaça a análise para verificar se há correlação entre F1.NORM e AMOSTRA. A nova distribuição de resíduos segue a distribuição normal?

#Grafico de efeitos para AMOSTRA (p/ Q9)
#(Q9) Faça um gráfico de efeitos do modelo acima. Há sobreposição entre os níveis dos intervalos de confiança da variável AMOSTRA?


###Modelo linear (2): F1.NORM ~ CONT.PREC (p/ Q10-Q13)
#(Q10) Crie um modelo que testa se há correlação entre a altura da vogal /o/ pretônica (F1.NORM) e o contexto precedente à vogal (CONT.PREC). Entre quais níveis da variável CONT.PREC há diferença significativa?
#entre labial e dental.alveolar;
#entre palatal.sibilante e labial
#entre velar e palatal.sibilante;
#entre vibrante e labial;


#(Q11) Em quantos Hz a estimativa de F1.NORM para vibrante difere da estimativa do nível de referência?
#(Q12) Qual é a medida média de F1.NORM para a vogal /o/ quando é precedida por uma consoante vibrante?
#(Q13) O quanto da variação em F1.NORM é explicado pela variável CONT.PREC?


###Modelo linear (3): interacao entre AMOSTRA e CONT.PREC? (p/ Q14-Q16)
#(Q14) Teste se há interação entre as variáveis AMOSTRA e CONT.PREC. Neste modelo, há interação entre AMOSTRA e CONT.PREC?
#(Q15) Qual é a medida média de F1.NORM para a vogal /o/ quando precedida de consoante velar na fala de paraibanos?
#(Q16) Qual é a medida média de F1.NORM para a vogal /o/ quando precedida de consoante labial na fala de paulistanos?



###Modelo linear (4): F1.NORM ~ F1.SEG.NORM (p/ Q17-18)
#(Q17) Crie um modelo para testar se há correlação entre a altura da vogal /o/ pretônica (F1.NORM) e a altura da vogal da sílaba seguinte (F1.SEG.NORM). A cada unidade de F1.SEG.NORM, em quanto se modifica a estimativa de F1.NORM?
#(Q18) Calcule a estimativa da medida de F1.NORM quando F1.SEG.NORM tem 450 Hz.




###(As questoes 19-21 independem de script)




