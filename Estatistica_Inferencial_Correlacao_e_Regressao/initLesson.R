# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

# Source utilities.R
source(file.path(find.package("swirl"), "Courses", "Introducao_a_Estatistica_para_Linguistas", "R", "utilities.R")) ## para mostrar arquivo .R

idade <- c(1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 8, 9, 11, 12, 12)
altura <- c(60, 65, 97, 98, 100, 105, 107, 105, 119, 122, 125, 132, 142, 147, 153)
criancas <- as.data.frame(cbind(idade, altura))

# Make path to lesson directory for convenience. Unfortunately 
# this variable will show up in the user's workspace. Alternatively,
# you could retype this file path every time you need it below.
lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "data")

### To make the data available, you have two options:

### 1) Make path to data and let user call read.csv(data_path)
data_path <- file.path(lesson_dir, "Covariaveis.csv")

### 2) Load data into a variable for the user
cov <- read_csv(data_path)

rm(data_path)
rm(lesson_dir)
rm(idade)
rm(altura)