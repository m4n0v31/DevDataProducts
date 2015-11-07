library(shiny)

# Define server logic to generate Star Wars Names
shinyServer(function(input, output) {

  values <- reactiveValues(showWarn = 1)
  
  observe ({
    input$fName
    input$lName
    input$bDate
    values$showWarn <<- 1
  })
  
  observe ({
    input$actionButton
    values$showWarn <<- 0
  })
  
  
  output$text1 <- renderText({ 
    if(input$fName == "" || input$lName == "")
        paste("Please enter all the information (First Name, Last Name and Birthdate)")
    })  
  
  name  <- reactive({
    if(input$fName == "" && input$lName == ""){
      paste("")
    }else{
    paste (substr(input$lName,1,3), substring(input$fName, nchar(input$fName)-1), sep = " - ")
    }
  })

  race  <- reactive({
    races <- c("TWI'LEK", "SULLUSTAN", "JAWA", "ITHORIAN", "MADALORIAN", "HUMAN", "GUNGAN", "EWOK","WOOKIEE","CHISS","GEONOSIAN","HUTT") 
    paste(races[as.numeric(format(as.Date(input$bDate), "%m"))])
  })
  
  occupation  <- reactive({
    occupations <- c("Bounty Hunter", "SITH", "Smuggler", "JEDI", "Pilot", "Scavenger", "Scavenger")
    choice <- ceiling(as.numeric(format(as.Date(input$bDate), "%d"))/5)
    paste(occupations[choice])
  })
  
  output$text2 <- renderText({
    if (values$showWarn){ 
      paste("Press the 'Star Warize Me' button.")}
    else{
      paste("")}
  })  
  
  output$text3 <- renderText({
    if (values$showWarn)""
    else{
      if(input$actionButton){
        isolate(paste(name()))
      }
    }
  })
  
  output$text4 <- renderText({
    if (values$showWarn)""
    else{
      if(input$actionButton){
        isolate(paste("Your race is: ", race()))
      }
    }
  })
  
  output$text5 <- renderText({
    if (values$showWarn)""
    else{
      if(input$actionButton){
        isolate(paste("Your occupation is: ", occupation()))
      }
    }
  })
  

})