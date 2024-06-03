alias s := shell
alias r := run
alias t := test
alias c := check
alias f := format

# enter virtual environment
shell:
	poetry install
	poetry shell

# run program in development mode
run: shell
    API_ENVIRONMENT=development uvicorn app.main:app --host=0.0.0.0 --reload

# run all tests
test: shell
	API_ENVIRONMENT=testing pytest

# lint all files
check: shell
	ruff check

# format all files
format: shell
	ruff format
