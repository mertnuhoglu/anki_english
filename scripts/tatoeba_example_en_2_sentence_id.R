#!/usr/bin/env Rscript tatoeba_example_en_2_sentence_id.R sentence_ids_eng_ex.tsv example_en.tsv
library(dplyr)
args <- commandArgs(trailingOnly = TRUE)
output_file = args[1]
sentence_ids_eng = args[2]
example_en = args[3]
print(glue::glue("arguments:
								 {args}
								 output_file: {output_file}
								 sentence_ids_eng: {sentence_ids_eng}
								 example_en: {example_en}"))

d1 = readr::read_tsv(sentence_ids_eng, quote = "@")
d3 = readr::read_tsv(example_en, quote = "@")
rs = d3 %>%
	dplyr::left_join(d1, by = "example_en") %>%
	dplyr::mutate(mp3_url = sprintf("https://audio.tatoeba.org/sentences/eng/%s.mp3", id)) %>%
	dplyr::mutate(sound = sprintf("[sound:%s.mp3]", id)) %>%
	dplyr::rename(example_id = id) %>%
	dplyr::mutate(word_id = "", english = "", turkish = "", explain = "") %>%
	dplyr::select(example_id, word_id, english, turkish, explain, example_en, example_tr, mp3_url, sound)
dir.create(path = "gen", recursive = T)
writeLines(rs$mp3_url, "gen/mp3_url")
readr::write_tsv(rs, glue::glue("gen/{output_file}"), na = "", col_names = T)


