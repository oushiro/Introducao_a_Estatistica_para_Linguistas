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
data_path <- file.path(lesson_dir, "DadosRT.csv")

### 2) Load data into a variable for the user
dados <- read_csv(data_path, 
                  col_types = cols(.default = col_factor(),
                                   VD = col_factor(levels = c("tepe", "retroflexo")),
                                   FAIXA.ETARIA = col_factor(levels = c("1a", "2a", "3a")),
                                   REGIAO = col_factor(levels = c("central", "periferica")),
                                   CONT.FON.PREC = col_factor(levels = c("i", "e", "3", "a", "0", "o", "u")),
                                   TONICIDADE = col_factor(levels = c("atona", "tonica")),
                                   POSICAO.R = col_factor(levels = c("final", "medial")),
                                   CLASSE.MORFOLOGICA = col_factor(levels = c("adjetivo", "adverbio", "conj.prep", "morf.inf", "substantivo", "verbo")),
                                   IDADE = col_integer(),
                                   INDICE.SOCIO = col_double(),
                                   FREQUENCIA = col_double()
                  )
)

dados$CONT.FON.SEG <- fct_collapse(dados$CONT.FON.SEG,
                                   pausa = "#",
                                   coronal = c("t", "d", "s", "z", "x", "j", "ts", "dz", "l", "n"),
                                   labial = c("p", "b", "f", "v", "m"),
                                   dorsal = c("k", "g", "h")
)

dados$CONT.FON.SEG <- fct_relevel(dados$CONT.FON.SEG, "pausa", "coronal", "dorsal", "labial")


###Funções úteis (Gries 2013)
logit <- function(x) { 
  log(x/(1-x)) 
}

ilogit <- function(x) { 
  1/(1+exp(-x)) 
}


rm(data_path)
rm(lesson_dir)