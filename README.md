**📊 BAC Datathon Repository**

**Team:** Moomoo and Friends

**Members:** Kow Zi Ting, Yee Zhe Kai (Matthew), Yee Jia En

**Event:** Nanyang Business School (NBS) Business Analytics Club Datathon 2025

**📖 Overview**

This repository contains the source code, analysis, and findings for both rounds of the BAC Datathon. The competition required participants to derive business insights and build predictive models to solve real-world problems.

**🏆 Competition Structure**

- **Round 1 (Preliminary):** Consumer Behaviour in E-Commerce (Customer Segmentation & Prediction)
- **Round 2 (Finals):** Mobile Reviews Sentiment Analysis (Google vs. Competitors)
-----
**📂 Project 1: Preliminary Round**

**Theme:** Consumer Behaviour in E-Commerce

**Goal:** Analyze customer data to uncover churn drivers, segment customers by purchase intent, and recommend marketing strategies.

**🛠️ Methodology**

- **Quantitative Analysis (R):**
  - Calculated key metrics (Median Consumer Age: 34.5 years, Mean Purchase Amount: $275.06).
  - Identified top product categories (Electronics, Sports & Outdoors) and purchase channels.
- **Exploratory Data Analysis (EDA):**
  - **Segmentation:** Identified 4 key customer segments: *Impulsive, Need-based, Planned, Wants-based*.
  - **Statistical Testing:** Performed **One-way ANOVA** ($p = 0.0211$) to prove a significant relationship between *Purchase Intent* and *Purchase Amount*.
  - **Profiling:** Mapped demographics (Age, Income, Education) to purchase behaviors (e.g., "Impulsive" buyers prefer mobile devices).
- **Predictive Modeling (Python):**
  - Attempted to classify customers into the 4 segments using three models:
    - **Classification Tree:** Accuracy ~25.6%
    - **XGBoost:** Accuracy ~26.4%
    - **Logistic Regression:** Best performer with ~32.0% accuracy.

**📉 Key Business Insights**

- **Needs-based customers** are higher-value targets; marketing to them should be informative and complex.
- **Impulsive buyers** are predominantly Millennials using mobile devices; ads should be optimized for mobile screens.
- **Planned buyers** are price-sensitive; discounts should be timed strategically.
-----
**📂 Project 2: Finals**

**Theme:** Google Insights (Mobile Market)

**Goal:** Analyze 50,000+ mobile phone reviews to determine Google's market positioning and customer sentiment drivers.

**🛠️ Methodology**

- **Data Cleaning (R):**
  - Outlier removal (Age) and Square-root transformation for price normalization.
- **Exploratory Data Analysis (R):**
  - **Chi-Square Tests:** Confirmed associations between sentiment and hardware ratings (Battery, Camera, etc.).
  - **PCA (Principal Component Analysis):** Identified key hardware tradeoffs (e.g., Performance vs. Battery Life).
  - **Competitor Analysis:** Identified **Samsung** as the primary price competitor.
- **Machine Learning (Python):**
  - **NLP:** TF-IDF Vectorization.
  - **Model:** Multinomial Naive Bayes Classifier for sentiment analysis.
  - **Keyword Extraction:** Identified top words driving positive ("smooth", "experience") vs. negative ("heating", "money") sentiment.

**📉 Key Business Insights**

- **The "Unhelpful" Rant:** Found a correlation where low-rated reviews often receive fewer "helpful" votes, suggesting they are often non-constructive rants.
- **Hardware Trade-offs:** Users perceive a strong tradeoff between performance and battery life; engineering efforts should focus on balancing these.
-----
**💻 Tech Stack & Prerequisites**

This project utilizes both **R** and **Python**.

**R Libraries**

R

install.packages(c("readr", "ggplot2", "ggcorrplot", "dplyr"))

**Python Libraries**

Bash

pip install pandas scikit-learn numpy xgboost matplotlib seaborn

**⚠️ Usage Instructions**

**Note on File Paths:**

The scripts in this repository use absolute file paths specific to the author's local machine. Before running any analysis, you **must** update the working directory to match your local environment.

**For R Scripts:**

Look for the setwd() function at the top of the files:

R

\# 🔴 CHANGE THIS to your actual folder path

setwd("C:/path/to/your/repository/Round\_Folder") 

**For Python Scripts:**

Look for the pd.read\_csv() function:

Python

\# 🔴 CHANGE THIS to your actual file path

df = pd.read\_csv('C:/path/to/your/repository/dataset.csv')

-----
*Submitted to Nanyang Technological University, Business Analytics Club.*
