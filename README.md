# Statistical Correlation Test Application

A simple statistical application developed using R Shiny to perform Pearson and Spearman correlation tests through an interactive user interface.

## Project Overview

This project was developed to provide a simple interface for conducting correlation analysis without requiring users to manually write statistical code.

Users can upload a dataset in CSV format, select two variables, choose the appropriate correlation test, and view the statistical test results directly from the application.

The application currently supports:

- Pearson Correlation Test
- Spearman Correlation Test

## Features

- Upload dataset in `.csv` format
- Select Variable X and Variable Y
- Perform Pearson correlation analysis
- Perform Spearman correlation analysis
- Display statistical test results directly in the application
- Separate interfaces for Pearson and Spearman correlation tests
- Basic information about each correlation test and its hypotheses

## Statistical Methods

### Pearson Correlation

Pearson correlation is used to evaluate the linear relationship between two numerical variables.

The application performs the Pearson correlation test using:

```r
cor.test(x, y, method = "pearson")
