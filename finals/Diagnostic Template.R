#import data
#the working directory is set to mine so it won't work unless u change it to yours
setwd("C:/Users/zitin/Documents/BAC Datathon/Moomoo and Friends_Finals")
library(readr)
df <- read_csv("Mobile Reviews Sentiment.csv")

#cleaning
# Check structure and summary
str(df)
summary(df)
max(df$age)
hist(df$age, main ="Histogram of Age", xlab = "Age")
#remove outliers
remove_outliers <- function(x) {
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower_bound <- q1 - 1.5 * iqr
  upper_bound <- q3 + 1.5 * iqr
  x[x < lower_bound | x > upper_bound] <- NA
  return(x)
}
df$age_clean <- remove_outliers(df$age)
hist(df$age_clean)

par(mfrow=c(1,1))
hist(log(df$price_usd))
hist(df$price_usd)

df$price_usd_sqrt <- sqrt(df$price_usd)
hist(df$price_usd_sqrt)
print(table(df$brand))

#only want google
google_df <- subset(df, brand == "Google")
hist(google_df$age_clean)

#is there a relation between inferred sentiment and the diff ratings?
#Plotting two-way contingency table (GarageFinish and HeatingQC)
sentimentvsbattery <- table(google_df$sentiment, google_df$battery_life_rating)
#Checking if table is generated correctly
print(sentimentvsbattery)
#Conducting chi-square test of independence
chisq.test(sentimentvsbattery)
#Since the p-value<0.05, we conclude that there likely exists an association between the battery life and overall sentiment

#Plotting two-way contingency table (GarageFinish and HeatingQC)
sentimentvscamera <- table(google_df$sentiment, google_df$camera_rating)
#Checking if table is generated correctly
print(sentimentvscamera)
#Conducting chi-square test of independence
chisq.test(sentimentvscamera)
#Since the p-value<0.05, we conclude that there likely exists an association between the battery life and overall sentiment

#Plotting two-way contingency table (GarageFinish and HeatingQC)
sentimentvsperf <- table(google_df$sentiment, google_df$performance_rating)
#Checking if table is generated correctly
print(sentimentvsperf)
#Conducting chi-square test of independence
chisq.test(sentimentvsperf)
#Since the p-value<0.05, we conclude that there likely exists an association between the battery life and overall sentiment

#Plotting two-way contingency table (GarageFinish and HeatingQC)
sentimentvsdesign <- table(google_df$sentiment, google_df$design_rating)
#Checking if table is generated correctly
print(sentimentvsdesign)
#Conducting chi-square test of independence
chisq.test(sentimentvsdesign)
#Since the p-value<0.05, we conclude that there likely exists an association between the battery life and overall sentiment

#Plotting two-way contingency table (GarageFinish and HeatingQC)
sentimentvsdisplay <- table(google_df$sentiment, google_df$display_rating)
#Checking if table is generated correctly
print(sentimentvsdisplay)
#Conducting chi-square test of independence
chisq.test(sentimentvsdisplay)
#Since the p-value<0.05, we conclude that there likely exists an association between the battery life and overall sentiment

#yes, there is an association for all


#Conducting PCA to find the relevant weights
# Select relevant columns
google_df_subset <- google_df[, c("battery_life_rating", "camera_rating", "performance_rating", "design_rating", "display_rating")]
# PCA Analysis
num_scaled <- scale(google_df_subset)
pca_result <- prcomp(num_scaled, center = TRUE, scale. = TRUE)
# Summary of variance explained
summary(pca_result)
# Checking variable loadings
pca_result$rotation[, 1:3]

#Looking at the relationship between price and rating
#Plotting boxplots
boxplot(google_df$price_usd_sqrt~google_df$rating)

country_table <- table(google_df$sentiment,google_df$country)
barplot(country_table, legend=F, beside=T, main='Sentiment by Country')
source_table <- table(google_df$sentiment,google_df$source)
barplot(source_table, legend=F, beside=T, main='Sentiment by Source')
#amazon and flipcart have slightly higher negative sentiments

#Finding correlations between the continuous variables
# Load necessary libraries
library(ggplot2)
library(ggcorrplot)

# Select relevant columns
df_continuous <- df[, c("age", "price_usd_sqrt", "rating", "battery_life_rating", "camera_rating", "performance_rating","design_rating","display_rating","review_length","word_count","helpful_votes")]

# Compute correlation matrix
cor_matrix <- cor(df_continuous, use = "complete.obs")

# Plot correlation heatmap
ggcorrplot(cor_matrix,
           method = "circle", 
           type = "lower", 
           lab = TRUE, 
           lab_size = 3, 
           colors = c("blue", "white", "red"),
           title = "Correlation Heatmap of Continuous Variables",
           ggtheme = theme_minimal())

#ok rating and helpful_votes have a moderate linear correlation
boxplot(helpful_votes ~ rating, data = google_df,
        xlab = "Rating", ylab = "Helpful Votes",
        main = "Helpful Votes by Rating")
