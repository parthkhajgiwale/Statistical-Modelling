# ============================================================
# Week 0 — Statistical Modelling (R) Setup + Basics
# Goal: Build a clean, reproducible workflow and refresh core R
# Focus: Packages, data frames, factors, missing values
# ============================================================

# ---- 1) Libraries ----
# tidyverse   : data manipulation + general workflow
# broom       : convert model outputs into tidy tibbles (later weeks)
# car         : diagnostics like VIF (later weeks)
# lmtest      : assumption tests (later weeks)
# performance : diagnostic summaries (later weeks)
library(tidyverse)
library(broom)
library(car)
library(lmtest)
library(performance)

# ---- 2) Create a simple example dataset ----
# x     : numeric predictor
# y     : numeric response
# group : categorical predictor (needs factor type)
df <- data.frame(
  x     = c(1, 2, 3, 4, 5),
  y     = c(2, 4, 5, 4, 5),
  group = c("A", "A", "B", "B", "B")
)

# Quick view of the dataset
df
# Expected output (print):
#   x y group
# 1 1 2     A
# 2 2 4     A
# 3 3 5     B
# 4 4 4     B
# 5 5 5     B

# ---- 3) Convert categorical variables to factor ----
# Why: factors ensure R treats 'group' as categorical in modelling (not as text)
df <- df %>%
  mutate(group = factor(group))

# Verify structure
str(df)
# Expected output (key parts):
# 'data.frame': 5 obs. of  3 variables:
#  $ x    : num  1 2 3 4 5
#  $ y    : num  2 4 5 4 5
#  $ group: Factor w/ 2 levels "A","B": 1 1 2 2 2

# ---- 4) Introduce a missing value (NA) ----
# We intentionally set y at row 3 to NA to simulate real-world data
df$y[3] <- NA

df
# Expected output (note NA in row 3):
#   x  y group
# 1 1  2     A
# 2 2  4     A
# 3 3 NA     B
# 4 4  4     B
# 5 5  5     B

# ---- 5) Handle missing values explicitly ----
# na.omit removes rows with any NA values.
# Interview framing: "I never ignore missingness — I handle it explicitly."
df_clean <- na.omit(df)

df_clean
# Expected output (row 3 removed):
#   x y group
# 1 1 2     A
# 2 2 4     A
# 4 4 4     B
# 5 5 5     B

# ---- 6) Week 0 takeaway (revision note) ----
# - Keep analysis reproducible (structured script + clear comments)
# - Convert categorical variables to factor before modelling
# - Handle missing values explicitly (remove or justify imputation)
# - Next week: fit first linear regression model using lm()
