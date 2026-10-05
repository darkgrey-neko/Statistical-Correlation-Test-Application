library(shiny)
library(csv)
library(csvread)
library(datarium)
library(shiny)
library(DT)

server <- function(input, output, session) {
  
  # Reactive expression to read Pearson data
  data_pearson <- reactive({
    req(input$data_pearson)
    read.csv(input$data_pearson$datapath)
  })
  
  # Dynamically generate UI for Pearson variable selection
  output$var_select_ui_pearson <- renderUI({
    df <- data_pearson()
    varNames <- names(df)
    tagList(
      selectInput("var_x_pearson", "Pilih Variabel X", choices = varNames),
      selectInput("var_y_pearson", "Pilih Variabel Y", choices = varNames)
    )
  })
  
  # Perform Pearson correlation test
  observeEvent(input$calc_pearson, {
    df <- data_pearson()
    var_x <- input$var_x_pearson
    var_y <- input$var_y_pearson
    req(var_x, var_y)
    
    result <- cor.test(df[[var_x]], df[[var_y]], method = "pearson")
    
    output$pearson_result <- renderPrint({
      print(result)
    })
  })
  
  # Reactive expression to read Spearman data
  data_spearman <- reactive({
    req(input$data_spearman)
    read.csv(input$data_spearman$datapath)
  })
  
  # Dynamically generate UI for Spearman variable selection
  output$var_select_ui_spearman <- renderUI({
    df <- data_spearman()
    varNames <- names(df)
    tagList(
      selectInput("var_x_spearman", "Pilih Variabel X", choices = varNames),
      selectInput("var_y_spearman", "Pilih Variabel Y", choices = varNames)
    )
  })
  
  # Perform Spearman correlation test
  observeEvent(input$calc_spearman, {
    df <- data_spearman()
    var_x <- input$var_x_spearman
    var_y <- input$var_y_spearman
    req(var_x, var_y)
    
    result <- cor.test(df[[var_x]], df[[var_y]], method = "spearman")
    
    output$spearman_result <- renderPrint({
      print(result)
    })
  })
}