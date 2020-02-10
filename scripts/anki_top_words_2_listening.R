#!/usr/bin/env Rscript
library(dplyr)
titles = c("example_id", "word_id", "english", "turkish", "explain", "example_en", "example_tr", "mp3_url", "sound")
d0 = readr::read_tsv("/Users/mertnuhoglu/projects/anki_english/decks/anki_top_100_words.tsv", col_names = F) %>%
	setNames(titles)
path = "/Users/mertnuhoglu/Library/Application Support/Anki2/ozgureminnuhoglu/collection.media"
d1 = d0 %>%
	dplyr::select("example_id", "sound", "english_text" = "example_en") %>%
	dplyr::filter(file.exists(sprintf("%s/%s.mp3", path, example_id)))
readr::write_tsv(d1, "anki_listening.tsv", na = "", col_names = F)
