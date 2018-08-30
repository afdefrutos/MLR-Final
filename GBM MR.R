GBM

set.seed(123)#random seed
inTrain <- createDataPartition(LucasAndresDVready$Volume, p=.75, list=FALSE) #y value


training <- LucasAndresDVready [inTrain, ]
testing <- LucasAndresDVready[-inTrain, ]

training
testing


fitctrl <- trainControl(method="repeatedcv", number=5, repeats=2)



gbm <- train(Volume ~., data = training, method = "gbm",
                    trControl=fitctrl,
                    preProcess = c("center", "scale"),
                    tuneLength = 10)

gbm



gbmclass <- predict(gbm, newdata = testing)
gbmclass

testing$Volume

Error <- (gbmclass - testing$Volume)
Error

Errorsq <- (Error)^2
Errorsq

MeanSqError <- mean(Errorsq)
MeanSqError

KNNRMSE <- sqrt(MeanSqError)
KNNRMSE
