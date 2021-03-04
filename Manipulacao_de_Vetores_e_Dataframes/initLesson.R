# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

# Source utilities.R
source(file.path(find.package("swirl"), "Courses", "Introducao_a_Estatistica_para_Linguistas", "R", "utilities.R")) ## para mostrar arquivo .R

# Vetores criados na Lição 1:
x<-4+9
y<-x+10
z<-"gato"
aleatorio<-c(x, y, 230)
numeros<-c(20:39)

# Make path to lesson directory for convenience. Unfortunately 
# this variable will show up in the user's workspace. Alternatively,
# you could retype this file path every time you need it below.
lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "data")

### To make the data available, you have two options:

### 1) Make path to data and let user call read.csv(data_path)
data_path <- file.path(lesson_dir, "DadosRT.csv")

### 2) Load data into a variable for the user
dados <- read_csv(data_path, 
                  col_types = cols(.default = col_factor(),
                                   cont.precedente = col_character(),
                                   ocorrencia = col_character(),
                                   cont.seguinte = col_character(),
                                   IDADE = col_integer(),
                                   INDICE.SOCIO = col_double(),
                                   FREQUENCIA = col_double()
                  )
)


rm(data_path)
rm(lesson_dir)
