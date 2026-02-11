# 📊 NBS Business Analytics Club (BAC) Datathon 2025

**Team:** Moomoo and Friends  
**Members:** Kow Zi Ting, Yee Zhe Kai (Matthew), Yee Jia En  
**Event:** Nanyang Business School Business Analytics Club Datathon 2025

## 📖 Overview
This repository contains the source code, datasets, and presentation materials for our submission to the **BAC Datathon 2025**. The competition consisted of two rounds, challenging participants to derive business insights and build predictive models to solve real-world problems using **R** and **Python**.

---

## 📂 Round 1: Preliminary - Consumer Behaviour in E-Commerce
**Theme 1:** Consumer Behaviour in E-Commerce (Customer Segmentation & Prediction)

### 🎯 Objective
To analyze customer data to uncover purchase patterns, segment customers by intent, and recommend targeted marketing strategies to improve retention and revenue.

### 🛠️ Methodology & Analysis
* **Quantitative Analysis (R):**
    * Calculated demographic metrics (Median Age: 34.5 years, Mean Purchase: $275.06).
    * Analyzed 24 distinct product categories and 3 purchase channels (In-Store, Online, Mixed).
* **Customer Segmentation:** Identified 4 key segments based on purchase intent:
    1.  **Impulsive:** Millennials using mobile devices; highly satisfied.
    2.  **Need-based:** Gen Z/Gen X; high purchase frequency.
    3.  **Planned:** Price-sensitive; middle income; discount-oriented.
    4.  **Wants-based:** High income; high satisfaction.
* **Statistical Testing:**
    * Conducted **One-way ANOVA** ($p = 0.0211$), proving a statistically significant relationship between *Purchase Intent* and *Purchase Amount*.
* **Predictive Modeling (Python):**
    * Attempted to classify customers into the 4 segments.
    * **Models Tested:** Classification Tree, XGBoost, Logistic Regression.
    * **Result:** Logistic Regression performed best (~32% accuracy), highlighting the complexity of the behavioral data.

### 💡 Key Recommendations
* **Impulsive Segment:** Optimize advertisements for mobile interfaces.
* **Planned Segment:** Deploy strategic timing for discounts to capture price-sensitive users.
* **Needs-based Segment:** Utilize informative, complex marketing materials as they are "high-value" research-oriented buyers.

---

## 📂 Round 2: Finals - Google Insights (Mobile Reviews)
**Focus:** Mobile Reviews Sentiment Analysis  
**Target Brand:** Google (Pixel Phones)

### 🎯 Objective
To analyze over 50,000 mobile phone reviews to determine Google's market positioning, identify hardware trade-offs, and understand customer sentiment drivers compared to competitors.

### 🛠️ Methodology & Analysis
* **Data Cleaning (R):**
    * Outlier removal for `Age`.
    * Square-root transformation on `Price_USD` to normalize skewed distribution.
* **Exploratory Data Analysis (R):**
    * **Chi-Square Tests:** Confirmed significant associations between *Overall Sentiment* and specific hardware ratings (Battery, Camera, Design, Performance).
    * **PCA (Principal Component Analysis):** Identified a major trade-off in user preference between **Performance** vs. **Battery Life/Camera**.
    * **Competitor Analysis:** Benchmarked Google against Apple, Samsung, and others. Identified **Samsung** as the closest direct competitor in pricing strategy.
* **Machine Learning (Python):**
    * **NLP Pipeline:** TF-IDF Vectorization -> Multinomial Naive Bayes Classifier.
    * **Keyword Extraction:** Extracted top words driving Positive vs. Negative sentiment.

### 💡 Key Findings
* **The "Helpfulness" Correlation:** There is a moderate correlation between higher ratings and "Helpful" votes. Low-rated reviews are often perceived as less helpful rants.
* **Sentiment Drivers:**
    * *Positive:* "Smooth", "Best", "Worth"
    * *Negative:* "Heating", "Returning", "Money", "Disappointed"
* **Strategic Recommendation:** Engineering efforts must balance the Performance vs. Battery trade-off, as this is the primary source of variance in user satisfaction.

---

## 💻 Tech Stack & Dependencies

### R (Used for EDA, Statistical Testing, Visualization)
Required libraries:
```r
install.packages(c("readr", "ggplot2", "ggcorrplot", "dplyr", "stats"))

### Python (Used for Machine Learning, NLP)
Required libraries:

```Bash
pip install pandas scikit-learn numpy xgboost matplotlib seaborn
```



-----
*Submitted to Nanyang Technological University, Business Analytics Club.*
