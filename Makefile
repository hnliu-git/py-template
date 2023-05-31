pyversion := 3.10
pip := pip$(pyversion)
python := python$(pyversion)

MODULE_FOLDER := py_template

init: pyproject.toml
	$(pip) install --upgrade pip
	command -v poetry || $(pip) install poetry
	poetry env use $(python)

install:
		poetry install

test: install
		poetry run pytest tests --cov

analysis: install
		poetry run flake8 $(MODULE_FOLDER)
		poetry run flake8 tests

tidy: install
		poetry run black --preview $(MODULE_FOLDER)
		poetry run black --preview tests
