library(dplyr)
clozes = readLines("clozes")
images = readLines("images")

tags = "din"

t0 = paste(images, " <br> ", clozes)
t1 = paste(t0, tags, sep = "\t") %>%
	stringr::str_trim()
writeLines(t1, "anki.txt")
print("OUTPUT: anki.txt")


