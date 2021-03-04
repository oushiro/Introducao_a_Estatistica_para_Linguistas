# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

rm(list = ls())

# Source utilities.R
source(file.path(find.package("swirl"), "Courses", "Introducao_a_Estatistica_para_Linguistas", "R", "utilities.R")) ## para mostrar arquivo .R

# Make path to lesson directory for convenience. Unfortunately 
# this variable will show up in the user's workspace. Alternatively,
# you could retype this file path every time you need it below.
lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "data")

### To make the data available, you have two options:

### 1) Make path to data and let user call read.csv(data_path)
data_path <- file.path(lesson_dir, "Pretonicas.csv")

### 2) Load data into a variable for the user
pretonicas <- read_csv(data_path,
                       col_types = cols(.default = col_factor(),
                                        VOGAL = col_factor(levels = c("i", "e", "a", "o", "u")),
                                        F1 = col_double(),
                                        F2 = col_double(),
                                        F1.NORM = col_double(),
                                        F2.NORM = col_double(),
                                        F1.SIL.SEG = col_double(),
                                        F2.SIL.SEG = col_double(),
                                        F1.SEG.NORM = col_double(),
                                        F2.SEG.NORM = col_double(),
                                        DIST.TONICA = col_double(),
                                        Begin.Time.s = col_double(),
                                        End.Time.s = col_double(),
                                        Duration.ms = col_double(),
                                        IDADE = col_integer(),
                                        IDADE.CHEGADA = col_integer(),
                                        ANOS.SP = col_integer()
                       )
)

pretonicas$CONT.PREC <-  fct_collapse(pretonicas$CONT.PREC,
                                      dental.alveolar = c("t", "d", "n", "l"),
                                      labial = c("p", "b", "m", "f", "v"),
                                      palatal.sibilante = c("S", "Z", "L", "s", "z"),
                                      velar = c("k", "g"),
                                      vibrante = c("h", "R")
)

pretonicas$CONT.PREC <- fct_relevel(pretonicas$CONT.PREC, "dental.alveolar", "labial", "palatal.sibilante", "velar", "vibrante")

pretonicas$CONT.SEG <- fct_collapse(pretonicas$CONT.SEG,
                                    dental.alveolar = c("t", "d", "n", "l"),
                                    labial = c("p", "b", "m", "f", "v"),
                                    palatal.sibilante = c("S", "Z", "L", "N", "s", "z"),
                                    velar = c("k", "g"),
                                    vibrante = c("r", "h", "R")
)

pretonicas$CONT.SEG <- fct_relevel(pretonicas$CONT.SEG, "dental.alveolar", "labial", "palatal.sibilante", "velar", "vibrante")

### Criar subconjunto de dados da vogal /e/ pretonica
VOGAL_e <- filter(pretonicas, VOGAL == "e") %>%
  droplevels()

### Retirar valores atípicos
VOGAL_e2 <- filter(VOGAL_e, F1.NORM < 500)


rm(pretonicas)
rm(data_path)
rm(lesson_dir)
rm(VOGAL_e)
