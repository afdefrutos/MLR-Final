set.seed(123)#random seed
inTrain <- createDataPartition(LucasAndresDVready$Volume, p=.75, list=FALSE) #y value


training <- LucasAndresDVready [inTrain, ]
testing <- LucasAndresDVready[-inTrain, ]



fitctrl <- trainControl(method="repeatedcv", number=10, repeats=3)



rffit <- train(Volume~., data = training, method="rf", trControl=fitctrl, preProcess= c("center", "scale"), tuneLength=20) #preProcess(Survey_Responses, method=c("center", "scale")) #preProcess(Survey_Responses, method="scale"))
rffit



rfclass <- predict(rffit, newdata = testing)


rfclass

testing$Volume

Error <- (rfclass - testing$Volume)
Error

Errorsq <- (Error)^2
Errorsq

MeanSqError <- mean(Errorsq)
MeanSqError

RFRMSE <- sqrt(MeanSqError)
RFRMSE

