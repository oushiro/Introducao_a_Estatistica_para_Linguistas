aa <- dev.list()
if (length(aa) != 0) {
  dev.off(dev.list()["RStudioGD"])
}

old_path <- getwd()

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "Estatistica_Inferencial_Regressao_Logistica_Parte1")
setwd(lesson_dir)

#data_path <- file.path(lesson_dir, "Levshina-p265.png")

img <- readPNG("Levshina-p265.png")
grid::grid.raster(img)

setwd(old_path)

rm(data_path)
rm(img)
rm(lesson_dir)
rm(old_path)
rm(aa)