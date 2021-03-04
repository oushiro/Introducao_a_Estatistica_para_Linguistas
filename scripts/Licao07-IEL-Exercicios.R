#################################################################
### Introdução à Estatística para Linguística, v2.0, fev/2021 ###
######                     L. Oushiro                      ######
######      Lição 07: Variáveis Numéricas - Gráficos       ######
######               Lista de Exercícios                   ######
#################################################################

# (1) Criar o subconjunto de dados de paraibanos
pretonicas.PBSP <- subset(conjdados, variavel %in% "variante")

# (2) Excluir os níveis de informantes paulistanos da variável INFORMANTE
pretonicas.PBSP$INFORMANTE <- 
  factor(as.character(nomedovetor), 
         exclude = c("AliceM", "AnaS", "LucianoT", "MauricioB", 
                     "NelsonF", "RenataC", "RobsonF"))

# (3) Checar os níveis da variável INFORMANTE
levels(nomedovetor)

# (4) Reorganizar os níveis da variável INFORMANTE: primeiro mulheres, depois homens
pretonicas.PBSP$INFORMANTE <- factor(nomedovetor, levels=levels(nomedovetor)[c(3, 5, 6, 1, 2, 4, 7)])

# (5) Checar os níveis reorganizados da variável INFORMANTE
levels(nomedovetor)

# (6) Criar subconjunto de vogais /e/ de paraibanos
pretonicas.PBSP.e <- subset(conjdados, VARIAVEL %in% "variante")

# (7) Criar subconjunto de vogais /o/ de paraibanos
pretonicas.PBSP.o <- subset(conjdados, VARIAVEL %in% "variante")

# (8) Criar histograma de vogais /e/ não normalizadas de paraibanos
hist(nomedovetor, 
     breaks = ,
     xlim = c(250, 1100),
     ylim = c(, ),
     xlab = "Vogal pretônica /e/",
     ylab = "",
     main = "Distribuição de F1 da vogal pretônica /e/ \n na amostra PBSP",
     col = "")

# (9) Criar histograma de vogais /o/ não normalizadas de paraibanos
hist(nomedovetor, 
     breaks = 15,
     xlim = c(, ),
     ylim = c(0, 90),
     xlab = "",
     ylab = "Frequência",
     main = "Distribuição de F1 da vogal pretônica /o/ \n na amostra PBSP",
     col = "")

# (10) Criar vetor de 7 cores (uma para cada informante) para uso nos boxplots
cores <- c("", "", "", "", "", "", "")

# (11) Plotar boxplots de F1 por INFORMANTE nos dados de vogais /e/ dos paraibanos
boxplot(VD ~ VI,
        data = conjdados, 
        ylim = c(, ), 
        xlab = "Informantes", 
        ylab = "", 
        main = "Distribuição dos valores de F1 \n da vogal /e/ na amostra PBSP", 
        col = cores,
        notch = )

# (12) Plotar boxplots de F1.NORM por INFORMANTE nos dados de vogais /e/ dos paraibanos
boxplot(VD ~ VI,
        data = conjdados, 
        ylim = c(, ), 
        xlab = "Informantes", 
        ylab = "", 
        main = "Distribuição dos valores de F1 normalizados \n da vogal /e/ na amostra PBSP",
        col = cores,
        notch = )

# (13) DESAFIO! Plotar um gráfico de linhas com os espaços vocálicos das mulheres paraibanas (JosaneV, MarinalvaS, MartaS) -- uma linha por informante. Adicionar ainda o espaço vocálico das mulheres paulistanas, como base de comparação. Para as coordenadas, usar as MÉDIAS dos valores de F1.NORM e F2.NORM. O resultado deve algo como a figura que aparece agora em Plots. Fazer tudo isso num script à parte. Envie o arquivo do script para o email da Livia (oushiro@iel.unicamp.br) com linha de assunto "Desafio aceito: espaços vocálicos!" 