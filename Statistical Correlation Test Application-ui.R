########################## PEMBUATAN APLIKASI SEDERHANA DENGAN SHINY ##########################
####################################### KELOMPOK 1 ############################################
############################### SEMANGAT YUK WE CAN DO IT #####################################
library(shiny)
library(DT)
library(csv)
library(readr)
library(csvread)
library(shinyAce)
library(shinythemes)

ui <- fluidPage(
  theme = shinytheme("flatly"),
  tags$head(
    tags$style(HTML("
      body {
        font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        background-color: #f8f9fa;
        color: #2c3e50;
      }
      .header {
        background: linear-gradient(to right, #3498db, #8e44ad);
        color: #ffffff;
        padding: 20px;
        text-align: center;
        border-radius: 10px;
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
      }
      .header img {
        position: absolute;
        left: 20px;
        max-width: 50px;
      }
      .header h1 {
        font-size: 2.5em;
        margin: 0;
      }
      .subheader {
        background: linear-gradient(to right, #8e44ad, #3498db);
        color: #ffffff;
        padding: 15px;
        text-align: center;
        border-radius: 10px;
        margin-bottom: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }
      .content {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
      }
      .sidebar {
        background-color: #ecf0f1;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
      }
      .btn-primary {
        background-color: #3498db;
        border-color: #3498db;
      }
      .btn-primary:hover {
        background-color: #2980b9;
        border-color: #2980b9;
      }
    "))
  ),
  div(class = "header",
      img(src = "UNJ.png", alt = "UNJ Logo"),
      h1("APLIKASI UJI STATISTIK KORELASI")
  ),
  div(class = "subheader",
      h2("Uji Korelasi Pearson | Uji Korelasi Spearman")
  ),
  tabsetPanel(
    tabPanel("Home",
      h4("Website ini merupakan website interaktif yang bertujuan untuk mempermudah akademisi, peneliti, tenaga medis dalam mencari suatu hubungan antar variabel dependen dengan variabel independen."),
      h3("Cara Menggunakan Website"),
      h4("1. Pastikan pengguna menggunakan uji yang sesuai"),
      h4("2. Input data dengan format (.csv)"),
      h4("3. Pilih variabel x dan variabel y yang akan diujikan"),
      h4("4. Kemudian klik 'Hitung Korelasi', maka akan keluar hasil perhitungan Korelasi")
    ),
    tabPanel("Uji Korelasi Pearson", 
             div(class = "content",
                 h3("UJI KORELASI | Uji Korelasi Pearson"),
                 h4("Uji Korelasi Pearson merupakan bentuk analisis inferensial yang digunakan untuk mengetahui derajat atau kekuatan hubungan, bentuk atau hubungan timbal balik di antara variabel dependen dengan variabel independen."),
                 h3("Skala Data"),
                 h4("Skala data bersifat interval atau rasio"),
                 h3("Hipotesis"),
                 h4("H0: Tidak ada hubungan yang signifikan antara variabel independen dan variabel dependen"),
                 h4("H1: Ada hubungan yang signifikan antara variabel independen dan variabel dependen"),
                 h3("Input Data"),
                 div(class = "sidebar",
                     fileInput("data_pearson", label = "Pilih file .csv", accept = c(
                       "text/csv",
                       "text/comma-separated-values",
                       "text/plain",
                       ".csv"
                     )),
                     uiOutput("var_select_ui_pearson"),
                     actionButton("calc_pearson", "Hitung Korelasi", class = "btn btn-primary")
                 ),
                 verbatimTextOutput("pearson_result")
             )
    ),
    tabPanel("Uji Korelasi Spearman", 
             div(class = "content",
                 h3("UJI KORELASI | Uji Korelasi Spearman"),
                 h4("Uji Korelasi Spearman adalah uji statistik untuk menguji 2 variabel yang berdata ordinal atau salah satu variabel berdata ordinal dan lainnya nominal maupun rasio."),
                 h3("Skala Data"),
                 h4("Skala data bisa bersifat interval atau rasio serta bisa juga untuk data yang bersifat ordinal"),
                 h3("Hipotesis"),
                 h4("H0: Tidak ada hubungan yang signifikan antara variabel independen dan variabel dependen"),
                 h4("H1: Ada hubungan yang signifikan antara variabel independen dan variabel dependen"),
                 h3("Input Data"),
                 div(class = "sidebar",
                     fileInput("data_spearman", label = "Pilih file .csv", accept = c(
                       "text/csv",
                       "text/comma-separated-values",
                       "text/plain",
                       ".csv"
                     )),
                     uiOutput("var_select_ui_spearman"),
                     actionButton("calc_spearman", "Hitung Korelasi", class = "btn btn-primary")
                 ),
                 verbatimTextOutput("spearman_result")
             )
    )
  )
)