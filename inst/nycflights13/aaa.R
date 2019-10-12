library(DBI)
library(dbplyr)

nycflights13_sql(sqlite = F,
                 Driver   = "PostgreSQL Unicode(x64)",
                 Server   = PARAMETROS[["brmodelos_host"]],
                 Database = "postgres",
                 UID      = PARAMETROS[["brmodelos_usr"]],
                 PWD      = PARAMETROS[["brmodelos_pwd"]],
                 Port     = 5432
)

con <- DBI::dbConnect(odbc::odbc(),
               Driver   = "PostgreSQL Unicode(x64)",
               Server   = PARAMETROS[["brmodelos_host"]],
               Database = "postgres",
               UID      = PARAMETROS[["brmodelos_usr"]],
               PWD      = PARAMETROS[["brmodelos_pwd"]],
               Port     = 5432)

x = nycflights13_sql(type = "sqlite")
