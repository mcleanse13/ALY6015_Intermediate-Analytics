Regularization and Feature Selection in R
Overview

This project explores regularization techniques and feature selection methods in R to improve model performance and interpretability. Using the glmnet package, we implement Ridge and LASSO regression models on datasets from the ISLR library, including the College, mtcars, and Hitters datasets. The primary objective is to predict target variables, assess model performance, and understand the impact of different predictors.

Objectives

Apply Ridge and LASSO regression to linear and logistic models using varying values of the regularization parameter λ (lambda).

Split datasets into training and testing sets to evaluate model performance and avoid overfitting.

Compare models using Root Mean Square Error (RMSE), coefficients analysis, and visualization of λ selection (cv.glmnet).

Implement feature selection methods, including forward selection, backward selection, stepwise selection, and best subset selection using the leaps package.

Compare models using evaluation metrics such as Adjusted R², Mallow’s Cp, AIC, BIC, and ANOVA tests to determine the most predictive and parsimonious models.

Methodology

Data Splitting: Use random sampling and the caret package to create training and testing sets while preserving variable distributions.

Regularization:

Fit Ridge and LASSO regression models using glmnet().

Identify optimal λ values via cross-validation (cv.glmnet) and interpret coefficient shrinkage.

Evaluate model performance with RMSE on both training and test sets.

Feature Selection:

Apply forward, backward, and stepwise selection to identify key predictors.

Use regsubsets() for best subset selection and evaluate models with Cp, Adjusted R², and BIC.

Model Comparison: Determine which modeling approach (Ridge, LASSO, or feature selection) best balances prediction accuracy and interpretability.

Deliverables

Analysis report following APA format, including:

Title page, introduction, analysis, conclusion, references, and appendix.

Visualizations, tables, and figures to interpret results.

R code included in the appendix for reproducibility.

Conclusion

The project demonstrates the practical application of regularization and feature selection techniques to optimize predictive models, reduce overfitting, and identify important predictors. It highlights the importance of comparing multiple modeling strategies and metrics to select the most effective approach.
