###fetch dados da pasta fundamentos
# Source utilities.R
#source(file.path(find.package("swirl"), "Courses", "Introducao_a_Estatistica_para_Linguistas", "R", "utilities.R")) ## para mostrar arquivo .R

#png("Labov-store.png", width = 600, height = 400)
# (%) Plotar gráfico de barras
#ggplot(df.store, aes(x = store, y = prop * 100, fill = r)) + 
#        geom_bar(stat = "identity", color = "black") + 
#        ggtitle("Proporção das variantes de /r/ pós-vocálico em três lojas de departamento \nem Nova Iorque (N = 730)") +
#        labs(x = "Lojas", y = "Proporção", fill = "Variantes de /r/") + 
#        scale_x_discrete(labels = c("Saks", "Macy\'s", "S. Klein")) + 
#        scale_fill_brewer(palette = "Purples", labels = c("realização", "apagamento")) + 
#        theme_bw()
#dev.off()

aa <- dev.list()
if (length(aa) != 0) {
        dev.off(dev.list()["RStudioGD"])
}

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "Conceitos_Basicos_da_Estatistica_Inferencial")
data_path <- file.path(lesson_dir, "Labov-store.png")

img <- readPNG(data_path)

grid::grid.raster(img)

rm(data_path)
rm(img)
rm(lesson_dir)
rm(aa)

