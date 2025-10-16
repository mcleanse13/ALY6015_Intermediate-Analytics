Ames Housing Regression Analysis
Project Overview

This project analyzes the AmesHousing dataset to explore and model relationships between various housing features and sale price. Using regression modeling techniques, the analysis aims to identify key predictors that influence home values while addressing modeling challenges such as multicollinearity, outliers, nonlinearity, and overfitting.

Objectives

Develop and interpret multiple linear regression models using R.

Apply diagnostic techniques to evaluate model performance and assumptions.

Detect and correct issues such as heteroscedasticity and multicollinearity.

Compare candidate models using all-subsets regression and select the optimal one.

Communicate insights through visualizations, summaries, and statistical interpretation.

Dataset Description

Name: AmesHousing.txt
Source: Ames, Iowa Assessor’s Office
Size: 2,930 observations × 82 variables
Description: Contains residential property data from Ames, Iowa, used to estimate assessed values and predict sale prices from 2006–2010.

Variable Types

Nominal: 23

Ordinal: 23

Discrete: 14

Continuous: 20

Identifiers: 2

Key variables include:

SalePrice — Sale price of the house (dependent variable)

Lot.Frontage, Overall.Qual, Year.Built, MS.SubClass — predictor variables used in the regression model

Additional categorical, ordinal, and continuous features describing lot, structure, and quality characteristics

Tools and Methods

Language: R

Key Libraries: ggplot2, corrplot, ggcorrplot, leaps, car, dplyr

Statistical Methods:

Multiple linear regression (lm)

Model diagnostics (residuals, leverage, Q-Q plots)

Variance Inflation Factor (VIF) for multicollinearity

Model selection with all-subsets regression

Analysis Workflow

Data Preprocessing:

Imported the dataset and handled missing values.

Reviewed variable distributions and removed non-informative columns.

Exploratory Data Analysis (EDA):

Generated summary statistics and correlation matrices.

Created heatmaps and scatterplots to visualize relationships.

Regression Modeling:

Built a multiple linear regression model with four predictors:
SalePrice ~ Lot.Frontage + Overall.Qual + Year.Built + MS.SubClass.

Evaluated model fit using R², Adjusted R², and F-statistic.

Diagnostics and Refinement:

Checked residual plots for normality and homoscedasticity.

Calculated VIF values — all were below 5, indicating low multicollinearity.

Identified and examined outliers via residual vs. leverage plots.

Model Comparison:

Refined model to exclude MS.SubClass, improving interpretability.

Confirmed robustness of remaining predictors (Lot.Frontage, Overall.Qual, Year.Built).

Key Findings

Overall Quality had the strongest positive correlation with sale price.

Lot Frontage and Year Built were also significant predictors.

Multicollinearity was minimal across predictors.

Residuals indicated a near-normal distribution with mild heteroscedasticity.

Final model achieved Adjusted R² ≈ 0.685, indicating a good model fit for this dataset.

Deliverables

R Script: Module6_AmesHousing_Regression.R — contains all preprocessing, modeling, and diagnostics code.

Report: AmesHousing_Regression_Report.pdf — includes introduction, analysis, visualizations, interpretations, and references.

Appendix: All R output and plots (correlation matrices, diagnostic charts, regression summaries).

Learning Outcomes

Gained hands-on experience applying regression diagnostics and model selection methods.

Developed proficiency in interpreting regression outputs and residual plots.

Strengthened ability to communicate statistical insights using visual and written reports.

Demonstrated data-driven reasoning to identify meaningful predictors in real estate markets.

References

Ames, Iowa Assessor’s Office (Data Source)

Kuiper, S. (2008). Introduction to Multiple Regression: How Much Is Your Car Worth? Journal of Statistics Education, 16(3).

Pardoe, I. (2008). Modeling Home Prices Using Realtor Data. Journal of Statistics Education, 16(2).

ChatGPT (2024). Model interpretation and code assistance for regression diagnostics.
