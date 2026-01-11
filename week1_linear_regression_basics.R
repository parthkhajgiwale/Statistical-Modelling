# ============================================================
# Week 1 — Linear Regression Basics (R) [JOB-READY]
# Goal: Fit a linear model, interpret coefficients, get CIs,
#       and understand prediction vs inference.
# ============================================================

library(tidyverse)
library(broom)

# ---- 1) Data (use a simple dataset so interpretation is obvious) ----
df <- data.frame(
  x = c(1, 2, 3, 4, 5),
  y = c(2, 4, 5, 4, 5)
)

df
# Expected output:
#   x y
# 1 1 2
# 2 2 4
# 3 3 5
# 4 4 4
# 5 5 5

# ---- 2) Fit a simple linear regression model ----
# Model form: y = beta0 + beta1*x + error
m1 <- lm(y ~ x, data = df)

# ---- 3) Summary (main interview artifact) ----
summary(m1)
# Expected output (structure, not exact numbers):
# Call: lm(formula = y ~ x, data = df)
# Coefficients:
#   (Intercept)           x
#   <number>        <number>
# Multiple R-squared: <number>, Adjusted R-squared: <number>
# p-value: <number>

# ---- 4) Coefficients + confidence intervals ----
coef(m1)
# Expected output:
# (Intercept)           x
# <number>        <number>

confint(m1)
# Expected output (2 columns):
#                 2.5 %   97.5 %
# (Intercept)    <num>   <num>
# x              <num>   <num>

# ---- 5) Prediction vs Inference ----
# Inference: what does beta1 mean? (relationship)
# Prediction: what y do we expect at a new x?

new_points <- data.frame(x = c(2, 6))

# Predicted mean response (best estimate of average y at x)
predict(m1, newdata = new_points)
# Expected output: two numbers (predicted y for x=2 and x=6)

# Prediction interval (uncertainty for a NEW individual observation)
predict(m1, newdata = new_points, interval = "prediction")
# Expected output:
#        fit      lwr      upr
# 1   <num>    <num>    <num>
# 2   <num>    <num>    <num>

# ---- 6) Quick visual check ----
plot(df$x, df$y, main = "Week 1: y vs x")
abline(m1)
# Expected: points + a fitted straight line

# ---- 7) Make results interview-ready using broom ----
tidy(m1)
# Expected output: tibble with terms, estimate, std.error, statistic, p.value

glance(m1)
# Expected output: one-row tibble with r.squared, adj.r.squared, sigma, etc.

# ---- 8) Revision Notes (say these in interviews) ----
# 1) Interpretation:
#    "The slope tells me the expected change in y for a one-unit increase in x."
#
# 2) Prediction vs inference:
#    "Inference explains the relationship; prediction estimates future outcomes."
#
# 3) When linear regression is inappropriate (Week 1 level):
#    - relationship clearly non-linear
#    - strong outliers dominate the fit
#    - residual variance changes wildly across x (we’ll diagnose in Week 4/5)
