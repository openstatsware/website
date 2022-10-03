read.members <- function(subset)
{
  ## load packages
  packs.html <- c("knitr", "pander", "dplyr")
  for (i in 1:length(packs.html)){library(packs.html[i], character.only = TRUE)}

  knitr::opts_chunk$set(echo = TRUE)
  panderOptions('table.alignment.default', function(df){ifelse(sapply(df, is.numeric), 'right', 'left')})

  ## read member list
  members <- as.data.frame(read.csv(paste(path, "/data/members.csv", sep = "")))

  ## get subset of member list
  subset <- as.name(subset)
  members.subset <- (members %>%
                       filter(!!subset == 1) %>%
                       select(Firstname, Lastname, Affiliation) %>%
                       arrange(Firstname, Lastname))

  ## output member list
  members.out <- kable(members.subset)
  cat(knit(text = members.out, quiet = TRUE))
}







