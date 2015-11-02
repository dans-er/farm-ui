library(shiny)


shinyUI(
        navbarPage(textOutput("navbar"),
                   tabPanel("profile", h3("^"),
                            h3(textOutput("filepath")),
                            # links
                            fluidRow(
                                    column(1, htmlOutput("easy.ds")),
                                    column(1, htmlOutput("oai.pmh")),
                                    column(3, htmlOutput("easy.file"))
                                    
                            ),
                            hr(),
                            fluidRow(
                                    column(3, textInput("id", label = h5("File ID")),
                                              submitButton("Zoek")),
                                    column(6, tableOutput("tbl.profile"))
                            ),
                            fluidRow(column(3, ""),
                                    column(8, includeHTML("profile.html"))),
                            helpText("De link naar het bestand werkt alleen als je bent ingelogd bij EASY als archivaris."),
                            hr()
                   ),
                   tabPanel("fits", h3("^"),
                            h3(textOutput("filepath2")),
                            downloadButton('downloadFits', 'Download'),
                            hr(),
                            tableOutput("tbl.fitsprofile"),
                            h4(a("Identification", href="http://projects.iq.harvard.edu/fits/fits-xml#identification", target="_blank")),
                            tableOutput("tbl.fitsmediatype"),
                            h4(a("Fileinfo", href="http://projects.iq.harvard.edu/fits/fits-xml#fileinfo", target="_blank")),
                            tableOutput("tbl.fitsinfo"),
                            h4(a("Filestatus", href="http://projects.iq.harvard.edu/fits/fits-xml#filestatus", target="_blank")),
                            tableOutput("tbl.fitsstatus"),
                            h4(a("Technical metadata", href="http://projects.iq.harvard.edu/fits/fits-xml#metadata", target="_blank")),
                            tableOutput("tbl.fitstechmd"),
                            hr()
                   ),
                   tabPanel("tika", h3("^"),
                            h3(textOutput("filepath3")),
                            hr(),
                            tableOutput("tbl.tikaprofile"),
                            h4("Tika Metadata"),
                            tableOutput("tbl.tikameta"),
                            hr()
                   ),
                   position="fixed-top",
                   
                   windowTitle="File viewer"
        )
        
)