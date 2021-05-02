aa <- dev.list()
if (length(aa) != 0) {
  dev.off(dev.list()["RStudioGD"])
}

old_path <- getwd()

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "Estatistica_Inferencial_Testes_de_Proporcao_e_Qui-Quadrado")

setwd(lesson_dir)

#data_path <- file.path(lesson_dir, "x2fig.png")

img <- readPNG("x2fig.png")
grid::grid.raster(img)

setwd(old_path)

rm(data_path)
rm(img)
rm(lesson_dir)
rm(old_path)