#so the bad ratings are generally not very helpful, just spreading hate, might want to get customers that hate the the product to give more helpful reviews to developers


#google vs competitors in terms of ratings?
competitors_sentiment_table <- table(df$sentiment,df$brand)
barplot(competitors_sentiment_table, legend=T, beside=T, main='Sentiment by Country')
competitors_ratings_table <- table(df$rating,df$brand)
barplot(competitors_ratings_table, legend=F, beside=T, main='Rating by Brand')

#shows that the key market is in the USA, canada and india next most key markets, because these r the people leaving the highest reviews
competitors_country_table <- table(df$country,df$brand)
barplot(competitors_country_table, legend=T, beside=T, main='Sentiment by Source')

#price against competitors
boxplot(price_usd_sqrt ~ brand, data = df,
        xlab = "Brand", ylab = "Price_USD_sqrt",
        main = "Price_USD by Brand")
#main price competitor is samsung!!!!!!


google_samsung_df <- subset(df, brand %in% c("Google", "Samsung"))
competitors_rating_table <- table(google_samsung_df$brand,google_samsung_df$rating)
barplot(competitors_rating_table, legend=F, beside=T, main='Ratings by Brand')
#google higher in 4 and 1, meaning that it should take note of the lower end of its customers




#CLEANING
# Convert YrSold to categorical
house_data$YrSold <- as.factor(house_data$YrSold)
# Check structure and summary
str(house_data)
summary(house_data)
# Check for missing values
colSums(is.na(df))
# Remove rows with NA
df <- na.omit(df)
str(df)
# Outlier removal function
remove_outliers <- function(x) {
  q1 <- quantile(x, 0.25, na.rm = TRUE)
  q3 <- quantile(x, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  lower_bound <- q1 - 1.5 * iqr
  upper_bound <- q3 + 1.5 * iqr
  x[x < lower_bound | x > upper_bound] <- NA
  return(x)
}

#Summary Statistics for CONTINUOUS VARIABLES 
#Histogram of SalePrice
hist(df$SalePrice, main ="Histogram of SalePrice", xlab = "SalePrice")
#Boxplot of SalePrice
boxplot(df$SalePrice,main ="Boxplot of SalePrice")
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

#3.4 Summary statistics for discrete variables
#Barplot of OverallQual
barplot(table(df$OverallQual), 
        main = "Barplot of OverallQual",
        xlab = "Overall Quality", 
        ylab = "Frequency")


#3.5 Summary statistics for the categorical variables
#Barplot of HeatingQC
barplot(table(data$Purchase_Category), 
        main = "Barplot of Purchase Category",
        xlab = "Purchase Category", 
        ylab = "Frequency",
        col="pink")

#Categorical vs Categorical
income_table <- table(data$Income_Level,data$Purchase_Intent)
barplot(income_table, legend=F, beside=T, main='Income Level by Purchase Intent')


#Is the data normally distributed?
xpt<-seq(-10,100,by=0.1)
n_den<-dnorm(xpt,mean(fund_return),sd(fund_return)) #generate a series of points following the mean and sd of the data
#TOTAL AREA OF HISTOGRAM -> width of bins*no of entries = length(fund_return)*10
ypt<-n_den*length(fund_return)*10 #set y points to correspond with area
lines(xpt,ypt,col="blue") #plot normal pdf lines

#METHOD 2: QQPLOTS
qqnorm(fund_return, main="fund_return")
qqline(fund_return,col="blue")
#SLANT UP on right is longer right tail, SLANT DOWN on left is longer left tail
#SLANT DOWN on right is shorter right tail, SLANT UP on left is short left tail
qqnorm(ln_return, main="ln_return")
qqline(ln_return)

#METHOD 3: SHAPIRO WILK TEST
#H0 -> data is normal (proven by large W)
#H1 -> data is NOT normal (proven by small W)
#normally, we take a significance level alpha of 0.05 if not specified
shapiro.test(fund_return) #if p value is lower than significance level, the data is not normal
pos_return<-fund_return[fund_return>0]
ln_return<-log(pos_return)
shapiro.test(ln_return) #since p value is greater than 0.05 here, we conclude data is normal

#METHOD 4: BOX PLOT
outlr = c(1:14,100,500)
#to find out if there are outliers, calculate if the value at Q3+1.5IQR is greater than the max. 
#if max is greater, there are outliers
#if min is smaller than Q1-1.5IQR, there are also outliers

#CLASSIC TECHNIQUE OF determining outlier
#if (x-MEAN)>2 standard deviations (if anything is more than 2 sds away from the mean it is an outlier)
abs(outlr-mean(outlr))>2*sd(outlr)

#BOXPLOT RULE FOR determining outlier
#if x is > Q3+1.5IQR or x<Q1-1.5IQR, then it is an outlier
(outlr>quantile(outlr,0.25)+1.5*IQR(outlr)) | (outlr<quantile(outlr,0.25)-1.5*IQR(outlr))

#plotting the actual boxplots
boxplot(fund_return)
boxplot(ln_return)