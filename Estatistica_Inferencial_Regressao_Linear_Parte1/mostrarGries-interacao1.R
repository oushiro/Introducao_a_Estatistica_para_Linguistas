aa <- dev.list()
if (length(aa) != 0) {
  dev.off(dev.list()["RStudioGD"])
}

old_path <- getwd()

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "Estatistica_Inferencial_Regressao_Linear_Parte1")

setwd(lesson_dir)

#data_path <- file.path(lesson_dir, "Fig1interacao.png")

img <- readPNG("Fig1interacao.png")
grid::grid.raster(img)

setwd(old_path)

rm(data_path)
rm(img)
rm(lesson_dir)
rm(old_path)