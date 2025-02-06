read.news <- function(how_many = NULL, decreasing = TRUE) {
  # Load packages
  packs.html <- c("glue")
  for (i in seq_along(packs.html)) {
    library(packs.html[i], character.only = TRUE)
  }

  # Import data
  news_data <- read.csv(file = "data/news.csv")
  news_data <- na.omit(news_data)
  news_data$Date <- as.Date(news_data$Date, format = "%m/%d/%Y")

  # Sort
  news_data <- news_data[order(news_data$Date, decreasing = decreasing), ]

  # Determine how many to print
  max_news <- ifelse(is.null(how_many), nrow(news_data), min(how_many, nrow(news_data)))

  # Print
  for (i in seq_len(max_news)) {
    txt <- glue("<p class='lead' style='font-size: 1rem;'><span style='font-weight: bold;'>{news_data$Date[i]}:</span> {news_data$Text[i]}</p>")
    print(txt)
  }
}
