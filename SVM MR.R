svm
set.seed(123)#random seed
inTrain <- createDataPartition(LucasAndresDVready$Volume, p=.75, list=FALSE) #y value


training <- LucasAndresDVready [inTrain, ]
testing <- LucasAndresDVready[-inTrain, ]

training
testing


fitctrl <- trainControl(method="repeatedcv", number=10, repeats=3)



svm_Linear <- train(Volume ~., data = training, method = "svmLinear",
                    trControl=fitctrl,
                    preProcess = c("center", "scale"),
                    tuneLength = 10)

svm_Linear



svmclass <- predict(svm_Linear, newdata = testing)
svmclass

testing$Volume

Error <- (svmclass - testing$Volume)
Error

Errorsq <- (Error)^2
Errorsq

MeanSqError <- mean(Errorsq)
MeanSqError

KNNRMSE <- sqrt(MeanSqError)
KNNRMSE
