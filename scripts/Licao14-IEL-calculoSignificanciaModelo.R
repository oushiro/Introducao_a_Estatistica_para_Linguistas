## Como calcular valor de significância para modelo logístico como um todo

# visualizar dados do modelo
mod1$null.deviance
mod1$deviance
mod1$df.null
mod1$df.residual

# Função pchisq faz teste de qui-quadrado e cálculo de valor-p a partir dos parâmetros acima
pchisq(mod1$null.deviance - mod1$deviance, mod1$df.null - mod1$df.residual, lower.tail=F)