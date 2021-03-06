# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

# Source utilities.R
source(file.path(find.package("swirl"), "Courses", "Introducao_a_Estatistica_para_Linguistas", "R", "utilities.R")) ## para mostrar arquivo .R

# Make path to lesson directory for convenience. Unfortunately 
# this variable will show up in the user's workspace. Alternatively,
# you could retype this file path every time you need it below.
lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Introducao_a_Estatistica_para_Linguistas", "data")

### To make the data available, you have two options:

### 1) Make path to data and let user call read.csv(data_path)
data_path <- file.path(lesson_dir, "LabovDS.csv")

### 2) Load data into a variable for the user
# Carregar dataframe ds com dados de Labov
ds <- read_csv(data_path, col_types = cols(.default = col_factor()))

# Excluir dados duvidosos `d` 
ds2 <- ds %>%
  filter(r != "d") %>%
  droplevels()

# Tabular frequências e proporções da variável store pela variável r
df.store <- ds2 %>% 
  count(store, r) %>%
  group_by(store) %>%
  mutate(prop = prop.table(n))

rm(ds)
rm(data_path)
rm(lesson_dir)


