library(dplyr)
questions = readLines("questions")
choices = readLines("choices")

ids = sprintf("ch05_%04d", 1:length(questions))
title1 = "ch05"
title2 = "Get it right"
title3 = "Complete the sentences"
images = readLines("images")
audios = ""
audiotexts = ""
tags = "joke"

t0 = paste(ids, title1, title2, title3, questions, choices, images, audios, audiotexts, tags, sep = ";")
writeLines(t0, "anki.txt")
print("OUTPUT: anki.txt")

