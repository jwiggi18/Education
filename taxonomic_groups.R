library(shiny)
library(rphylotastic)


Mammals <- c("Hippopotamus amphibius", "Trichechus manatus", "Tursiops truncatus", "Equus caballus", "Canis lupus", "Pan troglodytes", "Panthera leo")
#mams_tree <- rphylotastic::taxa_get_otol_tree(taxa = mams)

Amphibians <- c("Caecilia thompsoni", "Dendrobates leucomelas", "Ambystoma tigrinum")

getTree <- function(taxa) {
  rphylotastic::taxa_get_otol_tree(taxa)
}


groups_list <- c("Mammals", "Dinosaurs", "Amphibians", "Echinoderms", "Mollusks")

ui <- fluidPage(theme = shinythemes::shinytheme("journal"),
    titlePanel("Phylogenies as Models"),
    br(),
    br(),

    fluidRow(
      column(4, align="center",
        selectInput("group", "Choose a group:",
          choices = groups_list, selected = "Mammals", multiple = FALSE)
        )
      ),

    fluidRow(plotOutput("tree"))
)

server <- function(input, output) {
  #output$tree <- renderPlot({ape::plot.phylo(mams_tree)})
  #output$tree <- renderPlot({
    #tree <- getTree(taxa = Mammals)
    #ape::plot.phylo(tree)
  #})
  rGroups <- reactive({
    input$groups
  })

  output$tree <- renderPlot({
    gTree <- (getTree(taxa = rGroups)
    ape::plot.phylo(gTree))
  })


shinyApp(ui = ui, server = server)
