barplot(dbinom(0:100, 100, 0.5), 
        beside = T, 
        ylim=c(0,0.08), 
        xlab = "N\u00FAmero de caras", 
        ylab = "Probabilidade do evento")
abline(v = 107.5)
mtext("90", side = 1, line = 1, at = 107.5, cex = 0.8, las = 2)


