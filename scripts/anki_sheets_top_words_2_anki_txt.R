#!/usr/bin/env Rscript
library(dplyr)
d0 = readr::read_tsv("~/Downloads/anki/tatoeba_sentences/sentence_ids_eng.tsv", quote = "@")
ds = readr::read_tsv("sheets_top_words", quote = "@")
d1 = ds %>%
	dplyr::left_join(d0, by = "example_en") %>%
	dplyr::mutate(mp3_url = sprintf("https://audio.tatoeba.org/sentences/eng/%s.mp3", id)) %>%
	dplyr::mutate(sound = sprintf("[sound:%s.mp3]", id)) %>%
	dplyr::rename(example_id = id) %>%
	dplyr::select(example_id, word_id, english, turkish, explain, example_en, example_tr, mp3_url, sound)
writeLines(d1$mp3_url, "mp3_url")
readr::write_tsv(d1, "anki.tsv", na = "", col_names = F)

