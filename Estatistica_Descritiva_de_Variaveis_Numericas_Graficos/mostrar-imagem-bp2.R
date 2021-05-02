aa <- dev.list()
if (length(aa) != 0) {
  dev.off(dev.list()["RStudioGD"])
}

old_path <- getwd()

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "Estatistica_Descritiva_de_Variaveis_Numericas_Graficos")

#data_path <- file.path(lesson_dir, "bp_licao7.png")

img <- readPNG("bp_licao7.png")
grid::grid.raster(img)

setwd(old_path)

rm(data_path)
rm(img)
rm(lesson_dir)
rm(aa)
rm(old_path)