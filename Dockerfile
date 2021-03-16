#### Build Python and system dependencies ####
# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.6-slim-buster
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1 \
# Turns off buffering for easier container logging
    PYTHONUNBUFFERED=1 \
    PIP_DEFAULT_TIMEOUT=100 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    POETRY_VERSION=1.0.5 \
    NODE_VERSION=12.6.0

    #TODO pass POETRY_VERSION from GH secrets?
# System deps:
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    bash \
    curl
# install npm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

RUN pip install "poetry==$POETRY_VERSION"

# set the working directory to a new folder 
WORKDIR /usr/src/open-energy-status

# cache Python dependencies
COPY poetry.lock pyproject.toml ./

# install dependencies 
RUN poetry config virtualenvs.create false \
  && poetry install --no-interaction --no-ansi