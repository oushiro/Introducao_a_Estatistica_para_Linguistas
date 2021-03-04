# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.

mais<-function(){
  cat("\n", "| PARA AL\u00C9M DESTE TUTORIAL")
  cat("\n", "| Este curso foi escrito no swirl. ")
  cat("\n", "| H\u00E1 tamb\u00E9m diversas outras refer\u00EAncias para tratamento de dados")
  cat("\n", "| e an\u00E1lises estat\u00EDsticas para linguistas com o R. ")
  cat("\n", "| Infelizmente, ainda h\u00E1 poucos materiais em portugu\u00EAs...")
  cat("\n", "| Mas vale a pena consultar as fontes abaixo para aprender mais!")
  cat("\n", "\n", "| Digite o nome que vem antes de : para ter mais informa\u00E7\u00F5es (p.ex., swirl). ")
  cat("\n", "| Digite Esc para sair.")
  
  cat("\n", "\n", "swirl: Learn R, in R")
  cat("\n", "   Aprenda R no R -- a linguagem em que este tutorial foi escrito.")
  cat("\n", "tryr: Code School")
  cat("\n", "   Tutorial online de R.")
  cat("\n", "Baayen2008: Analyzing linguistic data")
  cat("\n", "   Manual de R para linguistas.")
  cat("\n", "Chang2013: R Graphics Cookbook")
  cat("\n", "   Manual para fazer lindos gr\u00E1ficos no R.")
  cat("\n", "Crawley2012: The R Book")
  cat("\n", "   A B\u00EDblia do R.")
  cat("\n", "Dalgaard2008: Introductory statistics with R")
  cat("\n", "   \u00D3timo manual de estat\u00EDstica (n\u00E3o voltado para linguistas)")
  cat("\n", "Gigerenzer2004: Mindless statistics")
  cat("\n", "   Artigo no Journal of Socio-Economics 33:587--606.")
  cat("\n", "Gries2013: Statistics for linguistics with R")
  cat("\n", "   Excelente manual de estat\u00EDstica para iniciantes.")
  cat("\n", "Gries2017: Quantitative corpus linguistics with R")
  cat("\n", "   Excelente manual para manipula\u00E7\u00E3o de grandes quantidades de dados textuais.")
  cat("\n", "Levshina2015: How to do Linguistics with R.")
  cat("\n", "   Excelente manual de estat\u00EDstica para linguistas.")
  cat("\n", "Oushiro2014: Tratamento de dados com o R para an\u00E1lises sociolingu\u00EDsticas")
  cat("\n", "   Manual para o pacote dmsocio.")
  
  cat("\n", "Obras: obras citadas no curso")
  
  refs<-99
  while(refs %in% c(0, "swirl", "tryr", "Oushiro2014", "Gries2017", "Gries2013", "Baayen2008", "Dalgaard2008", "Chang2013", "Crawley2012", "Gigerenzer2004", "Levshina2015", "citar.R", "citar.tutorial") == F) {
    refs <- try(readline(prompt="Sele\u00E7\u00E3o: "), silent = T)
    if (refs == 0) swirl()
    if (refs == "swirl") shell.exec("http://swirlstats.com/")
    if (refs == "tryr") shell.exec("http://tryr.codeschool.com/")
    if (refs == "Oushiro2014") shell.exec("http://pdf.blucher.com.br.s3-sa-east-1.amazonaws.com/openaccess/metodologia-sociolinguistica/011.pdf")
    if (refs == "Gries2017") shell.exec("https://www.routledge.com/Quantitative-Corpus-Linguistics-with-R-A-Practical-Introduction-2nd-Edition/Gries/p/book/9781138816275")
    if (refs == "Gries2013") shell.exec("http://www.degruyter.com/view/product/203826")
    if (refs == "Baayen2008") shell.exec("http://www.cambridge.org/br/academic/subjects/languages-linguistics/grammar-and-syntax/analyzing-linguistic-data-practical-introduction-statistics-using-r")
    if (refs == "Dalgaard2008") shell.exec("http://www.springer.com/gp/book/9780387790534")
    if (refs == "Chang2013") shell.exec("http://ase.tufts.edu/bugs/guide/assets/R%20Graphics%20Cookbook.pdf")
    if (refs == "Crawley2012") shell.exec("http://www.wiley.com/WileyCDA/WileyTitle/productCd-0470973927.html")
    if (refs == "Gigerenzer2004") shell.exec("http://library.mpib-berlin.mpg.de/ft/gg/GG_Mindless_2004.pdf")
    if (refs == "Levshina2015") shell.exec("https://benjamins.com/#catalog/books/z.195")
    if (refs == "Obras") obras()
    else {
      mais()
    }
  }
}

obras <- function(){
  cat("\n", "REFERENCIAS \n \n")
  cat("\n", "Barbosa, P.; Madureira, S. (2015) Manual de Fon\u00E9tica Ac\u00FAstica Experimental. Aplicaca\u00E7\u00F5es a Dados do Portugu\u00EAs. S\u00E3o Paulo: Cortez.")
  cat("\n")
  cat("\n", "Labov, W. (1990) The intersection of sex and social class in the course of linguistic change. Language Variation and Change 2, 205-254.")
  cat("\n")
  cat("\n", "Labov, W. (2008 [1972]) Padr\u00F5es Sociolingu\u00EDsticos. S\u00E3o Paulo: Editora Par\u00E1bola.")
  cat("\n")
  cat("\n", "Oushiro, L. (2015) Identidade na pluralidade: avalia\u00E7\u00E3o, produ\u00E7\u00E3o e percep\u00E7\u00E3o lingu\u00EDstica na cidade de S\u00E3o Paulo. Tese de Doutorado. S\u00E3o Paulo: FFLCH/USP.")
  cat("\n\n")
}

