## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library(shiny)
library(rphylotastic)
library(datelife)

## ------------------------------------------------------------------------
#Need to add instructions
ui <- fluidPage(
    tags$style(
HTML(".shiny-input-container:not(.shiny-input-container-inline) {
[width: 100%;
                    }")
),
## to add google analytics: tags$head(includeScript("google-analytics.js"))
h1("Phylotastic Educational Resources"), #page title, want to change to .png
h2("Phylogenies of State Symbols"),
selectInput(
                inputId = "state", 
                label = "Select the state:", 
                c("Alabama",
                  "Alaska",
                  "Arizona",
                  "Arkansas",
                  "California",
                  "Colorado",
                  "Connecticut",
                  "Delaware",
                  "Florida",
                  "Georgia",
                  "Hawaii",
                  "Idaho",
                  "Illinois",
                  "Indiana",
                  "Iowa",
                  "Kansas",
                  "Kentucky",
                  "Louisiana",
                  "Maine",
                  "Maryland",
                  "Massachusetts",
                  "Michigan",
                  "Minnesota",
                  "Mississippi",
                  "Missouri",
                  "Montana",
                  "Nebraska",
                  "Nevada",
                  "New Hampshire",
                  "New Jersey",
                  "New Mexico",
                  "New York",
                  "North Carolina",
                  "North Dakota",
                  "Ohio",
                  "Oklahoma",
                  "Oregon",
                  "Pennsylvania",
                  "Rhode Island",
                  "South Carolina",
                  "South Dakota",
                  "Tennessee",
                  "Texas",
                  "Utah",
                  "Vermont",
                  "Virginia",
                  "Washington",
                  "West Virginia",
                  "Wisconsin",
                  "Wyoming"
                  ),
                multiple = FALSE), #user can only select one state
actionButton(inputId = "get", label = "Get Tree", class = "btn btn-primary"))


## ------------------------------------------------------------------------
server <- function(input, output) {}


## ------------------------------------------------------------------------
shinyApp(ui = ui, server=server)

