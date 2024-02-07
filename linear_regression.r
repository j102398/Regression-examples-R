#Vectors with weight and size data
weight <- c(0.9,1.8,2.4,3.4,3.9,4.4,5.1,5.6,6.3)
size <- c(1.4,2.6,1.0,3.7,5.5,3.2,3.0,4.9,6.3)
#Create the dataframe

mouse.data <- data.frame(weight,size)
#Plot the data, the $ sign means the column from the data frame
plot(mouse.data$weight,mouse.data$size)

#Set up regression model, lm stands for linear model

#Pass through the x value, then y value, then dataframe itself
mouse.regression <- lm(size~weight,data=mouse.data)
#View the summary of the regression
summary(mouse.regression)

#Use the linear regression model to predict the size of a mouse with a given weight
weight_chosen <- 3.1
predicted_size <- predict(mouse.regression, newdata = data.frame(weight = weight_chosen))
print(predicted_size)
