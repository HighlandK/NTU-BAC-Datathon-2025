#import data
#the working directory is set to mine so it won't work unless u change it to yours
setwd("C:/Users/zitin/Documents/BAC Datathon")
library(readr)
data <- read_csv("Theme 1.csv")

#Calculate the median consumer age
median(data$Age)

#Identify the number of distinct purchase categories
length(unique(data$Purchase_Category))

#Count the number of entries for each category
purchase_cats <- table(data$Purchase_Category) 
table(data$Purchase_Category)
barplot(purchase_cats, main = "Purchase Category Entries", xlab = "Category", ylab = "Frequency", col = "pink")

#Calculate the mean purchase amount
mean(data$Purchase_Amount)
class(data$Purchase_Amount)
data$Purchase_Amount_clean <- as.numeric(gsub("[\\$]", "", data$Purchase_Amount))
mean(data$Purchase_Amount_clean)


#Identify the number of distinct purchase channels
length(unique(data$Purchase_Channel))

#Count the number of entries for each purchase channel. 
table(data$Purchase_Channel)

#Data Cleaning
colSums(is.na(data)) #check for missing values
#Plotting histograms to ascertain distribution of the continuous variables
par(mfrow=c(1,1))
hist(data$Age)
hist(data$Purchase_Amount_clean)
hist(data$Frequency_of_Purchase) #do sth
hist(data$`Time_Spent_on_Product_Research(hours)`)
hist(data$Return_Rate) #does not seem to be in decimal like what the creator suggested, seems like a categorical variable but we dk what it means, ignore
hist(data$Time_to_Decision) # same as freq of purchase
library(MASS)
boxcox_model <- boxcox(lm(Time_to_Decision ~ 1, data = data))
boxcox_model <- boxcox(lm(Frequency_of_Purchase ~ 1, data = data))
#lambda falls close to 1 for both, thus, no transformation needed to normalise the data
#Plotting barplots to ascertain distribution of the categorical variables
barplot(table(data$Gender), 
        main = "Barplot of Gender",
        xlab = "Gender", 
        ylab = "Frequency",
        col="skyblue")
barplot(table(data$Customer_Satisfaction), 
        main = "Barplot of Customer Satisfaction",
        xlab = "Customer Satisfaction", 
        ylab = "Frequency",
        col="pink")
barplot(table(data$Brand_Loyalty), 
        main = "Barplot of Brand Loyalty",
        xlab = "Brand Loyalty", 
        ylab = "Frequency",
        col="yellow")
barplot(table(data$Product_Rating), 
        main = "Barplot of Product Rating",
        xlab = "Product Rating", 
        ylab = "Frequency",
        col="green")
barplot(table(data$Income_Level), 
        main = "Barplot of Income Level",
        xlab = "Income Level", 
        ylab = "Frequency",
        col="skyblue")
barplot(table(data$Marital_Status), 
        main = "Barplot of Marital Status",
        xlab = "Marital Status", 
        ylab = "Frequency",
        col="pink")
barplot(table(data$Education_Level), 
        main = "Barplot of Education Level",
        xlab = "Education Level", 
        ylab = "Frequency",
        col="yellow")
barplot(table(data$Occupation), 
        main = "Barplot of Occupation",
        xlab = "Occupation", 
        ylab = "Frequency",
        col="green")
barplot(table(data$Location), 
        main = "Barplot of Location",
        xlab = "Location", 
        ylab = "Frequency",
        col="skyblue")
barplot(table(data$Purchase_Category), 
        main = "Barplot of Purchase Category",
        xlab = "Purchase Category", 
        ylab = "Frequency",
        col="pink")
barplot(table(data$Purchase_Channel), 
        main = "Barplot of Purchase Channel",
        xlab = "Purchase Channel", 
        ylab = "Frequency",
        col="yellow")
barplot(table(data$Discount_Sensitivity), 
        main = "Barplot of Discount Sensitivity",
        xlab = "Discount Sensitivity", 
        ylab = "Frequency",
        col="green")
barplot(table(data$Engagement_with_Ads), 
        main = "Barplot of Engagement with Ads",
        xlab = "Engagement with Ads", 
        ylab = "Frequency",
        col="skyblue")
barplot(table(data$Device_Used_for_Shopping), 
        main = "Barplot of Device Used for Shopping",
        xlab = "Device Used for Shopping", 
        ylab = "Frequency",
        col="pink")
barplot(table(data$Payment_Method), 
        main = "Barplot of Payment Method",
        xlab = "Payment Method", 
        ylab = "Frequency",
        col="yellow")
barplot(table(data$Discount_Used), 
        main = "Barplot of Discount_Used",
        xlab = "Discount_Used", 
        ylab = "Frequency",
        col="green")
barplot(table(data$Customer_Loyalty_Program_Member), 
        main = "Barplot of Customer Loyalty Program Member",
        xlab = "Customer Loyalty Program Member", 
        ylab = "Frequency",
        col="skyblue")
barplot(table(data$Purchase_Intent), 
        main = "Barplot of Purchase Intent",
        xlab = "Purchase Intent", 
        ylab = "Frequency",
        col="pink")
barplot(table(data$Shipping_Preference), 
        main = "Barplot of Shipping Preference",
        xlab = "Shipping Preference", 
        ylab = "Frequency",
        col="yellow")
barplot(table(data$Social_Media_Influence), 
        main = "Barplot of Social Media Influence",
        xlab = "Social Media Influence", 
        ylab = "Frequency",
        col="green")


#Finding correlations between the continuous variables
# Load necessary libraries
library(ggplot2)
library(ggcorrplot)

# Select relevant columns
df_subset <- data[, c("Purchase_Amount_clean", "Age", "Frequency_of_Purchase", "Time_Spent_on_Product_Research(hours)", "Time_to_Decision")]

# Compute correlation matrix
cor_matrix <- cor(df_subset, use = "complete.obs")

# Plot correlation heatmap
ggcorrplot(cor_matrix,
           method = "circle", 
           type = "lower", 
           lab = TRUE, 
           lab_size = 3, 
           colors = c("blue", "white", "red"),
           title = "Correlation Heatmap with Purchase Amount",
           ggtheme = theme_minimal())
#alright there are no correlations



