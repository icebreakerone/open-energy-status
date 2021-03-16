#!/bin/sh

## install poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

## initialize the project
# cd my_project
poetry init -n
poetry config --local virtualenvs.in-project true

# check the path yto your virtualenv 
poetry env info --path # defines {path_to_venv}
# activate the local virtual env
source {path_to_venv}/bin/activate


## install dependencies
poetry add --dev pytest pytest-cov
poetry add --dev black --allow-prereleases
poetry add --dev requests
# poetry add --dev re sys # fails on my local machine
