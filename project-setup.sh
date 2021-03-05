## instal poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

## initialize the project
# cd my_project
poetry init -n
poetry config --local virtualenvs.in-project trueś

## instal dependencies 
poetry add --dev pytest pytest-cov
poetry add --dev black --allow-prereleases
poetry add --dev requests
# poetry add --dev re sys # fails on my local machine
