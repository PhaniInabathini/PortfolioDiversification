# file to analyse stock market data
#download and import the required packages
install.packages("tidyquant")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("ggpubr")
library(tidyquant)
library(tidyverse)
library(ggplot2)
library(ggpubr)

#Downloading data for personal portfolio stocks
tickers <- c('HSBC','SIVB','SBNY','RY','TFC','USB',
             'BNS','PNC','EAF','SEB','AL',
             'LII','GNRC','EXPD','HWM','SPCE','XLI')

# import data of all the stocks currently in my portfolio
hdfc <- tq_get(c("HDFCBANK.BO"), get = "stock.prices",from = "2021-05-01")
reliance <- tq_get(c("RELIANCE.NS"), 
                   get = "stock.prices",from = "2021-05-01") 
