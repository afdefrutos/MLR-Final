xxx <- read_csv("~/Desktop/Task3-MLR/xxx.csv")

IncLucasAndresDVready <- xxx #already dummified


View(IncLucasAndresDVready)


#not necessary in this case because the file uploaded is already preprocessed. 
IncLucasAndres$Depth <- NULL
IncLucasAndres$Width <- NULL
IncLucasAndres$Heigth <- NULL
IncLucasAndres$X1 <- NULL
IncLucasAndres$X1_1<- NULL
IncLucasAndres$Best_seller_rank <- NULL
IncLucasAndres$`1Stars` <- NULL
IncLucasAndres$`5Stars` <- NULL
IncLucasAndres$`3Stars` <- NULL
IncLucasAndres$`2Stars`<- NULL
IncLucasAndres$Environment_Impact <- NULL

IncLucasAndres$Relative_Price <- NULL
IncLucasAndres$Product_ID <- NULL
IncLucasAndres$Dimension <- NULL

#LucasAndres$Dimension[is.na(LucasAndres$Dimension)] <- round(mean(LucasAndres$Dimension, na.rm = TRUE))








View(IncLucasAndres)

# no puedo dummify por la estructura de mi codigo lo podria volver a run despues. 

IncLucasAndresDV<- dummyVars(" ~.", data = IncLucasAndres) #ya dummified



View(IncLucasAndresDV)


IncLucasAndresDVready <- data.frame(predict(IncLucasAndresDV, newdata = IncLucasAndres))

View(IncLucasAndresDVready)



names(IncLucasAndresDVready)[3] <- paste("product_typeExtended.Warranty")
names(IncLucasAndresDVready)[4] <- paste("product_typeGame.Console")
names(IncLucasAndresDVready)[9] <- paste("product_typePrinter.Supplies")





#KNN
knnpredict <- predict(knnfit, newdata = IncLucasAndresDVready)
knnpredict



IncLucasAndresDVready$SalesVolume <- knnpredict
View(IncLucasAndresDVready)

IncLucasAndresDVready$Volume<- NULL


KNNpredictionscomplete <- IncLucasAndresDVready

View(KNNComplete)

write.csv (x = KNNpredictionscomplete, file = "knnPred2.csv")



#RF

IncLucasAndresDVready$X1 <- NULL
rfpredict <- predict(rffit, newdata = IncLucasAndresDVready)
rfpredict



IncLucasAndresDVready$SalesVolume <- rfpredict
View(IncLucasAndresDVready)

IncLucasAndresDVready$Volume<- NULL


rfpredictionscomplete <- IncLucasAndresDVready

View(IncLucasAndresDVready)

write.csv (x = rfpredictionscomplete, file = "rfFPred3.csv")

