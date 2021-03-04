#################################################################
### Introdução à Estatística para Linguística, v2.0, jan/2021 ###
######                     L. Oushiro                      ######
######          Lição 13: Regressão Linear Parte 2         ######
######                 Lista de Exercícios                 ######
#################################################################

##Carregar os dados da planilha Pretonicas.csv. Se nao tiver esse arquivo de dados, refaca a Licao 6 do curso Introducao a Estatistica para Linguistas - Estatistica Descritiva de Variaveis Numericas Medidas de Tendencias Centrais



###Criar subconjunto de dados somente com a vogal pretonica /o/ 


###Recodificar dados das variaveis CONT.PREC e CONT.SEG com os mesmos criterios da recodificacao para a vogal /e/ (ver arquivo Licao12-IEL.R ou Licao13-IEL.R)



###(Q1): "Considerando como variável previsora a altura da vogal /o/ (F1.NORM), entre quais pares de variáveis há colinearidade? Considere: (i) AMOSTRA; (ii) SEXO; (iii) CONT.PREC; (iv) CONT.SEG; (v) F1.SEG.NORM; (vi) ESTR.SIL.PRET.
#entre (i)-(v) e entre (v)-(vi)
#entre (iii)-(iv) e entre (iii)-(vi)
#entre (iii)-(vi) e entre (iv)-(vi)
#entre (iv)-(v) e entre (ii)-(v)"

#Criar modelo com todas as variaveis


#Aplicar funcao vif() a modelo


#Fazer tabelas de distribuicao de dados entre pares de variaveis com alto GVIF; tabelas com muitas celulas vazias indicam a colinearidade e as combinacoes que nao existem entre os fatores das respectivas variaveis. Use a funcao table().



###(Q2): "Entre qual par de variáveis há interação? Considere: (i) AMOSTRA; (ii) SEXO; (iii) CONT.PREC; (iv) CONT.SEG; (v) F1.SEG.NORM; (vi) ESTR.SIL.PRET.
#entre (i) e (ii)
#entre (ii) e (vi)
#entre (i) e (v)
#entre (iv) e (v)
#entre (iii) e (iv)"

#Criar diferentes modelos lineares com as interacoes indicadas e interpretar tabela de coeficientes



###(Q3): A partir dos dados da vogal /o/ pretônica, crie um modelo com F1.NORM como variável resposta e com todas as variáveis previsoras acima, exceto aquela que é colinear a duas outras variaveis. Inclua a interação identificada na questão (2). Quanto da variação em F1.NORM é explicada por esse modelo?
#8.7%
#23.2%
#24.3%



###(Q4): "Qual variável não apresenta correlação significativa com F1.NORM?
#CONT.PREC
#CONT.SEG
#F1.SEG.NORM
#AMOSTRA
#SEXO
#nenhuma; todas são significativamente correlacionadas"



###(Q5): "Calcule a estimativa de F1.NORM na fala de paraibanas quando a vogal /o/ pretônica é precedida de consoante velar e seguida de consoante palatal-sibilante (p.ex., no item lexical \'gostaria\'."



###(Q6): "Use as funções step() e drop1() para checar se as variáveis do modelo criado acima devem ser mantidas. Os testes com step() e drop1() concordam quanto às variáveis que devem ser mantidas?"

#step forward
#NB: Se aparecer o erro : Error in step(...): The model is not linear mixed effects model, é necessário retirar o pacote lme4 da memoria. Use as seguintes linhas de comando ANTES de rodar a funcao step():
detach("package:lmerTest", unload = T)
detach("package:car", unload = T)
detach("package:lme4", unload = T)


#step backward


#step both


#drop1


###(Q7): "Os testes \'forward\', \'backward\' e \'both\' concordam quanto às variáveis que devem ser mantidas?"



###"A função vif(), do pacote car, infelizmente não se aplica a modelos com interação. Crie um novo modelo com a inclusão das mesmas variáveis do último teste, mas sem a inclusão de interação entre variáveis. Escolha se você vai manter a variável excluída por drop1() ou não. Em seguida, aplique a função crPlot() para testar se há linearidade entre a variável resposta e variável previsora numérica do modelo."
#(Q8): Em qual intervalo da variável previsora há menor concordância entre os valores previstos e os valores observados?
#entre 300 Hz e 350 Hz
#entre 450 Hz e 500 Hz
#entre 350 Hz e 400 Hz
#entre 400 hz e 450 Hz"
#Dica: Crie um novo modelo sem interação e aplique a função crPlot() a ele. Veja e interprete a figura em Plots!



###"Crie um modelo de efeitos mistos, com as variáveis aleatórias INFORMANTE e PALAVRA, e com a inclusão das mesmas variáveis do penúltimo teste -- ou seja, com a interação entre as duas variáveis identificada na questão (2). Não se assuste pois o R mostrará alguns avisos de que certas combinações entre fatores de variáveis não existem."
#(Q9): "Qual variável abaixo não apresenta correlação significativa com F1.NORM no modelo de efeitos mistos?
#CONT.SEG
#F1.SEG.NORM
#CONT.PREC
#AMOSTRA
#todas as variáveis são significativamente correlacionadas"
