#script para copiar arquivo de dados DadosRT.csv da pasta do curso para atual diretório de trabalho

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "data")
origem <- file.path(lesson_dir, "LabovDS.csv")

new_dir<-getwd()
destino <- file.path(new_dir, "LabovDS.csv") 

file.copy(origem, destino, overwrite = T)

rm(destino)
rm(lesson_dir)
rm(new_dir)
rm(origem)