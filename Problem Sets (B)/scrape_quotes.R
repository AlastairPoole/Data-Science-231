quotes_html <- read_html("https://www.brainyquote.com/topics/fitness-quotes")

quotes <- quotes_html %>%
  html_nodes(".oncl_q") %>%
  html_text() 

person <- quotes_html %>%
  html_nodes(".oncl_a") %>%
  html_text()

# put in data frame with two variables (person and quote)
quotes_dat <- data.frame(quote = quotes, stringsAsFactors = FALSE) %>%
  filter(quote != "\n") %>%
  mutate(person = person
         , together = paste('"', as.character(quote), '" --'
                            , as.character(person), sep=""))
write_csv(quotes_dat, file = "quotes.csv")