# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: title,tags,-all
#     cell_metadata_json: true
#     formats: ipynb,R:percent
#     text_representation:
#       extension: .R
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.16.2
#   kernelspec:
#     display_name: R
#     language: R
#     name: ir
# ---

# %% [markdown]
# # R Template

# %% [code]
library(validate)

head(mtcars)


# %% [code]
rules <- validator(
  speed >= 0,
  dist >= 0,
  speed / dist <= 1.5,
  cor(speed, dist) >= 0.2
)

(results <- confront(mtcars, rules))


# %% [code]
class(mtcars$disp)


# %% [code]
rules <- validator(is.character(disp))

(results <- confront(mtcars, rules))


# %% [code]
(summary(results))


# %% [code] {"tags": ["hide-input"]}
print("hidden input cell")
