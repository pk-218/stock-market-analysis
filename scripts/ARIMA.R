library(quantmod)
library(tseries)
library(timeSeries)
library(forecast)
library(xts)

getSymbols("WIPRO.BO", from='2016-10-10', to='2021-10-10')
class(WIPRO.BO)

WIPRO_Close_Prices = WIPRO.BO[, 4]
plot(WIPRO_Close_Prices)

Acf(WIPRO_Close_Prices, main='ACF for Differenced Series')
Pacf(WIPRO_Close_Prices, main='PACF for Differenced Series')

fit = auto.arima(WIPRO_Close_Prices, seasonal=FALSE)
tsdisplay(residuals(fit), lag.max=40)

fcast <- forecast(fit, h=100)
plot(fcast)


