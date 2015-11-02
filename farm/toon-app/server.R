

source("farm.R")

shinyServer(function(input, output, session) {
        
        getFileId <- function() {
                #input$zkbutton                
                if (nchar(input$id) > 10) {
                        id <- input$id
                } else {                
                        query <- parseQueryString(session$clientData$url_search)
                        id <- query$id
                }
                if (is.null(id)) {
                        id <- "easy-file:100789"
                }
                id
        }
        
        getProfile <- reactive({
                db.profile(getFileId())
        })
        
        getDatasetId <- reactive({
                getProfile()["fmd_dataset_id", ]
        })
        
        getFitsProfile <- reactive({
                db.fitsprofile(getFileId())
        })
        
        getFitsmediatype <- reactive({
                db.fitsmediatype(getFileId())
        })
        
        getFitsfileinfo <- reactive({
                db.fitsfileinfo(getFileId())
        })
        
        getFitsstatus <- reactive({
                db.fitsstatus(getFileId())
        })
        
        getFitstechmd <- reactive({
                db.fitstechmd(getFileId())
        })
        
        getTikaProfile <- reactive({
                db.tikaprofile(getFileId())
        })
        
        getTikaMeta <- reactive({
                db.tikameta(getFileId())
        })
        
        ####### outputs #######
        
        output$navbar <- renderText({ getFileId() })
        
        # profile tab
        
        # Links on top
        # https://easy.dans.knaw.nl/oai/?verb=GetRecord&metadataPrefix=oai_dc&identifier=oai:easy.dans.knaw.nl:easy-dataset:29446
        output$oai.pmh <- renderUI({ 
                HTML(paste0("<a href='https://easy.dans.knaw.nl/oai/?verb=GetRecord&metadataPrefix=oai_dc&identifier=oai:easy.dans.knaw.nl:", 
                                                  getDatasetId(), "' target='_blank'>OAI</a>")) 
        })
        # https://easy.dans.knaw.nl/ui/datasets/id/easy-dataset:29446
        output$easy.ds <- renderUI({ 
                HTML(paste0("<a href='https://easy.dans.knaw.nl/ui/datasets/id/", 
                                               getDatasetId(), "' target='_blank'>EASY</a>")) 
        })
        
        #https://easy.dans.knaw.nl/ui/rest/datasets/easy-dataset:28378/files/easy-file:2634442/content
        output$easy.file <- renderUI({
                HTML(paste0("<a href='https://easy.dans.knaw.nl/ui/rest/datasets/", 
                            getDatasetId(), "/files/", getFileId(), "/content", "' target='_blank'>", getFileId(), "</a>"))
        })
        
          
        output$filepath <- renderText({ 
                paste(getDatasetId(), " | ", getProfile()["fmd_path", ])
        })
        
        output$tbl.profile <- renderTable({
                getProfile()
        })

        # fits tab
        output$filepath2 <- renderText({ 
                paste(getDatasetId(), " | ", getProfile()["fmd_path", ])
        })
        
        output$tbl.fitsprofile <- renderTable({
                getFitsProfile()
        })
        
        output$tbl.fitsinfo <- renderTable({
                getFitsfileinfo()
        })
        
        output$tbl.fitsmediatype <- renderTable({
                getFitsmediatype()
        })
        
        output$tbl.fitsstatus <- renderTable({
                getFitsstatus()
        })
        
        output$tbl.fitstechmd <- renderTable({
                getFitstechmd()
        })
        
        # tika tab
        output$filepath3 <- renderText({ 
                paste(getDatasetId(), " | ", getProfile()["fmd_path", ])
        })
        
        output$tbl.tikaprofile <- renderTable({
                getTikaProfile()
        })
        
        output$tbl.tikameta <- renderTable({
                getTikaMeta()
        })
})
