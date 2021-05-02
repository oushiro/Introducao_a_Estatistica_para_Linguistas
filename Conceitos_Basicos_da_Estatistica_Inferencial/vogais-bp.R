# Source utilities.R
source(file.path(find.package("swirl"), "Courses", "Introducao_a_Estatistica_para_Linguistas", "R", "utilities.R")) ## para mostrar arquivo .R





#png("vogais-bp.png", width = 600, height = 400)
# (%) Plotar boxplots das medidas de F1.NORM por VOGAL e por AMOSTRA
#ggplot(pretonicas, aes(x = AMOSTRA, y = F1.NORM, color = VOGAL)) +
#  geom_boxplot(notch = TRUE) +
#  scale_y_reverse() + 
#  labs(x = "Amostra", y = "F1 normalizado") +
#  facet_grid(. ~ VOGAL) + 
#  theme_bw() 
#dev.off()

aa <- dev.list()
if (length(aa) != 0) {
  dev.off(dev.list()["RStudioGD"])
}

old_path <- getwd()

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "Conceitos_Basicos_da_Estatistica_Inferencial")

setwd(lesson_dir)

img <- readPNG("vogais-bp.png")
grid::grid.raster(img)

setwd(old_path)

rm(data_path)
rm(img)
rm(lesson_dir)
rm(aa)
rm(old_path)

