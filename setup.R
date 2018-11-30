# setup.R

library(tidyverse, 
        verbose = FALSE, 
        quietly = TRUE, 
        warn.conflicts = FALSE)

build_toc <- function(filename) {
  text <- read_file(filename)
  recipes <- text %>% 
    stringr::str_extract_all("\\n##\\s.+\\n") %>% 
    pluck(1) %>% 
    `[`(-1) %>% 
    stringr::str_replace_all("\\s\\{.*\\}", "") %>%
    stringr::str_replace_all("\\n##\\s", "1. [") %>% 
    stringr::str_replace_all("\\n", "]")
  headers <- paste(recipes, collapse = "\n")
  cat("<div class='col2'>\n", headers, "\n</div>") 
}