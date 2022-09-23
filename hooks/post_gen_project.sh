#!/bin/sh
echo "Installing dependencies using Poetry"
poetry install

echo "Installing pre-commit"
poetry run pre-commit install

echo "Done!"