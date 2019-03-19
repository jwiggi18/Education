library(shiny)

library(rphylotastic)


mams <- c("Hippopotamus amphibius", "Trichechus manatus", "Tursiops truncatus", "Equus caballus", "Canis lupus", "Pan troglodytes", "Panthera leo")
mams_tree <- rphylotastic::taxa_get_otol_tree(taxa = mams)




groups_list <- c("Mammals", "Dinosaurs", "Amphibians", "Echinoderms", "Mollusks")

ui <- fluidPage(theme = shinythemes::shinytheme("journal"),
    titlePanel("Phylogenies as Models"),
    br(),
    br(),

    fluidRow(
      column(4, align="center",
        selectInput("group", "Choose a group:",
          choices = groups_list, multiple = FALSE)
        )
      ),

    fluidRow(plotOutput("tree"))
)

server <- function(input, output) {
  output$tree <- renderPlot({ape::plot.phylo(mams_tree)})
}

shinyApp(ui = ui, server = server)
