library(shiny)
library(rphylotastic)
library(datelife)
library(shinydashboard)

#Need to add instructions
ui <- dashboardPage(
    #tags$style(
    #HTML(".shiny-input-container:not(.shiny-input-container-inline) {
    #[width: 100%;
    #                    }")
    #),
    ## to add google analytics: tags$head(includeScript("google-analytics.js"))
    #tags$a(href='phylotastic.org'),
    dashboardHeader(title="Phylotastic Educational Resources"),
    #tags$img(src='PER.png')), #page title, want to change to .png but this isn't working
    dashboardSidebar(
        sidebarMenu(
            selectInput(inputId = "state",
                        label = "Select the state:", 
                        c("Alabama","Alaska","Arizona","Arkansas","California",
                          "Colorado","Connecticut","Delaware","Florida","Georgia",
                          "Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas",
                          "Kentucky","Louisiana","Maine","Maryland","Massachusetts",
                          "Michigan","Minnesota","Mississippi","Missouri","Montana",
                          "Nebraska","Nevada","New Hampshire","New Jersey","New Mexico",
                          "New York","North Carolina","North Dakota","Ohio","Oklahoma",
                          "Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota",
                          "Tennessee","Texas","Utah","Vermont","Virginia","Washington",
                          "West Virginia","Wisconsin","Wyoming"),
                        multiple = FALSE)),#user can only select one state
        textOutput("state")
    ),
    dashboardBody()
        )
    
  

server <- function(input, output) {
    output$state <- renderText(input$state)
}

shinyApp(ui = ui, server=server)