library(dplyr)
library(dbplyr)

con_psql <- RPostgreSQL::dbConnect(
  drv = DBI::dbDriver("PostgreSQL"),
  dbname = "dbtest",
  host = "postgres.server",
  user = "dbtest",
  password = "_dbtest_"
)

nycflights13_sql(con_psql)

dbDisconnect(con_psql)

start_capturing(path = "vignettes/")

con_psql <- RPostgreSQL::dbConnect(
  drv = DBI::dbDriver("PostgreSQL"),
  dbname = "dbtest",
  host = "postgres.server",
  user = "dbtest",
  password = "_dbtest_"
)

tbl(con_psql, in_schema("public", "flights")) %>%
  filter(!is.na(tailnum)) %>%
  group_by(tailnum) %>%
  count() %>%
  filter(n >= 10L)

dbDisconnect(con_psql)

stop_capturing()
