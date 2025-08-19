# Multiple Regression Modeling in SAS Using Asphalt Data

# Goal: Use a dataset of asphalt-related values to create prediction for relative endurance of roads.
# Goal: Assess model performance, outliers, and interpretability. 

# Data: Is embedded in SAS code via datalines.

---

# Methods: 
- Initial full model y ~ x1 + x2 + x3 + x4 + x5 + x6 (Significant at 0.05, Adj $R^2$ approx 64%
- Model Selection:
  - Mallow's Cp suggested only x4 as a predictor; rejected due to reliability concerns.
  - Max Adj R-squared (min MSE) suggested x2 - x4 as predictors.
  - Stepwise selection mimicked the above procedure (x4 rejected in favor of x2 - x4)
- Outlier Analysis
  - Analyzed using Cook's D, Leverage, and, Rstudent - recommended to remove one point from the dataset.
- Final Model: Y = -38.23 + 4.53x2 + 5.80x3 – 10.25x4
- Adj R-sq up to 66.85%

# How to Run
  1. Open SAS Studio
  2. Open SAS file
  3. Run Script, procs may be run one at a time to understand flow of project
  
