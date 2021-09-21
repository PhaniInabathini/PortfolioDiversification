install.packages("rugarch")
# get S&P Data
library(quantmod)
library(e1071)
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
