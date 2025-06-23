# Turtle Games: Predictive Analytics & Customer Insights

This repository showcases a full-cycle data science project aimed at uncovering the drivers behind customer loyalty at Turtle Games—a global manufacturer and retailer of games and toys. Using customer metadata, reviews, and advanced modeling techniques, this analysis reveals patterns in customer engagement, spending behaviour, and sentiment, offering strategic insights for marketing and product development.
Tools: Python, R, Scikit-learn, NLTK, Statsmodels, ggplot2, Tidyverse

📌 **Business Challenges**
Turtle Games wants to better understand customer loyalty and refine marketing strategies by leveraging data from their loyalty points system (used here as a proxy for sales). Key business questions include:
- What drives loyalty point accumulation?
- Can customers be segmented for targeted campaigns?
- What insights can be drawn from written reviews?
- Is the dataset suitable for predictive modeling?

🧠 **Analytical Workflow**
- Python Data Preparation
- Cleaned and wrangled customer data using Pandas & NumPy
- Standardised columns and removed irrelevant fields (e.g., uniform language/platform values)
- Regression Modelling (Python & R)
- Built linear and multiple linear regression models
- Used OLS and multivariate tests to assess relationships between loyalty points and features like remuneration, spending score, and age
- Found strong positive correlations for remuneration and spending score; weak for age
- Clustering for Segmentation
- Applied K-means clustering (k=5) on spending score and income
- Identified 5 distinct customer groups based on spending and earning profiles
- Used silhouette and elbow methods to confirm cluster quality
- Natural Language Processing
- Cleaned and tokenised review text using NLTK
- Performed sentiment analysis and polarity scoring
- Identified top positive and negative reviews to inform product feedback
- R Statistical Refinement
- Explored variable distributions, skewness, and kurtosis
- Compared regression models and used synthetic data for prediction testing
- Identified impact of demographic features (e.g., gender, education) on loyalty point accumulation

📊 **Key Insights**
- Spending Score & Income Drive Loyalty: Both variables were strong predictors of loyalty points, with regression models explaining 38–45% of variation.
- Customer Segments Uncovered: Five distinct clusters emerged:
- Cluster 3: High earners + high spenders (ideal for premium campaigns)
- Cluster 5: Low earners + low spenders (minimal return segment)
- Gender & Education Trends: Women tend to accumulate more loyalty points; higher education groups show less predictable loyalty behaviour at higher incomes.
- Sentiment Is Largely Positive: NLP indicates overall favorable customer attitudes, but surfacing of negative reviews highlights areas for improvement.

📌 **Strategic Recommendations**
- Introduce Tiered Loyalty Tactics: High-value clusters (esp. Cluster 3) warrant exclusive offers and personalized promotions.
- Refine Customer Review System: Replace open-text fields with structured Likert scales to gather quantifiable sentiment data.
- Address Negative Sentiment Themes: Target low-polarity product categories for refinement or support.
- Rebalance Marketing Budgets: Invest more in segments with high spending score but low current loyalty—particularly Cluster 4 (low income, high spenders).

