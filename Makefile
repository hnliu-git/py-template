MODULE_FOLDER := py_template


install:
		poetry install

test: install
		poetry run pytest tests

analysis: install
		poetry run flake8 $(MODULE_FOLDER)
		poetry run flake8 tests

tidy: install
		poetry run black --preview $(MODULE_FOLDER)
		poetry run black --preview tests
