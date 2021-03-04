aa<-barplot(dbinom(0:100, 100, 0.5), 
            beside = T, 
            ylim=c(0,0.08), 
            xlab = "N\u00FAmero de caras", 
            ylab = "Probabilidade do evento")
cores <- c(rep("gray", 58), rep("blue", 43))
barplot(dbinom(0:100, 100, 0.5), 
        beside = T, 
        ylim=c(0,0.08), 
        xlab = "N\u00FAmero de caras", 
        ylab = "Probabilidade do evento",
        col = cores,
        cex.main = .9)
abline(v = (aa[59]+aa[58])/2, col = "blue")
mtext("58", side = 1, line = 1, at = aa[59], cex = 0.8, las = 2, col = "blue")

abline(v = 107.5)
mtext("90", side = 1, line = 1, at = 107.5, cex = 0.8, las = 2)

rm(cores)
rm(aa)
