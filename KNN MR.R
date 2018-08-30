install.packages("caret", dependencies = c("Depends", "Suggests"))
#es muy importante instalar los dependencies. Por eso no me funcionaba en un start


install.packages("RcppRoll")
install.packages("broom")

library(caret) #siempre load caret para ver si mi modelo va a servir




set.seed(123)#random seed
inTrain <- createDataPartition(LucasAndresDVready$Volume, p=.75, list=FALSE) #y value


training <- LucasAndresDVready [inTrain, ]
testing <- LucasAndresDVready[-inTrain, ]

training
testing


fitctrl <- trainControl(method="repeatedcv", number=10, repeats=3)



knnfit <- train(Volume~., data = training, method="knn", trControl=fitctrl, preProcess= c("center", "scale"), tuneLength=20) #preProcess(Survey_Responses, method=c("center", "scale")) #preProcess(Survey_Responses, method="scale"))
knnfit



knnclass <- predict(knnfit, newdata = testing)
knnclass

testing$Volume

Error <- (knnclass - testing$Volume)
Error

Errorsq <- (Error)^2
Errorsq

MeanSqError <- mean(Errorsq)
MeanSqError

KNNRMSE <- sqrt(MeanSqError)
KNNRMSE


