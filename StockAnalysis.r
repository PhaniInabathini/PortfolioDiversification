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
library(quantmod)

#Downloading data for personal portfolio stocks
tickers <- c('HDFCBANK.BO','RELIANCE.NS')

# import data of all the stocks currently in my portfolio
hdfc <- tq_get(c("HDFCBANK.BO"), get = "stock.prices",from = "2021-05-01")
reliance <- tq_get(c("RELIANCE.NS"), 
                   get = "stock.prices",from = "2021-05-01")

View(hdfc)
hdfc %>% ggplot() + 
  geom_line(aes(x = date, y = close),color = "darkblue") + 
  xlab("Year") + ylab("Price")

reliance %>% ggplot() + 
  geom_line(aes(x = date, y = close),color = "darkblue") + 
  xlab("Year") + ylab("Price")
fin.reliance <- tq_get('RELIANCE.NS',get = 'key.ratios')
# Get key ratios for a stock from Morningstar
appl_key_ratios <- tq_get("AAPL", get = "financials")
# as financial data is not available in R directly. Our data will come from python and will be analysed in R.