aa<-barplot(dbinom(0:100, 100, 0.5), 
            beside = T, 
            ylim=c(0,0.08), 
            xlab = "N\u00FAmero de caras", 
            ylab = "Probabilidade do evento")
par(mar=c(2, 2, 1, 1))
par(mfrow=c(2,1))

cores <- c(rep("gray", 58), rep("blue", 43))
barplot(dbinom(0:100, 100, 0.5), 
        beside = T, 
        ylim=c(0,0.08), 
        xlab = "N\u00FAmero de caras", 
        ylab = "Probabilidade do evento",
        col = cores,
        main = "\u03B1 = 5% em hip\u00F3tese unidirecional",
        cex.main = .9)
abline(v = (aa[59]+aa[58])/2, col = "blue")
mtext("58", side = 1, line = 1, at = aa[59], cex = 0.8, las = 2, col = "blue")

cores2 <- c(rep("forestgreen", 41), rep("gray",19), rep("forestgreen", 41))
barplot(dbinom(0:100, 100, 0.5), 
        beside = T, 
        ylim=c(0,0.08), 
        xlab = "N\u00FAmero de caras", 
        ylab = "Probabilidade do evento",
        col = cores2,
        main = "\u03B1 = 5% em hip\u00F3tese bidirecional",
        cex.main = .9)
abline(v = c((aa[41]+aa[42])/2, (aa[61]+aa[60])/2), col = "forestgreen")
mtext(c("40", "60"), side = 1, line = 1, at = c(aa[41], aa[61]), cex = 0.8, las = 2, col = "forestgreen")


par(mfrow=c(1,1))
par(mar = c(5.1, 4.1, 4.1, 2.1))
rm(cores)
rm(cores2)
rm(aa)
