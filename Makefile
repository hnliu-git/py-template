MODULE_FOLDER := py_template


install:
		poetry install

test: install
		poetry run pytest tests

