#################################################################
### Introdução à Estatística para Linguística, v2.0, jan/2021 ###
######                     L. Oushiro                      ######
######          Lição 11: Correlação e Regressão           ######
######                    Demonstrações                    ######
#################################################################

###Calculo do r de Pearson

idade<-c(1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 8, 9, 11, 12, 12)
altura<-c(60, 65, 97, 98, 100, 105, 107, 105, 119, 122, 125, 132, 142, 147, 153)

#numero de observacoes
n <- 15

#soma dos valores da variavel x
SX <- sum(idade)

#soma dos valores da variavel y
SY <- sum(altura)

#soma dos valores da variavel x elevados ao quadrado
S.X2 <- sum(idade^2)

#soma dos valores da variavel y elevados ao quadro
S.Y2 <- sum(altura^2)

#soma de x * y
XY <- idade * altura
SXY <- sum(XY)

#r de Pearson
r <- ((n * SXY) - (SX*SY)) / sqrt(((n*S.X2)-(SX^2))*((n*S.Y2)-(SY^2)))
r

#comparar com cor.test:
cor.test(altura, idade)


###Calculo de R^2 ajustado:

#valor de R^2
R2 <- 0.943201

#numero de observacoes
n <- 15

#numero de variaveis independentes / predictors
k <- 1

#formula de R^2 ajustado
1 - (1-R2) * ((n-1)/(n-k-1))




