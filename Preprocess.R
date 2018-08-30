library(readr)
setwd("~/Desktop/Task-3---Multiple-Regression")
LucasAndres <- read_csv("~/Desktop/Task3-MLR/LucasAndres.csv")
View(LucasAndres)

#LucasAndres$Dimension <- LucasAndres$Depth*LucasAndres$Width*LucasAndres$Heigth
LucasAndres$Depth <- NULL
LucasAndres$Width <- NULL
LucasAndres$Heigth <- NULL
LucasAndres$X1 <- NULL
LucasAndres$Best_seller_rank <- NULL
LucasAndres$`1Stars` <- NULL
LucasAndres$`5Stars` <- NULL
LucasAndres$`3Stars` <- NULL
LucasAndres$`2Stars`<- NULL
LucasAndres$Environment_Impact <- NULL

LucasAndres$Relative_Price <- NULL
LucasAndres$Product_ID <- NULL
LucasAndres$Dimension <- NULL

#LucasAndres$Dimension[is.na(LucasAndres$Dimension)] <- round(mean(LucasAndres$Dimension, na.rm = TRUE))

LucasAndres <- LucasAndres[-c(2, 23, 34, 35, 36, 37, 38, 39, 40, 41, 50, 73, 33, 98, 99, 102, 104, 105, 109, 113, 114, 145, 146, 152, 160, 175, 205, 210, 211, 214, 216, 224, 225, 226, 228, 235, 238, 241, 242, 245),] #Delete extended warranty points and whenever volume is greater than nsr+psr


View(LucasAndres)

LucasAndresDV<- dummyVars(" ~ .", data = LucasAndres)
LucasAndresDVready <- data.frame(predict(LucasAndresDV, newdata = LucasAndres))




names(LucasAndresDVready)[3] <- paste("product_typeExtended.Warranty")
names(LucasAndresDVready)[4] <- paste("product_typeGame.Console")
names(LucasAndresDVready)[9] <- paste("product_typePrinter.Supplies")


View(LucasAndresDVready)


try <- LucasAndresDVready

try$Product_type<- NULL

corrData <- cor(try)

View(corrData)

corrplot(corrData, method="circle")
corrData

dev.off()
