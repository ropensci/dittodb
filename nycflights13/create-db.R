library(nycflights13)
library(dplyr)

db <- src_sqlite("nycflights13/nycflights13.sqlite", create = TRUE)

# flights ----

flights_sqlite <-
  copy_to(
    db, nycflights13::flights,
    name = "flights",
    temporary = FALSE,
    indexes = list(
      c("year", "month", "day"),
      "carrier",
      "tailnum"
    ))

flights_sqlite <- tbl(db, "flights")
flights_sqlite

# airlines ----

airlines_sqlite <- copy_to(db, airlines)

# top airlines in terms of number of flights
top_airlines <- flights_sqlite %>%
  group_by(carrier) %>%
  summarize(n = n()) %>%
  arrange(desc(n))
top_airlines

# joins ----

top_airlines <- top_airlines %>% left_join(airlines_sqlite,  by = "carrier")
top_airlines
