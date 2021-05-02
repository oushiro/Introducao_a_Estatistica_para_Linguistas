aa <- dev.list()
if (length(aa) != 0) {
  dev.off(dev.list()["RStudioGD"])
}

old_path <- getwd()

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "Estatistica_Inferencial_Regressao_Linear_Parte2")

setwd(lesson_dir)

#data_path <- file.path(lesson_dir, "fig-tabelaWalkeral.png")

img <- readPNG("fig-tabelaWalkeral.png")
grid::grid.raster(img)

setwd(old_path)

rm(data_path)
rm(img)
rm(lesson_dir)
rm(aa)
rm(old_path)