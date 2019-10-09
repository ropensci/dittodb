#' Create an in-memory SQLite database for testing
#'
#' @return The function returns the summary of the estimated gravity model as an
#' @export
#'
#' @examples
#' nycflights13_sqlite()

nycflights13_sqlite <- function() {
  nycflights13_db <- src_sqlite("nycflights13/nycflights13.sqlite", create = TRUE)

  copy_to(nycflights13_db, nycflights13::flights,
          name = "flights",
          indexes = list(
            c("year", "month", "day"),
            "carrier",
            "tailnum"
          ),
          temporary = FALSE)

  copy_to(nycflights13_db, nycflights13::airlines,
          name = "airlines",
          indexes = list("carrier"),
          temporary = FALSE
          )

  return(nycflights13_db)
}

# Tests ---

library(dplyr)
library(nycflights13)

d <- nycflights13_sqlite()

flights_sqlite <- tbl(d, "flights")
airlines_sqlite <- tbl(d, "airlines")

# top airlines in terms of number of flights
top_airlines <- flights_sqlite %>%
  group_by(carrier) %>%
  summarize(n = n()) %>%
  arrange(desc(n))

top_airlines

top_airlines <- top_airlines %>% left_join(airlines_sqlite,  by = "carrier")
top_airlines
