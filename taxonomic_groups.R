library(shiny)
library(rphylotastic)
library(shinythemes)
library(ape)

# function to get tree
getTree <- function(taxa) {
  rphylotastic::taxa_get_otol_tree(taxa)
}


ui <- fluidPage(theme = shinythemes::shinytheme("journal"),
  #app title
    titlePanel("Phylogenies as Models"),

    #input: Groups students can choose from
    fluidRow(
        column(4,
            selectInput("group", "Choose a group:",
              choices = c("Mammals", "Amphibians", "Echinoderms", "Mollusks"),
              multiple = FALSE)
        )
    ),

      #row to display output
    fluidRow(plotOutput("tree"))
)

server <- function(input, output) {

  Mammals <- c("Hippopotamus amphibius", "Trichechus manatus", "Tursiops truncatus", "Equus caballus", "Canis lupus", "Pan troglodytes", "Panthera leo")
  mams_tree <- getTree(Mammals)
  mams_plot <- ape::plot.phylo(mams_tree)

  Amphibians <- c("Caecilia thompsoni", "Rhinella marina", "Hyloxalus abditaurantius", "Rhacophorus nigropalmatus", "Ambystoma tigrinum")
  amph_tree <- getTree(Amphibians)
  amph_plot <- ape::plot.phylo(amph_tree)

  Echinoderms <- c("Pisaster ochraceus", "Mesocentrotus franciscanus", "Echinarachnius parma", "Cucumaria miniata")
  ech_tree <- getTree(Echinoderms)
  ech_plot <- ape::plot.phylo(ech_tree)

  Mollusks <- c("Glaucus atlanticus", "Cornu aspersum", "Sepia officinalis", "Octopus vulgaris", "Bithynia tentaculata")
  mol_tree <- getTree(Mollusks)
  mol_plot <- ape::plot.phylo(mol_tree)
  
  output$tree <- renderPlot({

      if (input$groups == "Mammals") {print(mams_plot)}

      if (input$groups == "Amphibians") {print(amph_plot)}

      if (input$groups == "Echinoderms") {print(ech_plot)}

      if (input$groups == "Mollusks") {print(mol_plot)}

    })

}

shinyApp(ui = ui, server = server)
