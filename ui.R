library(shiny)
require(markdown)

# Define UI for application that generates your star wars name
shinyUI(
  # Navigation bar
  navbarPage("Star Wars Name Generator",
             # Generate Tab
             tabPanel("Generate",
                      fluidPage(
                        
                        # Application title
                        titlePanel("Star Wars Name Generator"),
                        
                        # Sidebar with a slider input for the number of bins
                        sidebarLayout(
                          sidebarPanel(
                            
                            h2("Usage"),
                            p("We need some information in order to generate you star wars name. Please fill in the fields below:"),
                            br(),
                            
                            textInput("fName", label = h3("First Name"), 
                                      value = ""),
                            
                            textInput("lName", label = h3("Last Name"), 
                                      value = ""),
                            
                            dateInput("bDate", 
                                      label = h3("When were you born?"), 
                                      value = "2000-01-01"),  
                            
                            br(),
                            actionButton("actionButton", label = "Star Warize Me"),
                            
                            br(),
                            br(),
                            em("Note: if you don't believe we are not collecting data... just input invented information!")

                          ),
                          
                          # Show the name generated
                          mainPanel(
                            h2("Your Star Wars Name is:"),
                            p(textOutput("text1")),
                            p(textOutput("text2")),
                            h1(textOutput("text3")),
                            h3(textOutput("text4")),
                            h3(textOutput("text5"))
                            
                          )
                        )
                      )),
             
             # About Tab
             tabPanel("About",
                      mainPanel(
                        includeMarkdown("about.md")
                      )
             )
  ))