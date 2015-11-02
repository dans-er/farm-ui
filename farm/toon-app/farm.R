
source("../rdb/mysql.R")

db.profile <- function(fileId) {
        query <- paste("SELECT *",
                       "FROM profile",
                        paste0("WHERE fedora_identifier = '", fileId, "';"),
                       sep="\n")
        data <- execute.select(query)
        if (nrow(data) < 1) {
                return(data.frame(fileId = "not found"))
        }
        data <- t(data)  
        colnames(data) <- c("Profile")
        data
}

db.fitsprofile <- function(fileId) {
        query <- paste("SELECT *",
                       "FROM fitsprofile",
                       paste0("WHERE fedora_identifier = '", fileId, "';"),
                       sep="\n")
        data <- execute.select(query)
        if (nrow(data) < 1) {
                return(data.frame(fileId = "not found"))
        }
        data <- t(data)  
        colnames(data) <- c("Fits Profile")
        data
}

db.fitsmediatype <- function(fileId) {
        query <- paste("SELECT element_name, tool_name, tool_version, value, format, status",
                       "FROM fitsmediatype",
                       paste0("WHERE fedora_identifier = '", fileId, "'"),
                       "ORDER BY element_name;",
                       sep="\n")
        data <- execute.select(query)
        data
}

db.fitsfileinfo <- function(fileId) {
        query <- paste("SELECT element_name, tool_name, tool_version, value, status",
                       "FROM fitsfileinfo",
                       paste0("WHERE fedora_identifier = '", fileId, "'"),
                       "ORDER BY element_name;",
                       sep="\n")
        data <- execute.select(query)
        data
}

db.fitsstatus <- function(fileId) {
        query <- paste("SELECT element_name, tool_name, tool_version, value, status",
                       "FROM fitsfilestatus",
                       paste0("WHERE fedora_identifier = '", fileId, "'"),
                       "ORDER BY element_name;",
                       sep="\n")
        data <- execute.select(query)
        data
}

db.fitstechmd <- function(fileId) {
        query <- paste("SELECT element_name, tool_name, tool_version, value, status",
                       "FROM fitstechmd",
                       paste0("WHERE fedora_identifier = '", fileId, "'"),
                       "ORDER BY element_name;",
                       sep="\n")
        data <- execute.select(query)
        data
}

db.tikaprofile <- function(fileId) {
        query <- paste("SELECT *",
                       "FROM tikaprofile",
                       paste0("WHERE fedora_identifier = '", fileId, "';"),
                       sep="\n")
        data <- execute.select(query)
        if (nrow(data) < 1) {
                return(data.frame(fileId = "not found"))
        }
        data <- t(data)  
        colnames(data) <- c("Tika Profile")
        data
}

db.tikameta <- function(fileId) {
        query <- paste("SELECT meta_name, meta_value",
                       "FROM tikameta",
                       paste0("WHERE fedora_identifier = '", fileId, "'"),
                       "ORDER BY meta_name;",
                       sep="\n")
        data <- execute.select(query)
        data
}

