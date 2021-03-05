#aa <- dev.list()
#if (length(aa) != 0) {
#  dev.off(dev.list()["RStudioGD"])
#}

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "Estatistica_Inferencial_Regressao_Linear_Parte2")
data_path <- file.path(lesson_dir, "fig-tabelaWalkeral.png")

dev.off()
img <- readPNG(data_path)

grid::grid.raster(img)

rm(data_path)
rm(img)
rm(lesson_dir)