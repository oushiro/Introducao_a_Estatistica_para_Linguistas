# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

# Source utilities.R
source(file.path(find.package("swirl"), "Courses", "Introducao_a_Estatistica_para_Linguistas", "R", "utilities.R")) ## para mostrar arquivo .R


notas_turmaA<-c(7.0, 10.0, 10.0, 0.5, 10.0, 8.2, 9.5, 8.1, 5.0, 8.9, 8.2, 7.0, 1.5, 5.5, 9.3, 9.3, 9.3, 1.5, 7.0, 9.5, 6.0, 7.5, 9.9, 8.0, 8.1, 8.8, 2.1, 7.0, 9.0, 0.0, 7.2)

notas_turmaB<-c(6.5, 8.5, 9.4, 7.5, 9.3, 9.9, 9.5, 9.8, 0.0, 0.0)

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}