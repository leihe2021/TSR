##-- Load dependency packages ----
library(tidyverse)
library(readxl)
library(shinyWidgets)
library(shiny)
library(shinydashboard)
library(shinycssloaders)
library(ggthemes)
library(RColorBrewer)
library(DT)

source("functions/utils.R")
##-- load data ----
dat <- read_xlsx("data/abo_transfusion.xlsx")
dat$Component_Transfusion <- ifelse(dat$Component_Transfusion == "NA", "", dat$Component_Transfusion)
#table(dat$Component_Transfusion)
dat$Component_Transfusion <- gsub(",", ", ", dat$Component_Transfusion)

btype <- unique(dat$Recipient)

##-- source functions ----
source("functions/utils.R")

##-- source tabs in ui.R ----
tab_files <- list.files(path = "tabs", full.names = T, recursive = T)
tab_files <- tab_files[-grep(x = tab_files, pattern = "server")]
suppressMessages(lapply(tab_files, source))








