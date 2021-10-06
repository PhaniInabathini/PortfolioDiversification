install.packages("rugarch")
# get S&P Data
library(quantmod)
library(dplyr)
library(tidyverse)
library(tseries)
library(e1071)
library(xts)
library(PerformanceAnalytics)
library(rugarch)
# Imlementing a GARCH model
getSymbols("SNP",from = "2004-01-01",to = Sys.Date())
chartSeries(Cl(SNP))
ret <- dailyReturn(Cl(SNP), type = 'log')

# ACF and PACF for returns and Squared Returns
par(mfrow = c(2,2))
acf(ret, main = "Return ACF")
pacf(ret, main = "Return PACF")
acf(ret^2, main = "Squared Return ACF")
pacf(ret^2, main = "Squared Return PACF")
par(mfrow=c(1,1))

m=mean(ret);s=sd(ret)
par(mfrow=c(1,2))
hist(ret, nclass = 40, freq = FALSE, main = 'Return Histogram')
curve(dnorm(x,mean = m,sd = s),from = -0.3, to = 0.2, 
      add = TRUE,col = "red")
plot(density(ret),main = 'Return empirical Distribution')
curve(dnorm(x,mean = m,sd = s),from = -0.3, to = 0.2, 
      add = TRUE,col = "red")
par(mfrow=c(1,1))
kurtosis(ret)

#Implementation using AAPL stock data
getSymbols("AAPL",from = '2006-01-01',to = '2018-12-31')
ret.AAPL <- dailyReturn(Cl(AAPL), type = 'log')
chartSeries(ret.AAPL)
#specifications for a GARCH(1,1) model.
garch11.spec <- ugarchspec(variance.model = 
                             list(model = 'sGARCH',
                                  garchOrder = c(1,1)),
                           mean.model = list(armaOrder = c(0,0))
                           )
aapl.garch11.fit <- ugarchfit(spec = garch11.spec,data = ret.AAPL)
coef(aapl.garch11.fit)

########### We are implementing a new model using TESLA stock #############
tesla_df = getSymbols("TSLA",from = '2010-01-01',to = '2020-12-31')

chartSeries(TSLA)
head(TSLA)

#Plotting a 1 month result for Dec 2020
chartSeries(TSLA['2020-12'])
