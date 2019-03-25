library(shiny)
library(rphylotastic)
library(shinythemes)
library(ape)

# function to get tree
getTree <- function(taxa) {
  rphylotastic::taxa_get_otol_tree(taxa)
}

Mammals <- c("Hippopotamus amphibius", "Trichechus manatus", "Tursiops truncatus", "Equus caballus", "Canis lupus", "Pan troglodytes", "Panthera leo")
mams_tree <- getTree(Mammals)

Amphibians <- c("Caecilia thompsoni", "Rhinella marina", "Hyloxalus abditaurantius", "Rhacophorus nigropalmatus", "Ambystoma tigrinum")
amph_tree <- getTree(Amphibians)

Echinoderms <- c("Pisaster ochraceus", "Mesocentrotus franciscanus", "Echinarachnius parma", "Cucumaria miniata")
ech_tree <- getTree(Echinoderms)

Mollusks <- c("Glaucus atlanticus", "Cornu aspersum", "Sepia officinalis", "Octopus vulgaris", "Bithynia tentaculata")
mol_tree <- getTree(Mollusks)


ui <- fluidPage(theme = shinythemes::shinytheme("journal"),
  #app title
    titlePanel("Phylogenies as Models"),

    #input: Groups students can choose from
    fluidRow(
        column(4, align="center",
            selectInput("group", "Choose a group:",
              choices = c("Mammals", "Amphibians", "Echinoderms", "Mollusks"),
              multiple = FALSE)
        )
    ),

      #row to display output
    fluidRow(plotOutput("tree"))
)

server <- function(input, output) {


  output$tree <- renderPlot({

      if (input$groups == "Mammals") {ape::plot.phylo(mams_tree)}

      else if (input$groups == "Amphibians") {ape::plot.phylo(amph_tree)}

      else if (input$groups == "Echinoderms") {ape::plot.phylo(ech_tree)}

      else {ape::plot.phylo(mol_tree)}

    })

}

shinyApp(ui = ui, server = server)
