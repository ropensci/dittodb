library(DBI)

nycflights13_sqlite("inst/nycflights.sqlite")

flights_db <- dbConnect(
  RSQLite::SQLite(), "inst/nycflights.sqlite"
)

dbSendQuery(flights_db, "DELETE FROM flights WHERE dest NOT IN ('ORD', 'MDW') OR month != 2")
nrow(dbGetQuery(flights_db, "SELECT * FROM flights"))

dbSendQuery(flights_db, "DELETE FROM weather WHERE month != 2")
nrow(dbGetQuery(flights_db, "SELECT * FROM weather"))

dbSendQuery(flights_db, "DELETE FROM planes WHERE tailnum IN (SELECT DISTINCT tailnum FROM flights) IS NULL")
nrow(dbGetQuery(flights_db, "SELECT * FROM planes"))

dbSendQuery(flights_db, "DELETE FROM airlines WHERE carrier NOT IN (SELECT DISTINCT carrier FROM flights)")
nrow(dbGetQuery(flights_db, "SELECT * FROM airlines"))

dbSendQuery(flights_db, "DELETE FROM airports WHERE faa NOT IN ('ORD', 'MDW', 'LGA', 'JFK', 'EWR')")
nrow(dbGetQuery(flights_db, "SELECT * FROM airports"))

dbSendQuery(flights_db, "VACUUM")
dbDisconnect(flights_db)
