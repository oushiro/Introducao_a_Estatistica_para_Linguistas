cores <- c(rep("gray", x), rep("red", 101-x))
aa<-barplot(dbinom(0:100, 100, 0.5), 
        beside = T, 
        ylim=c(0,0.08), 
        xlab = "N\u00FAmero de caras", 
        ylab = "Probabilidade do evento")
barplot(dbinom(0:100, 100, 0.5), 
        beside = T, 
        ylim=c(0,0.08), 
        xlab = "N\u00FAmero de caras", 
        ylab = "Probabilidade do evento",
        col = cores)
abline(v = (aa[59]+aa[58])/2, col = "blue")
mtext("58", side = 1, line = 1, at = aa[59], cex = 0.8, las = 2, col = "blue")

abline(v = 107.5)
mtext("90", side = 1, line = 1, at = 107.5, cex = 0.8, las = 2)

abline(v = (aa[x+1]+aa[x])/2, col = "red")
mtext(as.character(x), side = 1, line = 1, at = aa[x+1], cex = 0.8, las = 2, col = "red")

rm(cores)
rm(aa)