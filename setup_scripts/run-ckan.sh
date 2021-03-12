#!/bin/sh

poetry run black . --check --diff
poetry run pytest tests/ckan_test.py