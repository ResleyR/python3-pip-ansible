FROM python:3.5

RUN apt-get install -y --no-install-recommends ansible \
	&& rm -rf /var/lib/apt/lists/*
RUN pip install setuptools pip --upgrade --force-reinstall
RUN pip install pytest pytest-django pytest-pep8 mock mock-django numpy pandas psycopg2 'django<1.10'
