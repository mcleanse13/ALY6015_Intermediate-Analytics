Hypothesis Testing with Chi-Square and ANOVA in R
📘 Project Overview

This project applies Chi-Square and ANOVA statistical methods to investigate relationships among categorical and continuous variables across multiple datasets. The goal is to determine statistical significance, assess independence, and evaluate mean differences between groups using R.

The project encompasses:

Chi-Square tests for goodness-of-fit, independence, and homogeneity.

One-way and two-way ANOVA for comparing group means and assessing interaction effects.

Comprehensive data preparation, exploratory analysis, visualization, and interpretation.

🎯 Purpose and Learning Objectives

The assignment develops practical proficiency in statistical hypothesis testing using R. By completing this project, you will:

Perform Chi-Square tests for different problem contexts.

Conduct one-way and two-way ANOVA to evaluate differences in group means and interactions.

Interpret and communicate statistical outcomes (p-values, F-values, test statistics).

Prepare professional, APA-style analytical reports supported by code, tables, and figures.

Learning Outcomes:

CLO4–CLO7, CLO9: Hypothesis testing using Chi-Square and ANOVA.

Application of data analysis and interpretation using R.

Professional communication of findings and data-driven insights.

🧠 Key Skills Applied

Data preprocessing and exploration with dplyr and tidyverse.

Descriptive statistics and visualizations (histograms, bar charts, scatterplots).

Hypothesis testing using Chi-Square and ANOVA methods.

Interpretation of main and interaction effects in ANOVA.

APA-style statistical reporting and visualization.

🧩 Tools and Methods

Software: R programming language
Libraries Used:

tidyverse (data manipulation and visualization)

dplyr (data wrangling)

ggplot2 (graphical representation)

stats (hypothesis testing functions such as chisq.test and aov)

Statistical Tests Performed:

Chi-Square Tests:

Goodness-of-Fit

Test of Independence

Test for Homogeneity

ANOVA Techniques:

One-Way ANOVA

Two-Way ANOVA (interaction effects)

📊 Project Structure
📁 Chi-Square-ANOVA-Project
│
├── README.md                # Project documentation
├── hypothesis_testing.R     # R script with all analysis steps
├── report.pdf               # APA-style analytical report
├── data/
│   ├── baseball.csv         # Dataset for Chi-Square test
│   ├── crop_data.csv        # Dataset for Two-Way ANOVA
│
└── outputs/
    ├── figures/             # Generated charts and visualizations
    └── tables/              # Summary tables and ANOVA results

⚙️ Project Workflow
1. Data Preparation

Imported and cleaned datasets using read.csv() and dplyr functions.

Derived additional variables (e.g., decade column for baseball data).

Conducted exploratory data analysis (EDA) with summary statistics and plots.

2. Chi-Square Testing

Performed three types of Chi-Square tests:

Goodness-of-Fit: compared observed vs. expected distributions (e.g., blood types, airline performance).

Independence Test: examined relationships between categorical variables (e.g., ethnicity vs. movie admissions, women’s military rank vs. branch).

Interpreted p-values, test statistics, and critical values to evaluate hypotheses.

3. One-Way ANOVA

Analyzed differences in mean sodium levels, company sales, and per-pupil expenditures.

Interpreted ANOVA tables and applied Tukey’s post-hoc test to identify specific group differences.

4. Two-Way ANOVA

Conducted factorial analysis on plant growth experiments.

Tested for main effects (Grow-light, Plant Food) and interaction effects.

Visualized results using bar plots with interaction terms.

5. Additional Applications

Performed Chi-Square Goodness-of-Fit on baseball.csv for wins by decade.

Conducted Two-Way ANOVA on crop_data.csv for yield vs. fertilizer and density.

📈 Sample Visualizations

Chi-Square Distributions: Visualized observed vs. expected frequencies.

ANOVA Results: Displayed group means and interaction plots.

EDA Outputs: Histograms and bar charts summarizing variable distributions.

All visualizations were produced using ggplot2.

🧮 Expected Outcomes

Determine whether categorical variables are independent or follow expected distributions.

Identify statistically significant mean differences between groups.

Understand main and interaction effects in two-way ANOVA.

Develop confidence in executing end-to-end hypothesis testing workflows.

📝 Deliverables

R Script — Contains full analytical workflow, from data import to visualization.

APA-Style Report — Includes:

Title page, introduction, analysis, conclusion, and references.

Tables, figures, and statistical summaries.

Appendix with all R code.

📚 References

Bureau of Transportation Statistics (www.transtats.bts.gov
)

MPAA Study (2014)

New York Times Almanac

The Doctor’s Pocket Calorie, Fat, and Carbohydrate Counter

Course-provided datasets: baseball.csv, crop_data.csv

✅ Learning Takeaways

This project demonstrates applied statistical reasoning, proficiency in R-based data analysis, and the ability to translate quantitative results into structured, professional reports. It emphasizes real-world analytical thinking aligned with business and research decision-making contexts.
