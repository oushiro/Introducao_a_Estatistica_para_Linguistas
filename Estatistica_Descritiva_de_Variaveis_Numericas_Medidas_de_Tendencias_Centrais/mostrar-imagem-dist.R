library(png)

aa <- dev.list()
if (length(aa) != 0) {
  dev.off(dev.list()["RStudioGD"])
}

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "Estatistica_Descritiva_de_Variaveis_Numericas_Medidas_de_Tendencias_Centrais")
data_path <- file.path(lesson_dir, "distributions.png")

img <- readPNG(data_path)

grid::grid.raster(img)

rm(data_path)
rm(img)
rm(lesson_dir)
