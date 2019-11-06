#
# #
# UsefulColoursList <- c(
#   carbon = "black",
#   silver = "grey",
#   magnesium = "brown",
#   gold = "yellow",
#   aluminium = "orange",
#   rubidium = "red",
#  argon =  "magenta",
#   iodine = "purple",
#   potassium  = "blue",
#   arsenic= "cyan",
#   barium = "springgreen3",
#   uranium = "springgreen4"
# )
# enames <- c(C = "carbon", Ag = "silver", Mg = "magnesium", Au = "gold", Al = "aluminium", Rb = "rubidium",
# Ar = "argon", I = "iodine", K = "potassium", As = "arsenic", Ba = "barium", U = "uranium"
# )
#
# element_pal <- function(x) {
#     test <- grepl(tolower(x), tolower(enames))
#     if (!any(test)) {
#         test <- grepl( tolower(x), tolower(names(enames)))
#         }
#   if (!any(test)) {
#   ind <- x }
#   else {
#   ind <- which(test)
#   }
#   UsefulColoursList[ind]
# }
