FROM python:3.5

RUN pip install setuptools pip --upgrade --force-reinstall
RUN pip install ansible pytest pytest-django pytest-pep8 mock mock-django numpy pandas psycopg2 'django<1.10'
