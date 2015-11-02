## Stuff to interact with a database.

require(RMySQL)

## some system acra dabra needed for correct query results.
Sys.setlocale("LC_ALL","C") 

## set properties according to situation at hand
.db.host <- "127.0.0.1"
.db.port <- 1505
.db.name <- "farm"
.db.user <- "root"
.db.pass <- ""

## create a connection. it is responsibility of calling method to close the connection.
create.connection <- function() {
        dbConnect(MySQL(), user=.db.user, host=.db.host, port = .db.port, dbname = .db.name)
}

## execute the given query and return the results.
execute.select <- function(query) {
        con <- create.connection()
        rs <- dbSendQuery(con, query)
        dt <- dbFetch(rs, n = -1)
        dbClearResult(rs)
        dbDisconnect(con)
        return(dt)
}