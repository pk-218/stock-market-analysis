data <- read.csv("C:\\Users\\PK\\Documents\\TY Odd Semester 2021\\FT\\stock-market-analysis\\data\\ASIANPAINT.csv")

df <- data.frame(lapply(data[4:15], function(x) { as.numeric(gsub(",", "", x)) }))

df <- df[c(2:4,7)]

plot(df$Open, df$High)

split <- sample(seq_len(nrow(df)), size = floor(0.75 * nrow(df)))

trainData <- df[split, ]
testData <- df[-split, ]

model <- lm(High ~ Open, data = trainData)

with(trainData, plot(Open, High))
abline(model, col='red')

summary(model)

prediction <- predict(model, newdata = testData, interval='confidence')

p <- data.frame(prediction, testData$High)


prediction1 <- predict(model, newdata = df, interval='confidence')

p1 <- data.frame(prediction1, df$High)
output <- cbind(Date=data[,3], p1)

write.csv(output,"C:\\Users\\PK\\Documents\\TY Odd Semester 2021\\FT\\stock-market-analysis\\data\\ASIANPAINT_PRED.csv", row.names = FALSE)

