# ---
# jupyter:
#   jupytext:
#     cell_metadata_filter: title,tags,-all
#     cell_metadata_json: true
#     formats: ipynb,py:percent
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.16.2
#   kernelspec:
#     display_name: Python 3 (ipykernel)
#     language: python
#     name: python3
# ---

# %% [markdown]
#
# # Python Template


# %% [code]
from pydantic import ValidationError, validate_call


class Config:
    strict = True


@validate_call(config=Config)
def test(a: int, b: int) -> int:
    return a + b


try:
    test(1, "1")
except ValidationError as e:
    print("===\nType error???\n===")
    print(e)





# %% [code] {"tags": ["hide-input"]}
print("Hidden code cell")
