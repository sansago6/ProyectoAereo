rm(list=ls())

# Librerías en uso:
library(readxl)
library(tidyverse)
library(Matrix)

options(scipen = 999)

## Cambio de directorio de origen:
#setwd("C:/Users/SANTIAGOSA/OneDrive - Inter-American Development Bank Group/_IDB/Conocimiento/ProyectoAereo/")
#data <- read_excel("Covid-19/Logistica/LogisticaAereo/Input/2000-2018LAC Annual Cargo.xlsx")
data <- read_excel("Input/2000-2018LAC Annual Cargo.xlsx")
ciudades <- read_csv("Input/airports.csv")


##### Organización de la tabla:
tab <- table(ciudades$iso_country, ciudades$continent)

tab2 <- as.matrix.data.frame(tab, rownames.force = c("AF", "AN", "AS", "EU", "OC", "SA"))

?as.matrix.data.frame

ciudades <- subset(ciudades, continent=="AN" | continent=="SA")



ciudades <- subset(ciudades, !municipality=="NA")
ciudades2 <- ciudades[,c( "continent",  "iso_country", "municipality", "iata_code", "type", "latitude_deg", "longitude_deg", "elevation_ft","scheduled_service", "iso_region")]

